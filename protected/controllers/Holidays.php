<?php
namespace controllers;

use core\Controller;
use core\FlashMessages;
use models\Holidays as HolidayModel;
use controllers\Main as Time;

class Holidays extends Controller{
    public function indexAction(){
        $holidaysModel = new HolidayModel();
        $time = new Time();

        $date = date("m.Y");
        list($hMonth,$hYear)=explode(".",$date);
        $date=$hYear."-".$hMonth;
        $types = $holidaysModel->getAllName();
        $values = $holidaysModel->getAllType();
        $holidays = $holidaysModel->getAllDays($date);
        if (isset($_GET['date'])){
            $date=$_GET['date'];
            list($hMonth,$hYear)=explode(".",$date);
            $date=$hYear."-".$hMonth;
            $num=date("t",strtotime($date))-1;
            $holidays = $holidaysModel->getAllDays($date);
       }

        if(!empty($_POST)){
            $num=date("t",strtotime($date))-1;
            for($i=0;$i<=$num;$i++){
                if ($holidays[$i]['type'] != $_POST[$i]){
                    $newHolidays[$holidays[$i]['date']]=$_POST[$i];
               }
            }
            $result=array();
            foreach($newHolidays as $newHolidayDate=>$newHoliday){
                list($uDay,$uMonth,$uYear)= explode(".",$newHolidayDate);
                $newHolidayDate=$uYear."-".$uMonth."-".$uDay;
                if($newHoliday!=0){
                    $result[]=$holidaysModel->insert($newHolidayDate,$newHoliday);
                }
                else{
                    $result[]=$holidaysModel->delete($newHolidayDate);
                }
            }
            $insertError=false;
            foreach($result as $flag){
                if($flag==false){
                    $insertError=true;
                }
            }
            
            if(!$insertError){
                FlashMessages::addMessage("Табель успешно отредактирован.", "info");
            }
            else{
                FlashMessages::addMessage("Табель не был отредактирован.", "error");
            }
            $holidays = $holidaysModel->getAllDays($date);
        }
    $date=$hMonth.".".$hYear;
    $this->render("Holidays/index.tpl", array('holidays' => $holidays, 'types' => $types, 'values' => $values, 'date'=>$date));
    }
}