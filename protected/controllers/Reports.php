<?php
namespace controllers;

use core\Controller;
use models\Users as UsersModel;
use core\FlashMessages;

class Reports extends Controller {

    function indexAction() {
        $this->render("Reports/index.tpl" , array('value' => 2) );
    }

    function timeoffsAction() {
        $user = new UsersModel();
        $flag = False;
        $restDays = array();
        $statuses = $user->GETUserStatuses();
        if (isset($_GET['date']) && isset($_GET['id']) ){
        	$date = $_GET['date'];
        	$id = $_GET['id'];
        	$type = $_GET['type'];
        	$restDays = $user->getRestDaysById($id, $date, $type);
        	if (!$restDays){
        		FlashMessages::addMessage("В этом месяце отгулов нет", "error");
        		$flag = False;
        	} else{
        		$flag = True;
        	}
        		
        }
        $this->render("Reports/index.tpl" , array('statuses' => $statuses, 'otgul' => $flag, 'rest' => $restDays) );
    }

}