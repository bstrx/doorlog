<?php
namespace controllers;

use core\Controller;
use core\FlashMessages;
use models\Holidays as Holidaymodel;
use controllers\Main as Time;

class Holidays extends Controller{
    public function indexAction(){
        $time = new Time();
        
        $date = date("Y-m-d");
        $obj = new Holidaymodel();
        $holiday = $obj->GetAllDays($date);
        
        $this->render("Holidays/index.tpl", array('holidays' => $holiday));
    }
}