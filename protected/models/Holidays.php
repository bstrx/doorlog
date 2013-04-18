<?php
namespace models;
use core\Db;
use core\Model;

class Holidays extends Model{

    /**
     * Forms array of weekday name, date, type holidays, triggers for a month
     * @param string $date
     * @return array month
     */
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
            $trigger=0;
            $date = date("d.m.Y", $days);
            $name = strftime("%A", $days);
            if (date("w",$days)==0 or date("w",$days)==6){
                $trigger=1;
            }
            $month[] = array("days" =>$name, "date" => $date,"type" => $type,"trigger"=>$trigger);
            $days = $days + $uDay;
        }
        return $month;
    }

    /**
     * Insert into base new holidays or update
     * @param string $date
     * @param integer $type
     * @return bool
     */
    public function insert($date, $type){
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

    /**
     * Delete from base holidays
     * @param string $date
     * @return bool
     */
    public function delete($date){
        $q="DELETE FROM holiday 
            WHERE date=(:date)";
        $params['date']=$date;
        $result=$this->execute($q,$params);
        return $result;
    }
    
    /**
     * Get from base holidays and with support function getMonthDays forms array
     * weekday name, date, type holidays, triggers for a month
     * @param string $date
     * @return array
     */
    public function getAllDays($date){
        $month = $this->getMonthDays($date);
        $num = date("t",strtotime($date))-1;
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
                list($hDay,$hMonth,$hYear)=explode(".",$month[$i]["date"]);
                $hDate=$hYear."-".$hMonth."-".$hDay;
                if ($hDate==$holiday['date']){
                   $month[$i]['type']=$holiday['holiday_type_id'];
                }
            }
        }
        return $month;
    }
    /**
     * Get from base all type of holdays
     * @return array
     */
    public function getAllType(){
        $q="SELECT id
            FROM holiday_type";
        $holiday=$this->fetchAll($q);
        foreach ($holiday as $type){
            $result[]=$type['id'];
        }
        return $result;
    }
    /**
     * Get from base all name of type holidays
     * @return array
     */
    public function getAllName(){
        $q="SELECT name
            FROM holiday_type";
        $holiday=$this->fetchAll($q);
        foreach($holiday as $name){
            $result[]=$name['name'];
        }
        return $result;
    }
}