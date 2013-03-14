<?php

/**
 * @author adrenaline
 */
namespace models;
use core\Db;

class Roles extends \core\Model{
    
    function getAll(){
        $result = $this->get("SELECT role_name, count(id_person) as users_count
                              FROM roles
                              LEFT OUTER JOIN persons_roles as pr
                              ON roles.id = pr.id_role
                              GROUP BY role_name");
   
        return $result;
    }

    function addRole($name){
        $name = "'".$name."'";
        $this->get("INSERT INTO roles(role_name)
                       VALUES($name)");

    }

    function editRole(){

    }
}

?>
