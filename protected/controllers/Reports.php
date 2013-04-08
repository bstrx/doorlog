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

            $date1 = strtotime($_GET['date']);
            $date2 = strtotime($_GET['date']) + date("t", strtotime($_GET['date']))*24*60*60 ;
            $timeoffs = $user->getTimeoffsById($_GET['user_id'], $_GET['date'], $_GET['type']);
            $personalId = $user->getPersonalId($_GET['user_id']);
            $userMonthTime = $monthTime->getMonthInfo($personalId, $_GET['date']);
            $workDays = array_keys($userMonthTime['days']);

            for ($date = $date1; $date < $date2; $date += 86400) {
                for ($j=0; $j<count($timeoffs); $j++) {
                    if ($timeoffs[$j]['date'] == date('Y-m-d', $date)){
                        $report[date('y-m-d', $date)]['date'] = date('y-m-d', $date);
                        $report[date('y-m-d', $date)]['user_id'] = $timeoffs[$j]['user_id'];
                        $report[date('y-m-d', $date)]['timeoffName'] = $timeoffs[$j]['name'];
                        $report[date('y-m-d', $date)]['time'] = 0;
                        break;
                    } else {
                        $report[date('y-m-d', $date)]['date'] = date('y-m-d', $date);
                        $report[date('y-m-d', $date)]['user_id'] = $timeoffs[$j]['user_id'];
                        $report[date('y-m-d', $date)]['timeoffName'] = 'Пусто';
                        $report[date('y-m-d', $date)]['time'] = 0;
                    }
                }
            }

            for ($date = $date1; $date < $date2; $date += 86400) {
                for ($j=0; $j<count($workDays) ; $j++) {
                    if ($workDays[$j] == date('Y-m-d', $date)) {
                        $report[date('y-m-d', $date)]['date'] = date('y-m-d', $date);
                        $report[date('y-m-d', $date)]['user_id'] = 6;
                        $report[date('y-m-d', $date)]['timeoffName'] = '--';
                        $report[date('y-m-d', $date)]['time'] = $userMonthTime['days'][date('Y-m-d', $date)]['sum'];
                    }
                }
            }

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
            for ($i=0; $i < count($users) ; $i++) {
                $timeoffsAllUsers[$i]['timeoffs'] = $user->getTimeoffsById($users[$i]['id'], $_GET['date'], $_GET['type']);
                $timeoffsAllUsers[$i]['id'] = $users[$i]['id'];
                $timeoffsAllUsers[$i]['name'] = $users[$i]['name'];
            }
            $date = $_GET['date'];
        } else {
            $date = date('Y-m');
        }

        $allUsers = $user->getRegistered();

        $allDep = $dep->getMenuDepartments();

        $statuses = $user->getUserStatuses();
        $timeoffsAttr = array('date' => $date, 'name' => $name, 'id' => $id);
        $this->render("Reports/index.tpl" , array('statuses' => $statuses, 'timeoffsAttr' => $timeoffsAttr, 'allUsers' => $allUsers, 'allDep'=>$allDep, 'timeoffsAllUsers' => $timeoffsAllUsers, 'users'=>$users, 'report' => $report) );
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
