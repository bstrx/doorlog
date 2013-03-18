<?php

/**
 * @author adrenaline
 */
namespace models;
use core\Db;

class Roles extends \core\Model{
    
    function getAll(){
        $result = $this->get("SELECT role_name, id, count(id_person) as users_count
                              FROM roles
                              LEFT OUTER JOIN persons_roles as pr
                              ON role.id = pr.id_role
                              GROUP BY role_name");
   
        return $result;
    }

    function addRole($name){
        $name = "'".$name."'";
        $this->get("INSERT INTO roles(role_name)
                       VALUES($name)");

    }

    function getRolePermissions($roleId){

        $q = "SELECT permissions.id, name, permission_group_id, group_name
              FROM permission
              JOIN permission_groups as pg
              ON pg.id = permissions.permission_group_id
              WHERE permissions.id = $roleId";
        $result = $this->get($q);
        return $result;
    }

    function getAllPermissions(){
//        $q = "SELECT permissions.id, name, permission_group_id, group_name
//              FROM permissions
//              JOIN permission_groups as pg
//              ON pg.id = permissions.permission_group_id";
        $q = "SELECT CONVERT( GROUP_CONCAT( permission.id )
USING UTF8 ) , role.id, role.name rname
FROM permission
INNER JOIN roles_permissions AS rp ON permission.id = rp.id_permission
INNER JOIN permission_group AS pg ON pg.id = permission.permission_group_id
JOIN role ON role.id = rp.id_role
GROUP BY role.id";
        $result = $this->get($q);
        print_r($result);
        return $result;
    }
}

?>
