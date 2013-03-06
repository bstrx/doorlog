<?php
namespace controllers;

use core\Controller;
use models\Departments as Dep;

class Departments extends Controller {

    function indexAction() {
        $obj =  new Dep();
        if(isset($_POST['depName']) && $_POST['depName']){
           $depName = $_POST['depName'];
           $obj->createDep($depName);
        }

        $departments =  $obj->getAll();

        $this->render("Departments/index.tpl" , array('departments' => $departments));
    }

    function showAction(){
        $obj =  new Dep();
        if(isset($_GET['id']) && $_GET['id']){
            $depId = $_GET['id'];
        }

        $department = $obj->show($depId);

        $this->render("Departments/show.tpl" , array('department' => $department));
    }
}