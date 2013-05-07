<?php
namespace controllers;

use core\Acl;
use core\Controller;
use core\FlashMessages;
use models\Departments as DepartmentModel;
use models\Users as UserModel;
use controllers\Main as Time;
use core\Utils;

class Departments extends Controller {

    /**
     * Shows all departments
     * @return void
     */
    public function indexAction() {
        if(!Acl::checkPermission('departments_view')){
            $this->render("errorAccess.tpl");
        }
        $departmentsModel =  new DepartmentModel();
        $departments =  $departmentsModel->getAll();

        $this->render("Departments/index.tpl" , array('departments' => $departments));
    }

    /**
     * Shows department add form
     * @return void
     */
    public function addAction() {
        if(!Acl::checkPermission('departments_add')){
            $this->render("errorAccess.tpl");
        }
        $departmentsModel =  new DepartmentModel();
        if(isset($_POST['depName']) && $_POST['depName']){
            $depName = $_POST['depName'];
            if ($departmentsModel->createDep($depName)){
                FlashMessages::addMessage("Отдел успешно добавлен.", "success");
            } else {
                FlashMessages::addMessage("Произошла ошибка. Отдел не был добавлен.", "error");
            }
        }
        Utils::redirect("/departments");
    }

    /**
     * Shows department edit form
     * @return void
     */
    public function editAction() {
        if(!Acl::checkPermission('departments_edit')){
            $this->render("errorAccess.tpl");
        }
        $id = $_GET['id'];
        $departmentsModel =  new DepartmentModel();
        if((isset($_POST['depName']) && $_POST['depName']) || (isset($_POST['chief']) && $_POST['chief'])){
            $depName = $_POST['depName'];
            $departmentsModel->editDep($depName, $id, $_POST['chief']);
            FlashMessages::addMessage("Отдел успешно отредактирован.", "success");
            Utils::redirect("/departments");
        } else {
            $departments = $departmentsModel->getDepById($id);
            $users = $departmentsModel->getUsers($id);

            $sortedUsers = array();
            foreach ($users as $user) {
                $sortedUsers[$user['id']] = $user['name'];
            }
            $this->render("Departments/edit.tpl" , array('departments' => $departments, 'users' => $sortedUsers));
        }
    }

    /**
     * Delete department
     * @return void
     */
    public function deleteAction(){
        if(!Acl::checkPermission('departments_delete')){
            $this->render("errorAccess.tpl");
        }
        $id = $_POST['id'];
        $departmentsModel =  new DepartmentModel();
        $totalUsers =  $departmentsModel->getTotalUsers($id);
        if($totalUsers['total_users']==0){
            $delete = $departmentsModel->dellDep($id);
            if ($delete) {
                FlashMessages::addMessage("Отдел успешно удален.", "success");
                Utils::redirect("/departments");
            } else FlashMessages::addMessage("При удалении отдела произошла ошибка.", "error");
        }
        else {
            FlashMessages::addMessage("Отдел не может быть удален, пока в нём есть пользователи.", "error");
            Utils::redirect("/departments/edit?id=$id");
        }
    }

    /**
     * Shows one department with all of it users
     * @return void
     */
    public function showAction(){
        if(!Acl::checkPermission('departments_view')){
            $this->render("errorAccess.tpl");
        }
        $time  = new Time();
        $department =  new DepartmentModel();
        $userModel = new UserModel();
        if(isset($_GET['id']) && $_GET['id']){
            $depId = $_GET['id'];
        }
        $users = $department->getUsers($depId);
        sort($users);
        foreach($users as &$user) {
            $userId = $user['id'];
            $userPersonalId=$user['personal_id'];
            $weekTime = $userModel->getUserStatus($userId);
            $user['status'] = $weekTime;
            $user['time'] = $time->getWeekInfo($userPersonalId, date('Y-m-d'));
        }
        $name = $department->getDepById($depId);
        $userId = $_COOKIE['id'];
        $this->render("Departments/show.tpl" , array('users' => $users, 'depName' => $name, 'userId'=>$userId));
    }
}
