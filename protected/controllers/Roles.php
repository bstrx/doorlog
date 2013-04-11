<?php
/**
 * @author adrenaline
 */
namespace controllers;

use core\Acl;
use core\Controller;
use models\Roles as RolesModel;
use core\FlashMessages;
use core\Utils;

class Roles extends Controller{

    function indexAction(){
        if(!Acl::checkPermission('roles_view')){
            $this->render("errorAccess.tpl");
        }
        $obj = new RolesModel();
        $roles = $obj->getAll();
        $this->render("Roles/index.tpl" , array('roles' => $roles));
    }

    function addAction(){
        if(!Acl::checkPermission('roles_add')){
            $this->render("errorAccess.tpl");
        }
        $obj =  new RolesModel();
        if(isset($_POST['roleName']) && $_POST['roleName']){
           $roleName = $_POST['roleName'];
           if($obj->addRole($roleName)){
               FlashMessages::addMessage("Роль успешно добавлена.", "success");
           } else {
               FlashMessages::addMessage("Ошибка добавления.", "error");
           }
        }
        Utils::redirect("/roles");
    }

    function editAction(){
        if(!Acl::checkPermission('roles_edit')){
            $this->render("errorAccess.tpl");
        }
        $obj = new RolesModel();
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

        $sortedRolePermissions = array();
        foreach($rolePermissions as $rolePermission){
            $sortedRolePermissions[] = $rolePermission['permission_id'];
        }

        $sortedPermissions = array();
        foreach($allPermissions as $row){
            $sortedPermissions[$row['id']]['group_name'] = $row['group_name'];
            $select = in_array($row['perm_id'], $sortedRolePermissions);

            $sortedPermissions[$row['id']]['permissions'][$row['perm_id']] = array(
                'perm_name' => $row['perm_name'],
                'select' => $select,
            );
        }

        $this->render("Roles/edit.tpl", array(
            'rolePermissions' => $sortedRolePermissions,
            'allPermissions' => $sortedPermissions,
            'roleId' => $roleId
        ));
    }

    function deleteAction(){
        if(!Acl::checkPermission('roles_delete')){
            $this->render("errorAccess.tpl");
        }
        if(isset($_POST['id'])){
            $roleId = $_POST['id'];
        }
        $obj = new RolesModel();

        if($obj->deleteRoleWithPermissions($roleId)){
            FlashMessages::addMessage("Роль успешно удалена.", "info");
        } else {
            FlashMessages::addMessage("Ошибка удаления", "error");
        }
        Utils::redirect("/roles");
    }
}

?>
