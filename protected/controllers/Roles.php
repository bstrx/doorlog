<?php
/**
 * @author adrenaline
 */
namespace controllers;

use core\Controller;
use models\Roles as RolesModel;
use core\FlashMessages;

class Roles extends Controller{

    function indexAction(){
        $obj = new RolesModel();
        $roles = $obj->getAll();
        $this->render("Roles/index.tpl" , array('roles' => $roles));
    }

    function addAction(){
        $obj =  new RolesModel();
        if(isset($_POST['roleName']) && $_POST['roleName']){
           $roleName = $_POST['roleName'];
           if($obj->addRole($roleName)){
               FlashMessages::addMessage("Роль успешно добавлена.", "success");
           } else {
               FlashMessages::addMessage("Ошибка добавления.", "error");
           }
        }
        $this->render("Roles/add.tpl");
    }

    function editAction(){
        $obj = new RolesModel();

        $rolePermissions = array();
        $allPermissions = array();
        $sortedPermissions = array();
        $sortedRolePermissions = array();

        if(isset($_GET['id']) && $_GET['id']){
            $roleId = $_GET['id'];
        }
           if(isset($_POST['changes'])){
               if(isset($_POST['checkbox'])){
                    $newPermissions = $_POST['checkbox'];
                    $obj->deleteRolePermissions($roleId);
                    foreach($newPermissions as $permission){
                        $obj->addRolePermissions($roleId, $permission);
                    }                
                    }else{
                        $obj->deleteRolePermissions($roleId);
                    }

            FlashMessages::addMessage("Роль успешно изменена.", "info");
        }
        
        $rolePermissions = $obj->getRolePermissions($roleId);
        $allPermissions = $obj->getAllPermissions();
        
        foreach($rolePermissions as $rolePermission){
            $sortedRolePermissions[] = $rolePermission['id_permission'];
        }
        
        foreach($allPermissions as $row){
            $sortedPermissions[$row['id']]['group_name'] = $row['group_name'];
            $select = in_array($row['perm_id'], $sortedRolePermissions);

            $sortedPermissions[$row['id']]['permissions'][$row['perm_id']] = array(
                'perm_name' => $row['perm_name'],
                'select' => $select,
            );
        }

        $this->render("Roles/edit.tpl", array('rolePermissions'=>$sortedRolePermissions,
                                              'allPermissions'=>$sortedPermissions));
    }
}

?>
