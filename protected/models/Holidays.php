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
    
    public function insertHoliday($month, $new_month){
        if($month['type']!=$new_month['type']){
                $q="SELECT id,
                    date 
                    FROM holiday";
                $result=$this->fetchAll($q);
                foreach($result as $day){
                    if($day['date']==$month['date']){
                        $q="UPDATE holiday
                            SET holiday_type_id=(:type) 
                            WHERE id=(:id)";
                        $params['type']=$new_month['type'];
                        $params['id']=$day['id'];
                        $result=$this->execute($q,$params);
                        return $result;
                    }
                }
                $q="INSERT INTO holiday(date,holiday_type_id)
                    VALUES(:date,:type)";
                $params['date']=$new_month['date'];
                $params['type']=$new_month['type'];
                $result=$this->execute($q,$params);
                return $result;
        }
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