<?php
namespace core;
Use controllers\Users;
Use core\Db;
Use models\Users as usersModel;
class Authentication{
    function createRandomString($minchar = 5, $maxchar=10){
        $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz";
        $length = mt_rand($minchar,$maxchar);
        $randomString = '';
        $charsCount = strlen($chars)-1;
        for($i=0; $i<$length; $i++){
            $randomString.= $chars[mt_rand(1, $charsCount)];
        }
        return $randomString;
    }

    function checkAccess(){
        if(isset($_COOKIE['email']) && isset($_COOKIE['password'])){
            $email = $_COOKIE['email'];
            $password = $_COOKIE['password'];
            $check = $this->checkHash($email, $password);
            if ($check) {
                return true;
            }
        }
        $auth = new Users;
        $auth ->loginAction();
    }
    
    function checkHash($email, $password){
        $getInfo = new usersModel;
        $fetchedData = $getInfo->getInfo($email);
        if(isset($fetchedData)){
            if ($fetchedData) {
                $hash = $fetchedData['0']['password'];
                    $newhash = $_COOKIE['password'];
                    if ($newhash == $hash){
                        return true;
                    }
            }
        }
    }

    function checkPassword($email, $password){
        $getInfo = new usersModel;
        $fetchedData = $getInfo->getInfo($email);
        $db = Db::getInstance();
        $checkPassword = $db->query("SELECT `password` , `salt` FROM `users` WHERE email='$email'");
        $fetchedData = $checkPassword->fetchAll(\PDO::FETCH_ASSOC);
        if(isset($fetchedData)){
            $hash = $fetchedData['0']['password'];
            $salt = $fetchedData['0']['salt'];
            $newhash = sha1($salt.$password);
            if ($newhash == $hash){
                SetCookie ("email", $email, time() + 50000, '/');
                SetCookie ("password", $hash, time() + 50000, '/');
                return true;
            }
        }
        return false;
    } 

    function logout(){
        SetCookie("email", "", '/');
        SetCookie("password", "", '/');
        $auth = new Users;
        $auth ->authAction();
    }
}