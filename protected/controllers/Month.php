<?php
namespace controllers;

use core\Controller;
use core\FlashMessages;
use models\Month as MonthModel;
use models\Holidays as HolidayModel;
class Month extends Controller{
    public function indexAction(){
        $date=date("Y-m");
        if(isset($_GET['date'])){
            $date=$_GET['date'];
        }
        $holidayModels = new HolidayModel();
        $holiday = $holidayModels->getAllDays($date);
        $sum=0;
        foreach($holiday as $day){
            if ($day['type']!=1){
                $sum++;
            }
        }
        $this->render("Month/index.tpl",array('sum'=>$sum, 'date'=>$date));
    }
}