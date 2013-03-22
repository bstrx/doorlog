<?php
/**
 * @author adrenaline
 */
namespace controllers;

use core\Controller;
use models\Roles as Ro;
use core\FlashMessages;

class Roles extends Controller{

    function indexAction(){
        $obj = new Ro();
        $roles = $obj->getAll();
        $this->render("Roles/index.tpl" , array('roles' => $roles) );
    }

    function addAction(){
        $obj =  new Ro();
        if(isset($_POST['roleName']) && $_POST['roleName']){
           $roleName = $_POST['roleName'];
           $obj->addRole($roleName);
           FlashMessages::addMessage("Роль успешно добавлена.", "info");
        }

        $this->render("Roles/add.tpl", array('value'=>0));
    }

    function editAction(){
        $obj = new Ro();

        $rolePermissions = array();
        $allPermissions = array();
        $sortedPermissions = array();

        if(isset($_GET['id']) && $_GET['id']){
            $roleId = $_GET['id'];
            //$rolePermissions = $obj->getRolePermissions($roleId);
        }
                if(isset($_POST['changes'])){
            if(isset($_POST['chb'])){
                $newPermissions = $_POST['chb'];
                $obj->deleteRolePermissions($roleId);
                foreach($newPermissions as $permission){
                    $obj->addRolePermissions($roleId, $permission);
                    
                }
                FlashMessages::addMessage("Роль успешно изменена.", "info");
                }else{
                $obj->deleteRolePermissions($roleId);
                FlashMessages::addMessage("Роль успешно изменена.", "info");
        }
        }
        $rolePermissions = $obj->getRolePermissions($roleId);


        $sortedRolePermissions = array();
        foreach($rolePermissions as $prow){
            $sortedRolePermissions[$prow['id_permission']] = $prow['id_permission'];
        }

        $allPermissions = $obj->getAllPermissions();


        $tmp = array();
          foreach($allPermissions as $row){
            $sortedPermissions[$row['id']]['group_name'] = $row['group_name'];
            $tmp['perm_name'] = $row['perm_name'];
            if(in_array($row['perm_id'], $sortedRolePermissions)){
                $tmp['select']= true;
             }else{
                $tmp['select']= false;
            }
            
            $sortedPermissions[$row['id']]['permissions'][$row['perm_id']]= $tmp;         
        }


        $this->render("Roles/edit.tpl", array('rolePermissions'=>$sortedRolePermissions,
                                              'allPermissions'=>$sortedPermissions));
    }

    
}

?>
