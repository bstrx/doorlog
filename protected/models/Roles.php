<?php

/**
 * @author adrenaline
 */
namespace models;
use core\Db;

class Roles extends \core\Model{
    
    function getAll(){
        $result = $this->fetchAll("SELECT name, id, count(id_person) as users_count
                              FROM role
                              LEFT OUTER JOIN users_roles as ur
                              ON role.id = ur.id_role
                              GROUP BY name");
   
        return $result;
    }

    function addRole($name){
        $name = "'".$name."'";
        $this->fetchOne("INSERT INTO roles(role_name)
                       VALUES($name)");

    }

    function getRolePermissions($roleId){

        $q = "SELECT id_permission
              FROM roles_permissions
              
              WHERE id_role = $roleId";
        $result = $this->fetchAll($q);
        return $result;
    }

    function getAllPermissions(){
//        $q = "SELECT permission.id, name, permission_group_id, group_name
//              FROM permission
//              JOIN permission_group as pg
//              ON pg.id = permission.permission_group_id";
//        $q = "SELECT CONVERT( GROUP_CONCAT( permission.id )
//USING UTF8 ) , role.id, role.name rname
//FROM permission
//INNER JOIN roles_permissions AS rp ON permission.id = rp.id_permission
//INNER JOIN permission_group AS pg ON pg.id = permission.permission_group_id
//JOIN role ON role.id = rp.id_role
//GROUP BY role.id";
        $q = "SELECT pg.id, group_name, name as perm_name, p.id as perm_id
FROM permission_group pg
INNER JOIN permission p
ON p.permission_group_id = pg.id
ORDER BY id ASC";
        $result = $this->fetchAll($q);
        //print_r($result);
        return $result;
    }

    function deleteRolePermissions($roleId){
        $q = "DELETE 
              FROM roles_permissions
              WHERE id_role = $roleId";
        $result = $this->fetchAll($q);
        return $result;
    }

    function addRolePermissions($roleId, $permission){
        $q = "INSERT INTO roles_permissions(id_role, id_permission)
              VALUES($roleId, $permission)";
        $result = $this->fetchAll($q);
        return $result;
    }
}

?>
