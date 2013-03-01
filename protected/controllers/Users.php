<?php
namespace controllers;

use core\Controller;
use models\Users as UsersModel;
use core\Utils;
use core\MailSender;
use core\FlashMessages;
use core\Authentication;


class Users extends Controller{
    public function indexAction() {
        $users = new UsersModel();
        $registeredUsers = $users->getAllRegistered();
        $this->render("Users/index.tpl" , array('users' => $registeredUsers) );
    }

    public function logoutAction() {
        $auth = new Authentication;
        $auth->logout();
        header('Location: /');
    }

    public function addAction(){
        $users = new UsersModel();
       // print_r($_POST);
        if(isset($_POST['userId']) && isset($_POST['position']) && isset($_POST['email'])){
            $user = $_POST['userId'];
            $position = $_POST['position'];
            
            $email = $_POST['email'];
            $salt = Utils::createRandomString(5,5);
            $password = Utils::createRandomString(8, 10);
            $hash = sha1($salt.$password);
            if($users->insertUsers($user, $email, $hash, $salt, $position)){
                FlashMessages::addMessage("Пользователь успешно добавлен.", "info");
                echo $password; //TODO убрать - пароль должен приходить на почту
            }
            else{
                FlashMessages::addMessage("Произошла ошибка. Пользователь добавлен не был.", "error");
            }

            $mail = new MailSender($email, "subject", "Your password: $password");
            //$mail->send(); //TODO сделать доступным
        }

        $unregisteredUsers = $users->getAllUnregistered();
        $posList = $users->getPositionsList();
        $sortedUsers = array();
        
        foreach ($unregisteredUsers as $user) {
            $sortedUsers[$user['id']] = $user['name'];
        }
        $this->render("Users/add.tpl" , array('users' => $sortedUsers, 'positions'=>$posList) );
    }

    public function loginAction(){
        if (isset($_POST['login']) && isset($_POST['password'])){
            $usersModel = new UsersModel();
            if (filter_var($_POST['login'], FILTER_VALIDATE_EMAIL)) {
                $userInfo = $usersModel->getInfoByEmail($_POST['login']);
            } else {
                $userInfo = $usersModel->getInfoById((int) $_POST['login']);
            }
            if ($userInfo) {
                $hash = $this->generateHash($_POST['password'], $userInfo['salt']);

                if ($hash == $userInfo['password']) {
                    $auth = new Authentication();
                    $auth->grantAccess($userInfo['personal_id'], $hash);
                    header('Location: /');
                } else {
                    //TODO describe error
                }
            }
        }

        $this->render("Users/login.tpl");
    }

    public function generateHash($password, $salt) {
        return sha1($salt . $password);
    }
}
