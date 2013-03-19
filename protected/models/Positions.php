<?php

namespace models;
use core\Db;
use core\Model;

class Positions extends Model{
    public function getAll(){
        $q = "SELECT p.name,count(position_id) as total_position,p.id
            FROM position as p
            LEFT JOIN user as u ON u.position_id=p.id
            GROUP BY p.id";
        $result = $this->fetchAll($q);

        return $result;
    }

    public function insertPosition($positionName){
        $db = Db::getInstance();
        $add= $db->query("INSERT INTO `position` (`name`)
            VALUES ('$positionName')");
        return $add;
    }
    public function getPosition($id){
        $q= "SELECT name,id
            FROM position
            WHERE id='$id'";
        $result = $this->fetchOne($q);
        return $result;
    }
    public function savePosition($id,$position){
        $db = Db::getInstance();
        $edit = $db->query("UPDATE position
            SET name='$position' 
            WHERE id = '$id'");
        return $edit;
    }
    public function deletePosition($id){
        $db = Db::getInstance();
        $update = $db->query("UPDATE user
            SET position_id=0
            WHERE position_id='$id'");
        $delete =$db->query("DELETE 
            FROM position
            WHERE id='$id'");

        return $delete;
    }
}
?>