<?php
namespace core;

use controllers\Users;
use core\Db;
use core\Acl;
use models\Users as UsersModel;
use core\Registry;

class Authentication{
    /**
     * Checks if user have correct info in cookies. Proceed if true, else shows login page.
     * @return bool|void
     */
    public function checkAccess($class, $method) {
        if(isset($_COOKIE['id']) && isset($_COOKIE['hash'])){
            $user = new UsersModel();
            $userInfo = $user->getUserInfo((int) $_COOKIE['id']);

            if ($userInfo && $userInfo['password'] == $_COOKIE['hash']) {
                $userInfo['permissions'] = Acl::getUserPermissions($userInfo['id']);
                Registry::setValue('user', $userInfo);
                return true;
            }
        }
        return false;
    }

    /**
     * Creates cookies for user so he can enter site
     * @param int $id user's id
     * @param string $hash user's hash
     * @return void
     */
    public function grantAccess($id, $hash) {
        SetCookie ("id", $id, time() + 50000, '/');
        SetCookie ("hash", $hash, time() + 50000, '/');
    }

    /**
     * Deletes cookies of user so he leaves site
     * @return void
     */
    public function logout() {
        SetCookie("id", "", time() - 3600, '/');
        SetCookie("hash", "", time() - 3600, '/');
    }
}

