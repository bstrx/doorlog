<?php
namespace controllers;

use core\Controller;
use core\FlashMessages;
use models\Departments as DepartmentModel;
use models\Users as UserModel;
use controllers\Main as Time;

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

        $this->render("Departments/add.tpl" , array());
    }

    public function editAction() {
        $id = $_GET['id'];
        $obj =  new DepartmentModel();
        if(isset($_POST['depName']) && $_POST['depName']){
            $depName = $_POST['depName'];
            $obj->editDep($depName, $id);
            $this->redirect("/departments");
            FlashMessages::addMessage("Отдел успешно отредактирован.", "info");
        } else {
            $departments = $obj->getDepById($id);
            $this->render("Departments/edit.tpl" , array('departments' => $departments));
        }
    }

    public function deleteAction(){
        $id = $_POST[id];
        $obj =  new DepartmentModel();
        $obj->dellDep($id);
        $this->redirect("/departments");
        FlashMessages::addMessage("Отдел успешно удален.", "info");
    }

    public function showAction(){
        $time  = new Time();
        $department =  new DepartmentModel();
        $user = new UserModel();
        if(isset($_GET['id']) && $_GET['id']){
            $depId = $_GET['id'];
        }
        $users = $department->getUsers($depId);
        sort($users);
        for ($i=0; $i <count($users) ; $i++) {
            $userId = $users[$i]['id'];
            $weekTime = $user->getUserStatus($userId);
            $users[$i]['status'] = $weekTime['status'];
            $users[$i]['time'] = $time->getWeekInfo($userId, date('Y-m-d'));
        }
        $name = $department->getDepById($depId);
        $users['depName'] = $name['name'];
        $this->render("Departments/show.tpl" , array('users' => $users, 'depName' => $name));
    }
}