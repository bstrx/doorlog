<?php

namespace models;
use core\Db;
use core\Model;

class Departments extends Model {
    public function getAll(){
        $q = "SELECT
              d.id,
              d.name,
              count(personal_id) as total_users,
              t.name as chief_name
            FROM departments as d
            LEFT JOIN users as u ON u.department_id = d.id
            LEFT JOIN `tc-db-main`.personal as t ON d.chief_id = t.id
            GROUP BY d.id";

        $result = $this->fetchAll($q);
return $result;
    }

    public function getMenuDepartments(){
        $q = "SELECT name, id
              FROM departments";

        $result = $this->fetchAll($q);
        return $result;
    }

    public function createDep($depName){
          $obj = Db::getInstance();
          $result = $obj->query("INSERT INTO departments(name) VALUES('$depName')");

          return $result;
      }

    public function getUsers($depId){
        $depId = (int) $depId;
        $q = "SELECT p.name
            FROM `tc-db-main`.personal as p
            LEFT JOIN `savage-db`.users as u
            ON u.personal_id = p.id
            WHERE u.department_id = " . $depId;

        $result = $this->fetchAll($q);
        return $result;
    }
}
