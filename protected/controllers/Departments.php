<?php
namespace controllers;

use core\Controller;
use core\FlashMessages;
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
            if ($obj->createDep($depName)){
                FlashMessages::addMessage("Отдел успешно добавлен.", "info");
            } else {
                FlashMessages::addMessage("Произошла ошибка. Отдел не был добавлен.", "error");
            }
        }
        $departments =  $obj->getAll();
        $this->render("Departments/add.tpl" , array());
    }

    public function editAction() {
        $id = $_GET['id'];
        $obj =  new DepartmentModel();
        if(isset($_POST['depName']) && $_POST['depName']){
            $depName = $_POST['depName'];
            $obj->editDep($depName, $id);
            header('Location: /departments');
            FlashMessages::addMessage("Отдел успешно отредактирован.", "info");
        } else {
            $departments = $obj->getDepById($id);
            $this->render("Departments/edit.tpl" , array('departments' => $departments));
        }     
    }

    public function deleteAction(){
        $id = $_POST[id];
        print $id;
        $obj =  new DepartmentModel();
        $obj->dellDep($id);
        header('Location: /departments');
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