<?php
namespace controllers;

use core\Controller;
use models\Departments as dep;

class Departments extends Controller {

    function indexAction() {
        $obj =  new dep();
        if(isset($_POST['depName']) && $_POST['depName']){
           $depName = $_POST['depName'];
           $obj->createDep($depName);
        }

     

        
        $departments =  $obj ->getAll();

        $this->render("Departments/departments.tpl" , array('departments' => $departments) );
    }

    function showAction(){
        $obj =  new dep();
        if(isset($_GET['id']) && $_GET['id']){
            $depId = $_GET['id'];

        }
            $department = $obj->show($depId);


            $this->render("Departments/department.tpl" , array('department' => $department) );

    }

}