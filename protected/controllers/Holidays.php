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
        
        $types = array('Выходной','Короткий','Рабочий');
        $values = $obj->getAllType();
        if(isset($_POST[$holidays['0']['date']])){
            $num = date("t",strtotime(substr($date,0,-2)))-2;
            for($i=0;$i<=$num;$i++){
               $newHolidays[$i]['type'] = $_POST[$holidays[$i]['date']];
               $newHolidays[$i]['date'] = $holidays[$i]['date'];
            }
            for($i=0;$i<=$num;$i++){
               $result[]=$obj->insertHoliday($holidays[$i], $newHolidays[$i]);
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