<?php

namespace models;
use core\Db;

class Departments extends \core\Model {
    function getAll(){
/*
       $obj =  Db::getInstance();
//       $r = $obj-> query("SELECT name
//                          FROM departments" );

              $r = $obj-> query("SELECT name, count(personal_id)
                          FROM departments
                          LEFT JOIN users
                          ON users.department_id = departments.id
                          GROUP BY name" );

    //   $obj-> setFetchMode(PDO::FETCH_ASSOC);
      $tmp = $r->fetchAll(\PDO::FETCH_ASSOC);*/
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

      function createDep(){
          $dep_name = "'".$_POST['dep_name']."'";
          
          $obj = Db::getInstance();
          $obj->query("INSERT INTO departments(name)
              VALUES($dep_name)");

      }


      function deleteDep(){

      }


    
}
?>
