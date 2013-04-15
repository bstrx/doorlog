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
        $date=$hMonth.".".$hYear;
        if (isset($_GET['date'])){
            $date=$_GET['date'];
            list($hMonth,$hYear)=explode(".",$date);
            $date=$hYear."-".$hMonth;
            $num=date("t",strtotime($date))-1;
            $holidays = $obj->getAllDays($date);
            if(isset($_POST['0'])){
                $num=date("t",strtotime($date))-1;
                for($i=0;$i<=$num;$i++){
                    $newHolidays[$i]['type'] = $_POST[$i];
                    $newHolidays[$i]['date'] = $holidays[$i]['date'];
                }
                $result=array();
                for($i=0;$i<=$num;$i++){
                    if($holidays[$i]['type']!=$newHolidays[$i]['type']){
                        list($uDay,$uMonth,$uYear)= explode(".",$newHolidays[$i]['date']);
                        $newHolidays[$i]['date']=$uYear."-".$uMonth."-".$uDay;
                        if($newHolidays[$i]['type']!=0){
                            $result[]=$obj->insert($newHolidays[$i]['date'],$newHolidays[$i]['type']);
                        }
                        else{
                            $result[]=$obj->delete($newHolidays[$i]['date']);
                        }
                    }
                }
                $insertError=false;
                foreach($result as $flag){
                    if($flag==false){
                        $insertError=true;
                    }
                }
                if(!$insertError){
                     FlashMessages::addMessage("Табель успешно отредактирован.", "success");
                }
                else{
                    FlashMessages::addMessage("Табель не был отредактирован.", "error");
                }
                $holidays = $obj->getAllDays($date);
            }
            $date=$hMonth.".".$hYear;
        }
        $this->render("Holidays/index.tpl", array('holidays' => $holidays, 'types' => $types, 'values' => $values, 'date'=>$date));
    }
}