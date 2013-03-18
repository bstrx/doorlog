<?php
namespace models;
use core\Db;
use core\Model;

class Users extends Model{
    public function getAllUnregistered(){
        $result = $this->fetchAll("
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
        $result = $this->fetchAll("
            SELECT
              t.id,
              t.NAME as name,
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
            ORDER BY t.NAME
        ");

        return $result;
    }

    public function searchByName($name){
        $result = $this->fetchAll("
            SELECT t.NAME as name,
                t.id
            FROM `users` u
            JOIN `tc-db-main`.`personal` t
              ON u.personal_id = t.id
            WHERE t.NAME LIKE '%" . $name . "%'
            ORDER BY t.NAME
        ");

        return $result;
    }

    public function insertUsers($user, $email, $hash, $salt, $position, $department){
        $db = Db::getInstance();
        $add= $db->query("INSERT INTO users(personal_id, position_id, email, password, salt, department_id, created)
            VALUES ('$user','$position', '$email','$hash','$salt','$department', NOW())");
        return $add;
    }

    public function getInfo($id){
        $result = $this->fetchOne("
            SELECT t.id, u.email, u.position_id, u.password, u.salt, t.name
            FROM `users` u
            JOIN `tc-db-main`.`personal` t ON u.personal_id = t.id
            WHERE t.id = '$id'
        ");

        return $result;
    }

    public function getInfoByEmail($email){
        $result = $this->fetchOne("
            SELECT *
            FROM `users`
            WHERE email='$email'
        ");

        return $result;
    }

    public function getInfoByCodeKey($codekey){
        $result = $this->fetchOne("
            SELECT u.personal_id, u.password, u.salt
            FROM `users` u
            JOIN `tc-db-main`.`personal` t ON u.personal_id = t.id
            WHERE SUBSTRING( HEX(`CODEKEY`) , 5, 4 ) = HEX($codekey)
        ");

        return $result;
    }

    public function getActions($userId, $fromDate, $toDate){
        $q = "SELECT id,
                logtime,
                emphint,
                DATE( logtime ) AS `day`,
                TIME( logtime ) AS `time`,
                SUBSTRING( HEX( `logdata` ) , 10, 1 ) as direction
            FROM `tc-db-log`.`logs`
            WHERE
              emphint = {$userId}
              AND DATE(logtime) >= FROM_UNIXTIME({$fromDate})
              AND DATE(logtime) <= FROM_UNIXTIME({$toDate})
            ORDER BY logtime ASC
            ";

        $result = $this->fetchAll($q);
        return $result;
    }

    public function getPositionsList(){
        $q ="SELECT name, id
             FROM positions";

        $result = $this->fetchAll($q);
        return $result;
    }

    public function getDepartmentsList(){
        $q = "SELECT name, id
              FROM departments";

        $result = $this->fetchAll($q);
        return $result;

    }

    public function getUserRoles($userId){
        $q = "SELECT roles.role_name
            FROM persons_roles
            INNER JOIN roles ON persons_roles.id_role = roles.id
            INNER JOIN users ON persons_roles.id_person = users.personal_id
            WHERE users.personal_id =  '$userId'";

        $result = $this->fetchAll($q);
        return $result;
    }

    public function getUserInfo($id){
        $q = "SELECT t.name as name,
              d.name as department,
              p.name as position
            FROM `tc-db-main`.`personal` t
            JOIN `users` u
              ON t.id = u.personal_id
            LEFT JOIN `positions` p
              ON u.position_id = p.id
            LEFT JOIN `departments` d
              ON u.department_id = d.id
            WHERE u.personal_id = '$id'
            ";

        $result = $this->fetchOne($q);
        return $result;
    }

    public function getUserStatus($id){
        $q = "SELECT SUBSTRING( HEX(`logdata`) , 10, 1 ) as status
            FROM `tc-db-log`.`logs`
            WHERE emphint = '$id'
              AND logtime <= NOW() - INTERVAL 1 DAY
            ORDER BY logtime DESC
            LIMIT 1";

        $result = $this->fetchOne($q);
        return $result;
    }

    public function getRolePermissions($roleId){
        $q = "SELECT permissions.key
                FROM roles_permissions rp
                INNER JOIN roles r ON rp.id_role = r.id
                INNER JOIN permissions p ON rp.id_permission = p.id
                WHERE roles.id = '$roleId'";

        $result = $this->getAll($q);
        return $result;
    }
}
