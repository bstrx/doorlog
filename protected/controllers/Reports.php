<?php
namespace controllers;
use core\Acl;
use core\Controller;
use models\Users as UsersModel;
use models\Departments as DepartmentModel;
use core\FlashMessages;
use models\Reports as ReportsModel;
use controllers\Main as Time;
use models\Holidays as Holidays;

class Reports extends Controller {

    function indexAction() {
        if(!Acl::checkPermission('reports')){
            $this->render("errorAccess.tpl");
        }
        $this->render("Reports/index.tpl");
    }

    function timeoffsAction() {
        if(!Acl::checkPermission('timeoffs_reports')){
            $this->render("errorAccess.tpl");
        }
        $timeoffs = array();
        $users = array();
        $reportAllDaysArray = array();
        $name = array();

        $timeoffsAllUsers = array();
        $user = new UsersModel();
        $dep = new DepartmentModel();
        $date = date('m-Y');
        $id = '';
        if (isset($_GET['date']) && !empty($_GET['date'])){
            $date = $_GET['date'];
            $date = strtotime(strrev(strrev($date).'.10'));
            $date = date('Y-m', $date);
            if (isset($_GET['user_id']) && $_GET['user_id'] != 0 ){
                $reportAllDaysArray = $this->getMonthReport($_GET['user_id'], $date, $_GET['type']);
                $userInfo = $user->getInfo($_GET['user_id']);
                $name['user'] = $userInfo['name'];
                $id = $_GET['user_id'];
            }

            if (isset($_GET['dep_id']) && $_GET['dep_id'] != 0 ){
                $depInfo = $dep->getDepById($_GET['dep_id']);
                $name['dep'] = $depInfo['name'];
                $users = $dep->getUsers($_GET['dep_id']);
                foreach ($users as $currentUser) {
                    $timeoffsAllUsers[] = array('reports' => $this->getMonthReport($currentUser['id'], $date, $_GET['type']),
                        'id' => $currentUser['id'],
                        'name' => $currentUser['name']);
                }
            }
        }
        $allUsers = $user->getRegistered();
        $allDep = $dep->getMenuDepartments();
        $statuses = $user->getUserStatuses();
        $timeoffsAttr = array('date' => $date, 'name' => $name, 'id' => $id);
        $this->render("Reports/timeoffs_list.tpl" , array('statuses' => $statuses,
            'timeoffsAttr' => $timeoffsAttr,
            'allUsers' => $allUsers,
            'allDep'=>$allDep,
            'timeoffsAllUsers' => $timeoffsAllUsers,
            'users'=>$users,
            'reportAllDaysArray' => $reportAllDaysArray,
            'name' => $name));
    }

    function officeloadAction() {
        if(!Acl::checkPermission('officeload_reports')){
            $this->render("errorAccess.tpl");
        }
        $obj = new ReportsModel;

        if (isset($_GET['date'])) {
            $date = $_GET['date'];
        } else {
            $date = date('Y-m-d');
        }

        $desiredDate = $obj->getTimesList($date);

        $sortedTimes = array();
        $stringForGraph = "";
        foreach ($desiredDate as $hour) {
            $sortedTimes[$hour['hour']] = $hour['count'];
        }
        for ($i = 0; $i <= 23; $i++) {
            if (isset($sortedTimes[$i])) {
                $entersCount = $sortedTimes[$i];
            } else {
                $entersCount = 0;
            }
            $stringForGraph .= "[".$i.",".$entersCount."]".",";
        }
        $stringForGraph = "[".substr($stringForGraph, 0, -1)."]";
        $this->render("Reports/officeload.tpl", array('date' => $date,
                                                      'stringForGraph' => $stringForGraph));
    }

    public function getMonthReport($id, $selectedDate, $timeoffType){
        $user = new UsersModel();
        $dep = new DepartmentModel();
        $monthTime = new Time();
        $Holidays = new Holidays();

        $timeoffsArray = array();
        $userMonthTimeArray = array();
        $reportAllDaysArray = array();
        $vacation = array();

        $firstMonthDay = strtotime($selectedDate);
        $lastMonthDay = strtotime($selectedDate) + date("t", strtotime($selectedDate))*24*60*60 ;
        $vacation = $Holidays->getAllDays($selectedDate);

        $timeoffs = $user->getTimeoffsById($id, $selectedDate, $timeoffType);
        foreach ($timeoffs as $timeOff) {
            $timeoffsArray[$timeOff['date']]['name'] = $timeOff['name'];
        }

        for ($i=0; $i < count($vacation); $i++) {
            $curr = $vacation[$i]['date'];
            $curr = strtotime($curr);
            $curr = date('Y-m-d', $curr);
            $currVacation[$curr] = $vacation[$i];
        }

        $personalId = $user->getPersonalId($id);
        if ($personalId){
            $userMonthTime = $monthTime->getMonthInfo($personalId, $selectedDate);
            if (isset($userMonthTime['days'])){
                $userMonthTime = $userMonthTime['days'];
                $workDays = array_keys($userMonthTime);
                foreach ($workDays as $workDay) {
                    $userMonthTimeArray[$workDay]['time'] = $userMonthTime[$workDay]['sum'];
                }
            }

            for ($date = $firstMonthDay; $date < $lastMonthDay; $date += 86400) {
                $currentDate = date('Y-m-d', $date);
                $oneDay = array('date'=> $currentDate,
                    'dayName' => strftime("%A", $date),
                    'timeoffName' => '',
                    'time' => 0,
                    'dayType' => $oneDay['dayType'] = (int)$currVacation[$currentDate]['type']);
                if(isset($timeoffsArray[$currentDate])){
                    $oneDay['timeoffName'] = $timeoffsArray[$currentDate]['name'];
                    $oneDay['dayType'] = (int)$currVacation[$currentDate]['type'];
                }

                if(isset($userMonthTimeArray[$currentDate])){
                    $oneDay['timeoffName'] = '--';
                    $oneDay['time'] = $userMonthTimeArray[$currentDate]['time'];
                }
                    $reportAllDaysArray[$currentDate] = $oneDay;
            } 
        }
    return $reportAllDaysArray;
    }
}
