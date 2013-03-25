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
        $params = array();
        $params['name'] = $name;
        $q = "INSERT INTO roles(role_name)
                       VALUES(:name)";
        $result = $this->execute($q, $params);
        return $result;
    }

    function getRolePermissions($roleId){

        $q = "SELECT id_permission
              FROM roles_permissions              
              WHERE id_role = $roleId";
        $result = $this->fetchAll($q);
        return $result;
    }

    function getAllPermissions(){

        $q = "SELECT pg.id, group_name, name as perm_name, p.id as perm_id
              FROM permission_group pg
              INNER JOIN permission p
              ON p.permission_group_id = pg.id
              ORDER BY id ASC";
        $result = $this->fetchAll($q);
        return $result;
    }

    function deleteRolePermissions($roleId){
        $q = "DELETE 
              FROM roles_permissions
              WHERE id_role = (:roleId)";
        $params = array();
        $params['roleId'] = $roleId;
        $result = $this->execute($q, $params);
        return $result;
    }

    function addRolePermissions($roleId, $permission){
        $q = "INSERT INTO roles_permissions(id_role, id_permission)
              VALUES(:roleId, :permission)";
        $params = array();
        $params['roleId'] = $roleId;
        $params['permission'] = $permission;
        $result = $this->execute($q, $params);
        return $result;
    }
}

?>
