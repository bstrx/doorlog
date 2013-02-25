<?php

namespace models;
use core\Db;

class Departments {
    function getAll(){

       $obj =  Db::getInstance();
//       $r = $obj-> query("SELECT name
//                          FROM departments" );

              $r = $obj-> query("SELECT name, count(personal_id)
                          FROM departments
                          LEFT JOIN users
                          ON users.department_id = departments.id
                          GROUP BY name" );

    //   $obj-> setFetchMode(PDO::FETCH_ASSOC);
      $tmp = $r->fetchAll(\PDO::FETCH_ASSOC);

      return $tmp;
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
