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
        if((isset($_POST['depName']) && $_POST['depName']) || (isset($_POST['chief']) && $_POST['chief'])){
            $depName = $_POST['depName'];
            $obj->editDep($depName, $id, $_POST['chief']);
            FlashMessages::addMessage("Отдел успешно отредактирован.", "info");
            $this->redirect("/departments");
        } else {
            $departments = $obj->getDepById($id);
            $users = $obj->getUsers($id);

            $sortedUsers = array();
            foreach ($users as $user) {
                $sortedUsers[$user['id']] = $user['name'];
            }
            $this->render("Departments/edit.tpl" , array('departments' => $departments, 'users' => $sortedUsers));
        }
    }

    public function deleteAction(){
        $id = $_POST[id];
        $obj =  new DepartmentModel();
        $delete = $obj->dellDep($id);
        if ($delete) {
            FlashMessages::addMessage("Отдел успешно удален.", "info");
            $this->redirect("/departments");
        } else FlashMessages::addMessage("При удалении отдела произошла ошибка.", "error");
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
            $userPersonalId = $users[$i]['personal_id'];
            $weekTime = $user->getUserStatus($userPersonalId);
            $users[$i]['status'] = $weekTime['status'];
            $users[$i]['time'] = $time->getWeekInfo($userPersonalId, date('Y-m-d'));
        }
        $name = $department->getDepById($depId);
        $this->render("Departments/show.tpl" , array('users' => $users, 'depName' => $name));
    }
}
