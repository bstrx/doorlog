<?php
namespace controllers;

use core\Controller;
use core\FlashMessages;
use models\Holidays as HolidayModel;
use controllers\Main as Time;

class Holidays extends Controller{
    public function indexAction(){
        $time = new Time();
        
        $date = date("Y-m");
        if (isset($_GET['date'])){
            $date=$_GET['date'];
            list($hMonth,$hYear)=explode(".",$date);
            $date=$hYear."-".$hMonth;
            $obj = new HolidayModel();
            $holidays = $obj->getAllDays($date);
        
            $types = $obj->getAllName();
            $values = $obj->getAllType();
            if(isset($_POST[$holidays['0']['date']])){
                $num=date("t",strtotime($date))-1;
                for($i=0;$i<=$num;$i++){
                    $newHolidays[$i]['type'] = $_POST[$holidays[$i]['date']];
                    $newHolidays[$i]['date'] = $holidays[$i]['date'];
                }
                $result=array();
                for($i=0;$i<=$num;$i++){
                    if($holidays[$i]['type']!=$newHolidays[$i]['type']){
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
                     FlashMessages::addMessage("Табель успешно отредактирован.", "info");
                }
                else{
                    FlashMessages::addMessage("Табель не был отредактирован.", "error");
                }
                $holidays = $obj->getAllDays($date);
            }
        }
        else{
            $holidays=0;
            $types=0;
            $values=0;
        }
        $date=$hMonth.".".$hYear;
        $this->render("Holidays/index.tpl", array('holidays' => $holidays, 'types' => $types, 'values' => $values, 'date'=>$date));
    }
}