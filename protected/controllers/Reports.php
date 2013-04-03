<?php
namespace controllers;

use core\Controller;
use models\Users as UsersModel;
use core\FlashMessages;

class Reports extends Controller {

    function indexAction() {
        $this->render("Reports/index.tpl");
    }

    function timeoffsAction() {
        $flag = false;
        $timeoffs = array();
        $user = new UsersModel();
        if (isset($_GET['date']) && isset($_GET['id']) && !empty($_GET['date']) && !empty($_GET['id']) ){
            $timeoffs = $user->getTimeoffsById($_GET['id'], $_GET['date'], $_GET['type']);
            $date = $_GET['date'];
            $name = $user->getInfo($_GET['id']);
            $name = $name['name'];
            $id = $_GET['id'];
        } else {
            $name = "";
            $date = date('Y-m');
            $id = '';
        }
        $statuses = $user->getUserStatuses();
        $timeoffsAttr = array('date' => $date, 'name' => $name, 'id' => $id);
        $this->render("Reports/index.tpl" , array('statuses' => $statuses, 'timeoffs' => $timeoffs, 'timeoffsAttr' => $timeoffsAttr) );
    }
}
