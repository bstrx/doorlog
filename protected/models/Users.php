<?php

namespace models;
use core\Db;
use core\Model;
class Users extends Model{
    public function getAllUnregistered(){
        $result = $this->get("SELECT `id` , `name` FROM `tc-db-main`.`personal`  WHERE type='EMP'
            AND id!=ALL(SELECT `personal_id` FROM `users`)");
        return $result;
    }

    public function insertUsers($user, $email, $hash, $salt){
        $db = Db::getInstance();
        $add= $db->query("INSERT INTO users(personal_id, email, password, salt, created) VALUES ('$user', '$email','$hash','$salt', NOW())");
        return $add;
    }
}
?>