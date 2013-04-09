<?php
namespace controllers;

use core\Controller;
use core\FlashMessages;
use models\Holidays as HolidayModel;
use controllers\Main as Time;

class Holidays extends Controller{
    public function indexAction(){
        $time = new Time();
        
        $date = date("Y-m-d");
        $obj = new HolidayModel();
        $holidays = $obj->getAllDays($date);
        
        $types = array('Рабочий','Выходной','Короткий');
        $values = array('0','1','2');
        if(isset($_POST[$holidays['0']['date']])){
            $num = date("t",strtotime(substr($date,0,-2)))-2;
            for($i=0;$i<=$num;$i++){
               $new_holidays[$i]['type'] = $_POST[$holidays[$i]['date']];
               $new_holidays[$i]['date'] = $holidays[$i]['date'];
            }
            for($i=0;$i<=$num;$i++){
               $result[]=$obj->insertHoliday($holidays[$i], $new_holidays[$i]);
            }
            if($result){
                 FlashMessages::addMessage("Табель успешно отредактирован.", "info");
            }
            else{
                FlashMessages::addMessage("Табель не был отредактирован.", "error");
            }
            $holidays = $obj->getAllDays($date);
        }
        $this->render("Holidays/index.tpl", array('holidays' => $holidays, 'types' => $types, 'values' => $values));
    }
}