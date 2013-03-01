<?php
namespace controllers;

use core\Controller;
use models\Users as UsersModel;
use core\MailSender;
use core\FlashMessages;
use core\Authentication;

class Users extends Controller{
    function indexAction() {
        //$this->render("users.tpl" , array('value' => 2) );
    }

    function createRandomString($minchar = 5, $maxchar=10){
        $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz";
        $length = mt_rand($minchar,$maxchar);
        $password = '';
        $charsCount = strlen($chars)-1;
        for($i=0; $i<$length; $i++){
            $password.= $chars[mt_rand(1, $charsCount)];
        }
        return $password;
    }

    function addAction(){
        $users = new UsersModel();
        if(isset($_POST['user']) && isset($_POST['position']) && isset($_POST['email'])){
            $user = $_POST['user'];
            $position = $_POST['position'];
            $email = $_POST['email'];
            $salt = Authentication::createRandomString(5,5);
            $password = Authentication::createRandomString();
            $hash = sha1($salt.$password);
            if($users->insertUsers($user, $email, $hash, $salt, $position)){
                FlashMessages::addMessage("Пользователь успешно добавлен.", "info");
            }
            else{
                FlashMessages::addMessage("Произошла ошибка. Пользователь добавлен не был.", "error");
            }
            $mail = new MailSender($email, "subject", "Your password: $password");
            $mail->send();
        }
        $unregisteredUsers = $users->getAllUnregistered();
        $posList = $users->getPositionsList();
        $sortedUsers = array();
        foreach ($unregisteredUsers as $user) {
            $sortedUsers[$user['id']] = $user['name'];
        }
        $this->render("Users/add.tpl" , array('users' => $sortedUsers, 'positions'=>$posList) );
    }

    function loginAction(){
        if(isset($_POST['email']) && isset($_POST['password'])){
            $email = $_POST['email'];
            $password = $_POST['password'];
            $auth = new Authentication;
            $check = $auth->checkPassword($email, $password);
            if($check){
                header('Location: /');
            } else {
               //TODO describe error
            }
        }
        $this->render("Users/login.tpl" , array('value' => 2));
    }
}