<?php

namespace controllers;

use core\Controller;
use models\Users as UsersModel;
use core\FlashMessages;
use models\Reports as ReportsModel;

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


    public function getDate() {
        if (!empty($_GET['date'])) {
            $unixtime = strtotime($_GET['date']);
            $date = date('Y-m-d', $unixtime);
        } else
            $date = date('Y-m-d');

        return $date;
    }

    function loadofficeAction() {
        $obj = new ReportsModel;

        if (isset($_GET['date'])) {
            $date = $_GET['date'];
        } else {
            $date = $this->getDate();
        }

        $desiredDate = $obj->getTimesList($date);

        $null = 0;

        $sortedTimes = array();
        $stringForGraph = "";
        foreach ($desiredDate as $hour) {
            $sortedTimes[$hour['hour']] = $hour['count'];
        }
        for ($i = 0; $i <= 23; $i++) {
            if (!empty($sortedTimes[$i])) {
                $stringForGraph .= "[" . $i . "," . $sortedTimes[$i] . "]" . ",";
            } else {
                $stringForGraph .= "[" . $i . "," . $null . "]" . ",";
            }
        }
        $stringForGraph = "[".substr($stringForGraph, 0, -1)."]";
        $this->render("Reports/loadoffice.tpl", array('date' => $date,
                                                      'stringForGraph' => $stringForGraph));
    }
}
