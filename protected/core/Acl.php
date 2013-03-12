<?php

namespace core;

class Acl {
    
    static function getUserRoles($user)
    {
        //$user = Registry::getValue('user');
        $db = Db::getInstance();
        
        $userRoles = Array();
        
        $sql = "SELECT roles.role_name
                FROM persons_roles
                INNER JOIN roles ON persons_roles.id_role = roles.id
                INNER JOIN personal ON persons_roles.id_person = personal.ID
                WHERE personal.ID =  '$user';";
        
        $result = $db->query($sql);
                
        if (!empty( $result ) )
        {
            foreach ($result as $row) {
                $userRoles[] = $row['role_name'];
            }
            
            return $userRoles;

        } else {
            
            return false; 
        }
    }
    
    static function getRolePermissions($role)
    {
        $roleName = $role;
        $db = Db::getInstance();
        
        $rolePermissions = Array();
        
        $sql = "SELECT permissions.key, permissions.name 
                FROM roles_permissions
                INNER JOIN roles       ON 
                      roles_permissions.id_role = roles.id
                INNER JOIN permissions ON 
                      roles_permissions.id_permission = permissions.id
                WHERE roles.role_name = '$roleName';";
        
        $result = $db->query($sql);
                
        if (!empty( $result ) )
        {
            foreach ($result as $row) {
                $rolePermissions[] = $row;
            }
            
            return $rolePermissions;

        } else {
            
            return false; 
        }
    }
    
    static function getUserPermissions($user)
    {
        $rolesWithPermissions = Array();
        
        $userRoles = self::getUserRoles($user);
        
        if ($userRoles){
            foreach ($userRoles as $role) {
                $rolePermissions = Acl::getRolePermissions($role);
                $rolesWithPermissions[$role] = $rolePermissions;
            }

            return $rolesWithPermissions;
        } else {
            
            return false;
        }

    }
    
}

?>
