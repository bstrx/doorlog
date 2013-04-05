<?php
namespace controllers;
use core\Controller;
use models\Users as UsersModel;
use models\Departments as DepartmentModel;
use core\FlashMessages;
use models\Reports as ReportsModel;

class Reports extends Controller {

    function indexAction() {
        $this->render("Reports/index.tpl");
    }

    function timeoffsAction() {
        $timeoffs = array();
        $users = array();
        $timeoffsAllUsers = array();
        $user = new UsersModel();
        $dep = new DepartmentModel();
        if (isset($_GET['date']) && isset($_GET['user_id']) && !empty($_GET['date']) && $_GET['user_id'] != 0 ){
            $timeoffs = $user->getTimeoffsById($_GET['user_id'], $_GET['date'], $_GET['type']);
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
        $this->render("Reports/index.tpl" , array('statuses' => $statuses, 'timeoffs' => $timeoffs, 'timeoffsAttr' => $timeoffsAttr, 'allUsers' => $allUsers, 'allDep'=>$allDep, 'timeoffsAllUsers' => $timeoffsAllUsers, 'users'=>$users) );
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
