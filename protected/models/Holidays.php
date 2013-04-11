<?php
namespace models;
use core\Db;
use core\Model;

class Holidays extends Model{
    public function getMonthDays($date){
        $uDay = 24*60*60;
        $date=date("Y-m",strtotime($date));
        $mDay = strtotime(date("Y-m",strtotime($date)));
        $num = date("t",$mDay)-1;
        $first = date("w",strtotime($date));
        $uTime = strtotime($date);
        $uMonthFirstDay = $uTime;
        $uOffsetDay = $uMonthFirstDay+$num*$uDay;
        $days = $uMonthFirstDay;
        while($days<=$uOffsetDay){
            $type = 0;
            $date = date("Y-m-d", $days);
            $name = strftime("%A", $days);
            $month[] = array("days" =>$name, "date" => $date,"type" => $type);
            $days = $days + $uDay;
        }
        return $month;
    }

    public function insertInBaseHoliday($date, $type){
        $q="INSERT INTO holiday(date,holiday_type_id)
            VALUES(:date, :iType)
            ON DUPLICATE KEY UPDATE 
            holiday_type_id = :uType";
        $params['date']=$date;
        $params['iType']=$type;
        $params['uType']=$type;
        $result=$this->execute($q,$params);
        return $result;
    }

    public function deleteInBaseHoliday($date){
        $q="DELETE FROM holiday 
            WHERE date=(:date)";
        $params['date']=$date;
        $result=$this->execute($q,$params);
        return $result;
    }

    public function insertHoliday($holiday, $newHoliday){
        if($holiday['type']!=$newHoliday['type']){
            if ($newHoliday['type']!=0){
            $result=$this->insertInBaseHoliday($newHoliday['date'],$newHoliday['type']);
            }
            else{
                $result = $this->deleteInBaseHoliday($newHoliday['date']);
            }
        return $result;
    }
        return 1;
    }

    public function getAllDays($date){
        $month = $this->getMonthDays($date);
        $num = date("t",strtotime(substr($date,0,-2)))-2;
        $uFirst = $month[0]['date'];
        $uLast = $month[$num]['date'];
        $q="SELECT date,
            holiday_type_id
            FROM holiday 
            WHERE date>='$uFirst' 
            AND date<='$uLast'";
        $result = $this->fetchAll($q);
        for ($i=0;$i<=$num;$i++){
            foreach ($result as $holiday){
                if ($month[$i]['date']==$holiday['date']){
                   $month[$i]['type']=$holiday['holiday_type_id'];
                }
            }
        }
        return $month;
    }

    public function autoHoliday($date){
        $month=$this->getMonthDays($date);
        $num = date("t",$mDay)-1;
        for($i=0;$i<=$num;$i++){
            if ($month[$i]['days']=="Суббота" or $month[$i]['days']=="Воскресенье"){
                $result=$this->insertInBaseHoliday($date, 2);
            }
        }
    }

    public function getAllType(){
        $q="SELECT id
            FROM holiday_type";
        $holiday=$this->fetchAll($q);
        $holiday[]['id']=0;
        foreach ($holiday as $type){
            $result[]=$type['id'];
        }
        return $result;
    }
}