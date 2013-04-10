<?php
namespace controllers;
use core\Controller;
use models\Users as UsersModel;
use models\Departments as DepartmentModel;
use core\FlashMessages;
use models\Reports as ReportsModel;
use controllers\Main as Time;

class Reports extends Controller {

    function indexAction() {
        $this->render("Reports/index.tpl");
    }

    function timeoffsAction() {
        $timeoffs = array();
        $users = array();
        $reportAllDaysArray = array();

        $timeoffsAllUsers = array();
        $user = new UsersModel();
        $dep = new DepartmentModel();

        if (isset($_GET['date']) && isset($_GET['user_id']) && !empty($_GET['date']) && $_GET['user_id'] != 0 ){
            $reportAllDaysArray = $this->getMonthReport($_GET['user_id'], $_GET['date'], $_GET['type']);
            $date = $_GET['date'];
            $userInfo = $user->getInfo($_GET['user_id']);
            $name = $userInfo['name'];
            $id = $_GET['user_id'];
        } else {
            $name = "";
            $date = date('Y-m');
            $id = '';
        }

        if (isset($_GET['date']) && isset($_GET['dep_id']) && !empty($_GET['date']) && $_GET['dep_id'] != 0 ){
            $users = $dep->getUsers($_GET['dep_id']);
            foreach ($users as $currentUser) {
                $timeoffsAllUsers[] = array('reports' => $this->getMonthReport($currentUser['id'], $_GET['date'], $_GET['type']),
                                            'id' => $currentUser['id'],
                                            'name' => $currentUser['name']);
            }
            $date = $_GET['date'];
        } else {
            $date = date('Y-m');
        }
        $allUsers = $user->getRegistered();
        $allDep = $dep->getMenuDepartments();
        $statuses = $user->getUserStatuses();
        $timeoffsAttr = array('date' => $date, 'name' => $name, 'id' => $id);
        $this->render("Reports/index.tpl" , array('statuses' => $statuses,
                                                  'timeoffsAttr' => $timeoffsAttr,
                                                  'allUsers' => $allUsers,
                                                  'allDep'=>$allDep,
                                                  'timeoffsAllUsers' => $timeoffsAllUsers,
                                                  'users'=>$users,
                                                  'reportAllDaysArray' => $reportAllDaysArray));
    }

    function officeloadAction() {
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

        $timeoffsArray = array();
        $userMonthTimeArray = array();
        $reportAllDaysArray = array();

        $firstMonthDay = strtotime($selectedDate);
        $lastMonthDay = strtotime($selectedDate) + date("t", strtotime($selectedDate))*24*60*60 ;

        $timeoffs = $user->getTimeoffsById($id, $selectedDate, $timeoffType);
        foreach ($timeoffs as $timeOff) {
            $timeoffsArray[$timeOff['date']]['name'] = $timeOff['name'];
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
                $oneDay = array('date'=> $currentDate, 'timeoffName' => 'Пусто', 'time' => 0);
                if(isset($timeoffsArray[$currentDate])){
                    $oneDay['timeoffName'] = $timeoffsArray[$currentDate]['name'];
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
