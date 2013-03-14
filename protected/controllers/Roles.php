<?php
/**
 * @author adrenaline
 */
namespace controllers;

use core\Controller;
use models\Roles as Ro;

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
        }

        $this->render("Roles/add.tpl", array('value'=>0));
    }

    
}

?>
