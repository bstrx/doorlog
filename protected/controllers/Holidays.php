<?php
namespace controllers;

use core\Controller;
use core\FlashMessages;
use models\Holidays as HolidayModel;
use controllers\Main as Time;

class Holidays extends Controller{
    public function indexAction(){
        $obj = new HolidayModel();
        $time = new Time();
        
        $date = date("m.Y");
        list($hMonth,$hYear)=explode(".",$date);
        $date=$hYear."-".$hMonth;
        $types = $obj->getAllName();
        $values = $obj->getAllType();
        $holidays = $obj->getAllDays($date);
        if (isset($_GET['date'])){
            $date=$_GET['date'];
            list($hMonth,$hYear)=explode(".",$date);
            $date=$hYear."-".$hMonth;
            $num=date("t",strtotime($date))-1;
            $holidays = $obj->getAllDays($date);
            
        }
        if(!empty($_POST)){
            $num=date("t",strtotime($date))-1;
            for($i=0;$i<=$num;$i++){
                if ($holidays[$i]['type'] != $_POST[$i]){
                    $newHolidays[$holidays[$i]['date']]=$_POST[$i];
               }
            }
            $result=array();
            foreach($newHolidays as $key=>$newHoliday){
                list($uDay,$uMonth,$uYear)= explode(".",$key);
                $key=$uYear."-".$uMonth."-".$uDay;
                if($newHoliday!=0){
                    $result[]=$obj->insert($key,$newHoliday);
                }
                else{
                    $result[]=$obj->delete($key);
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
            $holidays = $obj->getAllDays($date);
        }
        $date=$hMonth.".".$hYear;
        $this->render("Holidays/index.tpl", array('holidays' => $holidays, 'types' => $types, 'values' => $values, 'date'=>$date));
    }
}