<?php

namespace models;
use core\Db;

class Departments extends \core\Model {
    function getAll(){
      $q = "SELECT d.name, count(personal_id) as total_users, t.name as chief_name
            FROM departments as d
            LEFT JOIN users as u
            ON u.department_id = d.id
            LEFT JOIN `tc-db-main`.personal as t
            ON d.chief_id = t.id
            GROUP BY d.id";

      $result = $this->get($q);     
      return $result;
    }

    function getMenuDepartments(){
        $q = "SELECT name, id
              FROM departments";

        $result = $this->get($q);       
        return $result;
    }

    function createDep($depName){         
          $depName = "'".$depName."'";
          $obj = Db::getInstance();
          $obj->query("INSERT INTO departments(name)
                       VALUES($depName)");
      }

      function show($depId){         
          $q = "SELECT p.name
                FROM `tc-db-main`.personal as p
                LEFT JOIN `savage-db`.users as u
                ON u.personal_id = p.id
                WHERE u.department_id = $depId";

          $result = $this->get($q);
          return $result;
      }   
}
?>
