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
        $user = new UsersModel();
        $flag = false;
        $restDays = array();
        $statuses = $user->getUserStatuses();
        if (isset($_GET['date']) && isset($_GET['id']) && !empty($_GET['date']) && !empty($_GET['id']) ){
        	$date = $_GET['date'];
        	$id = $_GET['id'];
        	$type = $_GET['type'];
        	$restDays = $user->getRestDaysById($id, $date, $type);
        	if (!$restDays){
        		FlashMessages::addMessage("В этом месяце отгулов нет", "error");
        		$flag = false;
        	} else{
        		$flag = true;
        	}		
        }
        $this->render("Reports/index.tpl" , array('statuses' => $statuses, 'otgul' => $flag, 'rest' => $restDays) );
    }
}
