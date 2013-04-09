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

        $report = array();

        $timeoffsAllUsers = array();
        $user = new UsersModel();
        $dep = new DepartmentModel();
        $monthTime = new Time();

        if (isset($_GET['date']) && isset($_GET['user_id']) && !empty($_GET['date']) && $_GET['user_id'] != 0 ){
            $selectedDate = $_GET['date'];
            $firstMonthDay = strtotime($selectedDate);
            $lastMonthDay = strtotime($selectedDate) + date("t", strtotime($selectedDate))*24*60*60 ;
            $timeoffs = $user->getTimeoffsById($_GET['user_id'], $selectedDate, $_GET['type']);
            $personalId = $user->getPersonalId($_GET['user_id']);
            if ($personalId){

            $userMonthTime = $monthTime->getMonthInfo($personalId, $selectedDate);
            $workDays = array_keys($userMonthTime['days']);

            for ($date = $firstMonthDay; $date < $lastMonthDay; $date += 86400) {
                $currentDate = date('y-m-d', $date);
                for ($j=0; $j<count($timeoffs); $j++) {
                    if ($timeoffs[$j]['date'] == date('Y-m-d', $date)){
                        $report[$currentDate]['date'] = $currentDate;
                        $report[$currentDate]['user_id'] = $timeoffs[$j]['user_id'];
                        $report[$currentDate]['timeoffName'] = $timeoffs[$j]['name'];
                        $report[$currentDate]['time'] = 0;
                        break;
                    } else {
                        $report[$currentDate]['date'] = $currentDate;
                        $report[$currentDate]['user_id'] = $timeoffs[$j]['user_id'];
                        $report[$currentDate]['timeoffName'] = 'Пусто';
                        $report[$currentDate]['time'] = 0;
                    }
                }
            }

            for ($date = $firstMonthDay; $date < $lastMonthDay; $date += 86400) {
                $currentDate = date('y-m-d', $date);
                for ($j=0; $j<count($workDays) ; $j++) {
                    if ($workDays[$j] == date('Y-m-d', $date)) {
                        $report[$currentDate]['date'] = $currentDate;
                        $report[$currentDate]['user_id'] = 6;
                        $report[$currentDate]['timeoffName'] = '--';
                        $report[$currentDate]['time'] = $userMonthTime['days'][date('Y-m-d', $date)]['sum'];
                    }
                }
            }
        } else {
            FlashMessages::addMessage("Пользователь с данным id не найден", "error");
        }

            $date = $selectedDate;
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
            $selectedDate = $_GET['date'];
            for ($i=0; $i < count($users) ; $i++) {
                $timeoffsAllUsers[$i]['timeoffs'] = $user->getTimeoffsById($users[$i]['id'], $selectedDate, $_GET['type']);
                $timeoffsAllUsers[$i]['id'] = $users[$i]['id'];
                $timeoffsAllUsers[$i]['name'] = $users[$i]['name'];
            }
            $date = $selectedDate;
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
        'report' => $report) );
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
}
