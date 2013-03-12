<?php
namespace models;
use core\Db;
use core\Model;
class Users extends Model{
    public function getAllUnregistered(){
        $result = $this->get("
            SELECT id, name
            FROM `tc-db-main`.`personal`
            WHERE type='EMP'
              AND status='AVAILABLE'
            AND id!=ALL(SELECT `personal_id` FROM `users`)
            ORDER BY name
        ");
        return $result;
    }

    public function getAllRegistered(){
        $result = $this->get("
            SELECT t.NAME as name,
              d.name as department,
              p.name as position,
              u.email as email
            FROM `users` u
            JOIN `tc-db-main`.`personal` t
              ON u.personal_id = t.id
            LEFT JOIN `positions` p
              ON u.position_id = p.id
            LEFT JOIN `departments` d
              ON u.department_id = d.id
        ");
        return $result;
    }

    public function searchByName(){
        $result = $this->get("
            SELECT t.NAME as name,
                t.id
            FROM `users` u
            JOIN `tc-db-main`.`personal` t
              ON u.personal_id = t.id
            WHERE t.NAME LIKE '%" . strval($_GET['term']) . "%'
        ");
        return $result;
    }

    public function insertUsers($user, $email, $hash, $salt, $position, $department){
        $db = Db::getInstance();
        $add= $db->query("INSERT INTO users(personal_id, position_id, email, password, salt, department_id, created) VALUES ('$user','$position', '$email','$hash','$salt','$department', NOW())");
        return $add;
    }

    public function getInfoByEmail($email){
        $result = $this->get("SELECT * FROM `users` WHERE email='$email'");
        return $result[0];
    }

    public function getInfo($id){
        $result = $this->get("
            SELECT t.id, u.email, u.position_id, u.password, u.salt, t.name
            FROM `users` u
            JOIN `tc-db-main`.`personal` t ON u.personal_id = t.id
            WHERE t.id = '$id'
        ");
        return $result[0];
    }

    public function getInfoByCodeKey($codekey){
        $result = $this->get("
            SELECT u.personal_id, u.password, u.salt
            FROM `users` u
            JOIN `tc-db-main`.`personal` t ON u.personal_id = t.id
            WHERE SUBSTRING( HEX (`CODEKEY`) , 5, 4 ) = HEX($codekey)
        ");
        return $result[0];
    }

    public function getActions($userId, $fromDate, $toDate) {
        $q = "SELECT id,
                logtime,
                emphint,
                DATE( logtime ) AS `day`,
                TIME( logtime ) AS `time`,
                SUBSTRING( HEX(  `logdata` ) , 10, 1 ) as direction
            FROM `tc-db-log`.`logs`
            WHERE
              emphint = {$userId}
              AND DATE(logtime) >= FROM_UNIXTIME({$fromDate})
              AND DATE(logtime) <= FROM_UNIXTIME({$toDate})
            ORDER BY logtime ASC
            ";

        $result = $this->get($q);
        return $result;
    }

    public function getPositionsList(){
        $q ="SELECT name, id
             FROM positions";

        $result = $this->get($q);
        return $result;
    }

    public function getDepartmentsList(){
        $q = "SELECT name, id
              FROM departments";

        $result = $this->get($q);
        return $result;
    }
}
