<?php

namespace core;

class Acl {
    
    static function getUserRoles()
    {
        $user = $_SESSION['login'];
        $db = ConnectDb::getInstance();
        
        $userRoles = Array();
        
        $sql = "SELECT roles.role_name
                FROM users_roles
                INNER JOIN roles ON users_roles.id_role = roles.id
                INNER JOIN users ON users_roles.id_user = users.id
                WHERE users.login =  '$user';";
        
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
    
    static function getRolePermissions($role, $field)
    {
        $roleName = $role;
        $db = ConnectDb::getInstance();
        
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
                $rolePermissions[] = $row[$field];
            }
            
            return $rolePermissions;

        } else {
            
            return false; 
        }
    }
    
    static function getUserPermissions()
    {
        $rolesWithPermissions = Array();
        
        $userRoles = self::getUserRoles();

        foreach ($userRoles as $role) {
            $rolePermissions = Acl::getRolePermissions($role, "name");
            $rolesWithPermissions[$role] = $rolePermissions;
        }
        
        return $rolesWithPermissions;
    }
    
}

?>
