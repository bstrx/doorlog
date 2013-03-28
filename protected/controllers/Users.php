<?php

namespace controllers;

use core\Controller;
use models\Users as UsersModel;
use core\Utils;
use core\FlashMessages;
use core\Authentication;
use core\Registry;
use core\Db;

class Users extends Controller {

    public function indexAction() {
        $users = new UsersModel();
        $firstElement = 0;
        $val = Registry::getValue('config');
        $elementsCount = $val['items_per_page'];

        if (isset($_GET['page']) && $_GET['page'] != 1) {
            $firstElement = ($_GET['page'] - 1) * $elementsCount;
            $currentPage = $_GET['page'];
        } else {
            $currentPage = 1;
        }

        $registeredCount = $users->getAllRegisteredCount();
        $pagesCount = ceil($registeredCount['count'] / $elementsCount);

        $registeredUsers = $users->getRegistered($firstElement, $elementsCount);


        $this->render("Users/index.tpl", array('users' => $registeredUsers,
            'pagesCount' => $pagesCount,
            'currentPage' => $currentPage));
    }

    public function logoutAction() {
        $auth = new Authentication;
        $auth->logout();
        $this->redirect('/');
    }

    public function addAction() {
        $users = new UsersModel();

        if (isset($_POST['userId']) && isset($_POST['department']) && isset($_POST['position']) && isset($_POST['email']) && isset($_POST['tel']) && isset($_POST['bday'])) {
            $user = $_POST['userId'];
            $position = $_POST['position'];
            $department = $_POST['department'];
            $email = $_POST['email'];
            $tel = $_POST['tel'];
            $bday = $_POST['bday'];
            $attr = $users->checkUserAttr($email, $tel);
            if (!$attr) {
                $salt = Utils::createRandomString(5, 5);
                $password = Utils::createRandomString(8, 10);
                $hash = $this->generateHash($password, $salt);
                if ($users->insertUsers($user, $email, $hash, $salt, $position, $department, $tel, $bday)) {
                    FlashMessages::addMessage("Пользователь успешно добавлен.", "info");
                } else {
                    FlashMessages::addMessage("Произошла ошибка. Пользователь не был добавлен.", "error");
                }
                Utils::sendMail($email, "Создан аккаунт в системе Opensoft Savage", "Ваш пароль: $password");
            } else {
                foreach ($attr as $val) {
                    FlashMessages::addMessage($val, "error");
                }
            }
        }

        $unregisteredUsers = $users->getAllUnregistered();
        $posList = $users->getPositionsList();
        $sortedUsers = array();
        $depList = $users->getDepartmentsList();

        $sortedDepartments = array();
        foreach ($depList as $department) {
            $sortedDepartments[$department['id']] = $department['name'];
        }

        $sortedPositions = array();
        foreach ($posList as $position) {
            $sortedPositions[$position['id']] = $position['name'];
        }

        foreach ($unregisteredUsers as $user) {
            $sortedUsers[$user['id']] = $user['name'];
        }

        $this->render("Users/add.tpl", array(
            'users' => $sortedUsers,
            'positions' => $sortedPositions,
            'departments' => $sortedDepartments)
        );
    }

    public function loginAction() {
        if (isset($_POST['login']) && isset($_POST['password'])) {
            $usersModel = new UsersModel();
            if (filter_var($_POST['login'], FILTER_VALIDATE_EMAIL)) {
                $userInfo = $usersModel->getInfoByEmail($_POST['login']);
            } else {
                $userInfo = $usersModel->getInfoByCodeKey((int) $_POST['login']);
            }
            if ($userInfo) {
                $hash = $this->generateHash($_POST['password'], $userInfo['salt']);

                if ($hash == $userInfo['password']) {
                    $auth = new Authentication();
                    $auth->grantAccess($userInfo['personal_id'], $hash);
                    $this->redirect('/');
                } else {
                    FlashMessages::addMessage("Неверный пароль.", "error");
                }
            } else {
                FlashMessages::addMessage("Неверный пользователь.", "error");
            }
        }
        
        $this->render("Users/login.tpl");
    }

    public function generateHash($password, $salt) {
        return sha1($salt . $password);
    }

    public function autocompleteAction(){
        $autocomplete = new UsersModel;
        $name = $_GET['name'];
        $result = $autocomplete->searchByName($name);
        echo (json_encode($result));
    }

    public function showAction() {
        $userInfo = null;
        $vacation = new UsersModel;
        $statuses = $vacation->getUserStatuses();

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $getUser = new UsersModel;
            $userInfo = $getUser->getUserInfo($id);
        }

        if ($userInfo) {
            $userStatus = $getUser->getUserStatus($id);
            $userInfo['status'] = $userStatus['status'];
        } else {
            FlashMessages::addMessage("Неверный id пользователя", "error");
        }
        $this->render("Users/show.tpl", array('userInfo' => $userInfo, 'statuses'=> $statuses, 'id' => $id));
    }

    public function vacationAction(){
        $vacation = new UsersModel;

        if(isset($_POST['id']) && isset($_POST['from']) && isset($_POST['to'])){
            $id = $_POST['id'];
            $from = $_POST['from'];
            $to = $_POST['to'];
            $type = $_POST['vtype'];

            $dateStart = strtotime($from);
            $dateFinish = strtotime($to);
            $sumDays = floor(($dateFinish - $dateStart) / (3600 * 24));

            for($i=0; $i<=$sumDays; $i++){
                $date =  date("o-m-d", $dateStart+((3600*24)*$i));
                $res = $vacation->setVacation($id, $type, $date);
            }
            if ($res){
                FlashMessages::addMessage("Отгул добавлен.", "info");
            } else {
                FlashMessages::addMessage("Произошла ошибка. Отгул не был добавлен.", "error");
            }

            $this->redirect('/users/show?id='.$id);
        }
    }

    public function searchAction(){
        if(isset($_GET['id']) && $_GET['id']){
            $this->showAction();
        } else {
            $users = new UsersModel;
            $search = $users->searchByName($_GET['text']);
            $this->render("Users/search.tpl", array('search' => $search));
        }
    }

}
