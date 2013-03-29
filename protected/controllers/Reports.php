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
            $timeoffs = $user->getRestDaysById($_GET['id'], $_GET['date'], $_GET['type']);        
        }
        $statuses = $user->getUserStatuses();
        $this->render("Reports/index.tpl" , array('statuses' => $statuses, 'timeoffs' => $timeoffs) );
    }
}
