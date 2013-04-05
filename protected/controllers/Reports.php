<?php
namespace controllers;

use core\Controller;
use models\Users as UsersModel;
use models\Departments as DepartmentModel;
use core\FlashMessages;

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
            $name = $user->getInfo($_GET['user_id']);
            $name = $name['name'];
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

        $count = $user->getAllRegisteredCount();
        $count = $count['count'];
        $allUsers = $user->getRegistered();

        $allDep = $dep->getMenuDepartments();

        $statuses = $user->getUserStatuses();
        $timeoffsAttr = array('date' => $date, 'name' => $name, 'id' => $id);
        $this->render("Reports/index.tpl" , array('statuses' => $statuses, 'timeoffs' => $timeoffs, 'timeoffsAttr' => $timeoffsAttr, 'allUsers' => $allUsers, 'allDep'=>$allDep, 'timeoffsAllUsers' => $timeoffsAllUsers, 'users'=>$users) );
    }
}
