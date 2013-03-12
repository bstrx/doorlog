<?php
namespace core;

use controllers\Users;
use core\Db;
use core\Acl;
use models\Users as UsersModel;

class Authentication{
    public function checkAccess() {
        if(isset($_COOKIE['id']) && isset($_COOKIE['hash'])){
            $user = new UsersModel();
            $userInfo = $user->getInfo((int) $_COOKIE['id']);
            if ($userInfo && $userInfo['password'] == $_COOKIE['hash']) {
                Registry::setValue('user', $userInfo);
                return true;
            }
        }

        $auth = new Users;
        $auth ->loginAction();
    }

   

    public function grantAccess($id, $hash) {
        SetCookie ("id", $id, time() + 50000, '/');
        SetCookie ("hash", $hash, time() + 50000, '/');
    }

    public function logout() {
        SetCookie("id", "", time() - 3600, '/');
        SetCookie("hash", "", time() - 3600, '/');
    }
}