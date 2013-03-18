<?php

namespace models;
use core\Db;
use core\Model;

class Positions extends Model{
    public function getAll(){
        $q = "SELECT d.name,count(position_id) as total_position
            FROM position as d
            LEFT JOIN user as u ON u.position_id=d.id
            GROUP BY d.id";
        $result = $this->fetchAll($q);

        return $result;
    }

    public function insertPosition($position){
        $db = Db::getInstance();
        $add= $db->query("INSERT INTO position(name)
            VALUES ('$position')");
        return $add;
    }
    public function getPos($id){
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
    public function updatePosition($id){
        $db = Db::getInstance();
        $update = $db->query("UPDATE user
            SET position_id=0
            WHERE position_id='$id");
        print $update;
        return $update;
    }
    public function deletePosition($id){
        $db = Db::getInstance();
        $delete =$db->query("DELETE * 
            FROM position
            WHERE id='$id'");
        return $delete;
    }
}
?>