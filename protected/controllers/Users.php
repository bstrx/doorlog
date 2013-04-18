<?php

namespace controllers;

use core\Controller;
use models\Users as UsersModel;
use core\Utils;
use core\FlashMessages;
use core\Authentication;
use core\Registry;
use core\Db;
use models\Roles as RolesModel;
use core\Acl;

class Users extends Controller {
    /**
     * Render page for all users
     * @return void
     */
    public function indexAction() {
        if(!Acl::checkPermission('users_view')){
            $this->render("errorAccess.tpl");
        }
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

        $this->render("Users/index.tpl", array(
            'users' => $registeredUsers,
            'pagesCount' => $pagesCount,
            'currentPage' => $currentPage));
    }
    
    /**
     * If logout redirect in root
     * @return void
     */
    public function logoutAction() {
        $auth = new Authentication;
        $auth->logout();
        Utils::redirect('/');
    }
    
    /**
     * Render page for add new user
     * @return void
     */
    public function addAction() {
        $users = new UsersModel();

        if (isset($_POST['userId']) && isset($_POST['department']) && isset($_POST['position']) && isset($_POST['email']) && isset($_POST['tel']) && isset($_POST['bday'])) {
            $user = $_POST['userId'];
            $position = $_POST['position'];
            $department = $_POST['department'];
            $email = $_POST['email'];
            $tel = $_POST['tel'];
            $bday = $_POST['bday'];
            $attr = $users->checkUserAttr($email, $tel, $position, $department);
            if (!$attr) {
                $salt = Utils::createRandomString(5, 5);
                $password = Utils::createRandomString(8, 10);
                $hash = $this->generateHash($password, $salt);
                if ($users->insertUsers($user, $email, $hash, $salt, $position, $department, $tel, $bday)) {
                    FlashMessages::addMessage("Пользователь успешно добавлен.", "success");
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

    /**
     *Sign up into savage 2.0 
     * @return void
     */
    public function loginAction() {
        if (isset($_POST['login']) && $_POST['login'] && isset($_POST['password']) && $_POST['password']) {
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
                    $auth->grantAccess($userInfo['id'], $hash);
                    Utils::redirect('/');
                } else {
                    FlashMessages::addMessage("Неверный пароль.", "error");
                }
            } else {
                FlashMessages::addMessage("Неверный пользователь.", "error");
            }
        }

        $this->render("Users/login.tpl");
    }

    /**
     * This function is generate hash
     * @param string $password
     * @param string $salt
     * @return string|false
     */
    public function generateHash($password, $salt) {
        return sha1($salt . $password);
    }

    /**
     * This function is help search
     * @return void
     */
    public function autocompleteAction(){
        $autocomplete = new UsersModel;
        $name = $_GET['name'];
        $result = $autocomplete->searchByName($name);
        echo (json_encode($result));
    }

    /**
     * Render page for this user
     * @return void
     */
    public function showAction() {
        if(!Acl::checkPermission('users_view')){
            $this->render("errorAccess.tpl");
        }
        $timeoffs = array();
        $user = new UsersModel();

        if (isset($_GET['date']) && isset($_GET['id']) && !empty($_GET['date']) && !empty($_GET['id']) ){
            $timeoffs = $user->getTimeoffsById($_GET['id'], $_GET['date'], $_GET['type']);
            $date = $_GET['date'];
            $userInfo = $user->getInfo($_GET['id']);
            if ($userInfo) {
                $name = $userInfo['name'];
                $id = $_GET['id'];
            } else {
                FlashMessages::addMessage("Неверный id пользователя", "error");
            }

        } else {
            $name = "";
            $date = date('Y-m');
            $id = '';
        }
        $statuses = $user->getUserStatuses();
        $timeoffsAttr = array('date' => $date, 'name' => $name, 'id' => $id);

        $userInfo = null;

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $getUser = new UsersModel;
            $userInfo = $getUser->getUserInfo($id);
        }

        if ($userInfo) {
            $userStatus = $getUser->getUserStatus($userInfo['personal_id']);
            $userInfo['status'] = $userStatus['status'];
        } else {
            FlashMessages::addMessage("Неверный id пользователя", "error");
        }
        $permission = null;
        if ($_GET['id']==$_COOKIE['id']){
            $permission = 1;
        }
        $this->render("Users/show.tpl", array('userInfo' => $userInfo, 'statuses'=> $statuses, 'id' => $id, 'timeoffs' => $timeoffs, 'timeoffsAttr' => $timeoffsAttr, 'permission' => $permission));
    }

    /**
     * Render page for add time offs
     * @return void
     */
    public function vacationAction(){
        if(!Acl::checkPermission('timeoffs_add')){
            $this->render("errorAccess.tpl");
        }
        $timeoffs = new UsersModel;
        $id = $_POST['id'];

        if(isset($_POST['from']) && isset($_POST['to']) && $_POST['from'] && $_POST['to']){
            $from = $_POST['from'];
            $to = $_POST['to'];
            $type = $_POST['vtype'];

            $dateStart = strtotime($from);
            $dateFinish = strtotime($to);
            $sumDays = floor(($dateFinish - $dateStart) / (3600 * 24));

            for($i=0; $i<=$sumDays; $i++){
                $date =  date("o-m-d", $dateStart+((3600*24)*$i));
                $res = $timeoffs->setTimeoffs($id, $type, $date);
            }
            if ($res){
                FlashMessages::addMessage("Отгул добавлен.", "success");
            } else {
                FlashMessages::addMessage("Произошла ошибка. Отгул не был добавлен.", "error");
            }

            Utils::redirect('/users/show?id='.$id);
        } else {
            FlashMessages::addMessage("Ошибка заполнения. Отгул не был добавлен.", "error");
            Utils::redirect('/users/show?id='.$id);
        }
    }

    /**
     * Render page for search users
     * @return void
     */
    public function searchAction(){
        if(isset($_GET['id']) && $_GET['id']){
            $this->showAction();
        } else {
            $users = new UsersModel;
            $search = $users->searchByName($_GET['text']);
            $this->render("Users/search.tpl", array('search' => $search, 'text' => $_GET['text']));
        }
    }

    /**
     * Render page for edit user
     * @return void
     */
    public function editAction(){
        $id = $_GET['id'];
        $user = new UsersModel;
        $userInfo = null;
        $userInfo = $user->getUserInfo($id);

        if(isset($_POST['position']) && isset($_POST['department']) && isset($_POST['email']) && isset($_POST['phone']) && isset($_POST['birthday'])){
            $position = $_POST['position'];
            $department = $_POST['department'];
            $email = $_POST['email'];
            $phone = $_POST['phone'];
            $birthday = $_POST['birthday'];
            $user->editUser($id, $position, $email, $department, $birthday, $phone);
            FlashMessages::addMessage("Пользователь успешно отредактирован.", "success");
            Utils::redirect("/users");
        } else {

        $sortedDepartments = array();
        $depList = $user->getDepartmentsList();
        foreach ($depList as $department) {
            $sortedDepartments[$department['id']] = $department['name'];
        }

        $sortedPositions = array();
        $posList = $user->getPositionsList();
        foreach ($posList as $position) {
            $sortedPositions[$position['id']] = $position['name'];
        }

        }
        $this->render("Users/edit.tpl", array(
            'id'=> $id,
            'userInfo'=>$userInfo,
            'positions' => $sortedPositions,
            'departments' => $sortedDepartments)
        );
    }

    /**
     * Render page for manage user
     * @return void
     */
    public function manageAction() {
        if((!Acl::checkPermission('users_add'))||(!Acl::checkPermission('users_edit'))){
            $this->render("errorAccess.tpl");
        }
        $users = new UsersModel();
        $roles = new RolesModel();

        if (isset($_POST['department']) && isset($_POST['position']) && isset($_POST['email']) && isset($_POST['phone']) && isset($_POST['birthday'])) {
            $position = $_POST['position'];
            $department = $_POST['department'];
            $role = $_POST['role'];
            $email = $_POST['email'];
            $phone = $_POST['phone'];
            $birthday = $_POST['birthday'];
            if (isset($_POST['is_shown'])){
                $isShown = $_POST['is_shown'];
            } else $isShown = 0;

            $inputErrors = $users->checkUserAttr($email, $phone, $position, $department);
            if ($inputErrors){
                $errorString = 'Ошибка заполнения поля: ' . implode(', ', $inputErrors).'.';
                FlashMessages::addMessage($errorString, "error");
            } else {
                if(isset($_GET['id']) && $_GET['id']){
                    $id = $_GET['id'];
                    if (isset($_POST['oldPass']) && $_POST['oldPass'] && isset($_POST['newPass']) && $_POST['newPass']){
                        $oldPass = $_POST['oldPass'];
                        $newPass = $_POST['newPass'];
                        $info = $users->getInfo($id);
                        $hash = $this->generateHash($oldPass, $info['salt']);
                        if($hash == $info['password']){
                            $newHash = $this->generateHash($newPass, $info['salt']);
                        } else {
                            FlashMessages::addMessage("Старый пароль введен не верно и изменен не был.", "error");
                        }
                    }
                    $this->update($id, $position, $role, $email, $department, $birthday, $phone, $newHash, $isShown);
                } else {
                    if(isset($_POST['userId'])){
                        $user = $_POST['userId'];
                        $this->add($user, $email, $position, $role, $department, $birthday, $phone, $isShown);
                    }
                }
            }
        }

        $unregisteredUsers = $users->getAllUnregistered();
        $posList = $users->getPositionsList();
        $sortedUsers = array();
        $depList = $users->getDepartmentsList();
        $rolesList = $roles->getAll();

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

        $sortedRoles = array();
        foreach ($rolesList as $role) {
            $sortedRoles[$role['id']] = $role['name'];
        }

        if(isset($_GET['id']) && $_GET['id']){
            if(!Acl::checkPermission('users_edit')){
                $this->render("errorAccess.tpl");
            }
            $id = $_GET['id'];
            $userInfo = $users->getUserInfo($id);
            $this->render("Users/manage.tpl", array(
                'userId' => $id,
                'userInfo' => $userInfo,
                'positions' => $sortedPositions,
                'departments' => $sortedDepartments,
                'roles' => $sortedRoles
            ));
        } else {
            if(!Acl::checkPermission('users_add')){
                $this->render("errorAccess.tpl");
            }
            $this->render("Users/manage.tpl", array(
                'users' => $sortedUsers,
                'positions' => $sortedPositions,
                'departments' => $sortedDepartments,
                'roles' => $sortedRoles
            ));
        }
    }
    /**
     * This function add user in base
     * @param integer $user
     * @param string $email
     * @param integer $position
     * @param integer $role
     * @param integer $department
     * @param string $birthday
     * @param string $phone
     * @param integer $isShown
     * @return void
     */
    public function add($user, $email, $position, $role, $department, $birthday, $phone, $isShown){
        $users = new UsersModel;
        $roles = new RolesModel();
        $salt = Utils::createRandomString(5, 5);
        $password = Utils::createRandomString(8, 10);
        $hash = $this->generateHash($password, $salt);
        if (($users->insertUsers($user, $email, $hash, $salt, $position, $department, $phone, $birthday, $isShown)) 
            && ($roles->insertUserRole($users->getId($user), $role) )) {
            FlashMessages::addMessage("Пользователь успешно добавлен.", "info");
        } else {
            FlashMessages::addMessage("Произошла ошибка. Пользователь не был добавлен.", "error");
        }
        Utils::sendMail($email, "Создан аккаунт в системе Opensoft Savage", "Ваш пароль: $password");
    }

    /**
     * This function update user in base
     * @param integer $id
     * @param integer $position
     * @param integer $role
     * @param string $email
     * @param integer $department
     * @param string $birthday
     * @param string $phone
     * @param string $newPass
     * @param integer $isShown
     * @return void
     */
    public function update($id, $position, $role, $email, $department, $birthday, $phone, $newPass, $isShown){
        $users = new UsersModel;
        $roles = new RolesModel();
        if(isset($newPass)){
            $users->editUserPass($id, $newPass);
        }
        if(($users->editUser($id, $position, $email, $department, $birthday, $phone, $isShown)) 
            && ($roles->editUserRole($id, $role))){
            FlashMessages::addMessage("Пользователь успешно отредактирован.", "success");
        } else {
            FlashMessages::addMessage("Произошла ошибка. Пользователь не был отредактирован", "error");
        }
        Utils::redirect("/users");
    }

    /**
     * Delete user from base and redirect on index page
     * @return void
     */
    public function deleteAction(){
        if(!Acl::checkPermission('users_delete')){
            $this->render("errorAccess.tpl");
        }
        $id = $_POST['id'];
        $user =  new UsersModel();
        $delete = $user->deleteUser($id);
        if ($delete) {
            FlashMessages::addMessage("Пользователь успешно удален.", "success");
            Utils::redirect("/users");
        } else FlashMessages::addMessage("При удалении пользователя произошла ошибка.", "error");
    }

    /**
     *If you forgot password this function send message for mail and redirect 
     * on index page
     * @return void
     */
    public function forgotPasswordAction(){
        if(isset($_POST['loginForForgotPassword']) && $_POST['loginForForgotPassword']){
            $login = $_POST['loginForForgotPassword'];
            $usersModel = new UsersModel();
            $salt = Utils::createRandomString(5, 5);
            $password = Utils::createRandomString(8, 10);
            $hash = $this->generateHash($password, $salt);

            if (filter_var($login, FILTER_VALIDATE_EMAIL)) {
                $user = $usersModel->getInfoByEmail($login);
                if($user){
                    $email = $login;
                } else {
                    FlashMessages::addMessage("Не правильно введен Email", "error");
                }
            } else {
                $user = $usersModel->getInfoByCodeKey((int) $login);
                if($user){
                    $email = $user['email'];
                } else {
                    FlashMessages::addMessage("Не правильно введен номер карты", "error");
                }
            }

            if(isset($email)){
                if(Utils::sendMail($email, "Ваш новый пароль в системе Opensoft Savage", "Ваш пароль: $password")){
                    $usersModel->editUserPass($user['id'], $hash);
                    FlashMessages::addMessage("Ваш новый пароль отправлен вам на почту", "success");
                    Utils::redirect("/users/login");
                } else {
                    FlashMessages::addMessage("Произошла ошибка. Пароль отправлен не был.", "error");
                }
                }
        }
        $this->render("Users/forgotPassword.tpl");
    }
}
