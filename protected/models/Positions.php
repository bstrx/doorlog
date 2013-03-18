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
            VALUES ('$position', NOW())");
        return $add;
    }
}
?>