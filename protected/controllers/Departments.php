<?php
namespace controllers;

use core\FlashMessages;
use core\Controller;
use models\Departments as DepartmentModel;

class Departments extends Controller {

    public function indexAction() {
        $obj =  new DepartmentModel();
        $departments =  $obj->getAll();
        $this->render("Departments/index.tpl" , array('departments' => $departments));
    }
    public function addAction() {
        $obj =  new DepartmentModel();
        if(isset($_POST['depName']) && $_POST['depName']){
           $depName = $_POST['depName'];
           $obj->createDep($depName);
           FlashMessages::addMessage("Отдел успешно добавлен.", "info");
        }

        $departments =  $obj->getAll();
        $this->render("Departments/add.tpl" , array());
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