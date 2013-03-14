<?php
namespace controllers;

use core\Controller;
use models\Departments as DepartmentModel;

class Departments extends Controller {

    public function indexAction() {
        $obj =  new DepartmentModel();
        if(isset($_POST['depName']) && $_POST['depName']){
           $depName = $_POST['depName'];
           $obj->createDep($depName);
        }

        $departments =  $obj->getAll();
        $this->render("Departments/index.tpl" , array('departments' => $departments));
    }

    public function showAction(){
        $department =  new DepartmentModel();
        if(isset($_GET['id']) && $_GET['id']){
            $depId = $_GET['id'];
        }

        $users = $department->getUsers($depId);
        $this->render("Departments/show.tpl" , array('users' => $users));
    }
}