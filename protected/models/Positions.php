<?php

namespace models;
use core\Db;
use core\Model;

class Positions extends Model{
    /**
     * Get from base name and sum of employee whose have this positions
     * @return array
     */
    public function getAll(){
        $q = "SELECT p.name,count(position_id) as total_position,p.id
            FROM position as p
            LEFT JOIN user as u ON u.position_id=p.id
            GROUP BY p.id";
        $result = $this->fetchAll($q);

        return $result;
    }
    
    /**
     * Insert into base new Positions
     * @param string $positionName
     * @return bool
     */
    public function insertPosition($positionName){
        $add= "INSERT INTO `position` (`name`)
            VALUES (:positionName)";
        $params=array();
        $params['positionName']=$positionName;
        $result=$this->execute($add, $params);
        return $result;
    }
    
    /**
     * Get from base one position
     * @param integer $id
     * @return array
     */
    public function getPosition($id){
        $q= "SELECT name,id
            FROM position
            WHERE id=:id";
        $params=array();
        $params['id']=$id;
        $result = $this->fetchOne($q,$params);
        return $result;
    }
    
    /**
     * Update position into base
     * @param integer $id
     * @param name $position
     * @return bool
     */
    public function savePosition($id,$position){
        $edit = "UPDATE position
            SET name=:position
            WHERE id = :id";
        $params=array();
        $params['position']=$position;
        $params['id']=$id;
        $result=$this->execute($edit, $params);
        return $result;
    }
    
    /**
     * Delete position from base
     * @param integer $id
     * @return bool
     */
    public function deletePosition($id){
        $update = "UPDATE user
            SET position_id=0
            WHERE position_id=:id";
        $delete ="DELETE
            FROM position
            WHERE id=:id";
        $params = array();
        $params['id']=$id;
        $update = $this->execute($update, $params);
        $result = false;
        if ($update) {
            $result = $this->execute($delete, $params);
        }

        return $result;
    }
}
?>