<?php
namespace models;
use core\Db;
use core\Model;

class Users extends Model{
    public function getAllUnregistered(){
        $q= "SELECT id, name
            FROM `tc-db-main`.`personal`
            WHERE type='EMP'
              AND status='AVAILABLE'
            AND id!=ALL(SELECT `personal_id` FROM `user`)
            ORDER BY name";
        $result = $this->fetchAll($q);

        return $result;
    }

    public function getAllRegistered(){
        $q= "SELECT
              t.id,
              t.NAME as name,
              d.name as department,
              p.name as position,
              u.email as email
            FROM `user` u
            JOIN `tc-db-main`.`personal` t
              ON u.personal_id = t.id
            LEFT JOIN `position` p
              ON u.position_id = p.id
            LEFT JOIN `department` d
              ON u.department_id = d.id
            ORDER BY t.NAME";
        $result = $this->fetchAll($q);

        return $result;
    }

    public function searchByName($name){
        $searchName = '%' . $name . '%';
        $q="SELECT t.NAME as name,
                t.id
            FROM `user` u
            JOIN `tc-db-main`.`personal` t
              ON u.personal_id = t.id
            WHERE t.NAME LIKE :searchName
            ORDER BY t.NAME
        ";
        $params=array();
        $params['searchName']=$searchName;
        $result = $this->fetchAll($q,$params);

        return $result;
    }

    public function insertUsers($user, $email, $hash, $salt, $position, $department, $tel, $bday){
        $db = Db::getInstance();
        $add="INSERT INTO user(personal_id, position_id, email, password, salt, department_id, created, birthday, phone)
            VALUES (:user,:position,:email,:hash,:salt,:department, NOW(), :bday, :tel)";
        $params=array();
        $params['user'] = $user;
        $params['position'] = $position;
        $params['email'] = $email;
        $params['hash'] = $hash;
        $params['salt'] = $salt;
        $params['department'] = $department;
        $params['bday'] = $bday;
        $params['tel'] = $tel;
        
        $result = $this->execute($add,$params);
        return $result;
    }

    public function checkUserAttr($email, $tel){
        $attr = array();
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)){
            $attr[0] = 'Ошибка заполнения поля Email';
        }
        if (!is_numeric($tel)){
            $attr[1] = 'Ошибка заполнения поля Телефон';
        }
        return $attr;
    }

    public function getInfo($id){
        $q="
            SELECT t.id, u.email, u.position_id, u.password, u.salt, t.name
            FROM `user` u
            JOIN `tc-db-main`.`personal` t ON u.personal_id = t.id
            WHERE t.id = :id
        ";
        $params=array();
        $params['id']=$id;
        $result = $this->fetchOne($q,$params);

        return $result;
    }

    public function getInfoByEmail($email){
        $q="SELECT *
            FROM `user`
            WHERE email=:email";
        $params=array();
        $params['email']=$email;
        $result = $this->fetchOne($q,$params);

        return $result;
    }

    public function getInfoByCodeKey($codekey){
        $q="SELECT u.personal_id, u.password, u.salt
            FROM `user` u
            JOIN `tc-db-main`.`personal` t ON u.personal_id = t.id
            WHERE SUBSTRING( HEX(`CODEKEY`) , 5, 4 ) = HEX(:codekey)";
        $params=array();
        $params['codekey']=$codekey;
        $result = $this->fetchOne($q,$params);

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
              emphint = :userId
              AND DATE(logtime) >= FROM_UNIXTIME(:fromDate)
              AND DATE(logtime) <= FROM_UNIXTIME(:toDate)
            ORDER BY logtime ASC
            ";
        $params=array();
        $params['userId']=$userId;
        $params['fromDate']=$fromDate;
        $params['toDate']=$toDate;
        $result = $this->fetchAll($q,$params);
        return $result;
    }

    public function getPositionsList(){
        $q ="SELECT name, id
             FROM position";

        $result = $this->fetchAll($q);
        return $result;
    }

    public function getDepartmentsList(){
        $q = "SELECT name, id
              FROM department";

        $result = $this->fetchAll($q);
        return $result;

    }

    public function getUserRoles($userId){
        $q = "SELECT role.name
            FROM users_roles
            INNER JOIN role ON users_roles.id_role = role.id
            INNER JOIN user ON users_roles.id_person = user.personal_id
            WHERE user.personal_id =  :userId";
        $params=array();
        $params['userId']=$userId;
        $result = $this->fetchAll($q,$params);
        return $result;
    }

    public function getUserInfo($id){
        $q = "SELECT t.name as name,
              d.name as department,
              p.name as position
            FROM `tc-db-main`.`personal` t
            JOIN `user` u
              ON t.id = u.personal_id
            LEFT JOIN `position` p
              ON u.position_id = p.id
            LEFT JOIN `department` d
              ON u.department_id = d.id
            WHERE u.personal_id = :id
            ";
        $params=array();
        $params['id']=$id;

        $result = $this->fetchOne($q,$params);
        return $result;
    }

    public function getUserStatus($id){
        $q = "SELECT SUBSTRING( HEX(`logdata`) , 10, 1 ) as status
            FROM `tc-db-log`.`logs`
            WHERE emphint = :id
              AND logtime <= NOW() - INTERVAL 1 DAY
            ORDER BY logtime DESC
            LIMIT 1";
        $params=array();
        $params['id']=$id;

        $result = $this->fetchOne($q,$params);
        return $result;
    }

    public function getRolePermissions($roleId){
        $q = "SELECT permission.key
                FROM roles_permissions rp
                INNER JOIN role r ON rp.id_role = r.id
                INNER JOIN permission p ON rp.id_permission = p.id
                WHERE role.id = :roleId";
        $params=array();
        $params['roleId']=$roleId;
        $result = $this->getAll($q,$params);
        return $result;
    }
}
