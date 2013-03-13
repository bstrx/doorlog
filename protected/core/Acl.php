<?php

namespace core;

use models\Users as Us;

class Acl {
    
    static function getUserRoles($userId){

        $userRoles = Array();
        $obj = new Us();
        $result = $obj->getUserRoles($userId);
                    
        if (!empty( $result ) ){
            foreach ($result as $row) {
                $userRoles[] = $row['role_name'];
            }
           
            return $userRoles;

        } else {           
            return false; 
        }
    }
    
    static function getRolePermissions($roleName){
                
        $rolePermissions = Array();
        $obj = new Us();
        $result = $obj->getRolePermissions($roleName);
                
        if (!empty( $result ) ){
            foreach ($result as $row) {
                $rolePermissions[] = $row;
            }           
            return $rolePermissions;

        } else {            
            return false; 
        }
    }
    
    static function getUserPermissions($user){

        $permissions = Array();
        $rolePermissions = Array();       
        $userRoles = self::getUserRoles($user);
        
        if ($userRoles){
            foreach ($userRoles as $role) {
                $rolePermissions = self::getRolePermissions($role);                
                }

            foreach($rolePermissions as $permission){
               $permissions[] = $permission['key'];
                }                        
            return $permissions;

        } else {           
            return false;
        }
    }    
}

?>
