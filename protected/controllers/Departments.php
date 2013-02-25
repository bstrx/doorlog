<?php
namespace controllers;

use core\Controller;
use models\Departments as dep;

class Departments extends Controller {

    function indexAction() {
        $obj =  new dep();
        if(isset($_POST['dep_name']) && $_POST['dep_name']){
           // print_r($_POST['dep_name']);
           $obj->createDep();
        }

        
        $departments =  $obj ->getAll();
        $this->render("Departments/departments.tpl" , array('departments' => $departments) );
    }

}