<?php
namespace models;
use core\Db;
use core\Model;

class Users extends Model{

    /**
     * Get all unregistered users in system
     * @return array
     */
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

    /**
     * Get all registered users in system or from $firstElement to $firstElement+$elementsCount optional
     * @param integer $firstElement
     * @param integer $elementsCount
     * @return array
     */
    public function getRegistered($firstElement=0, $elementsCount=0){
        $params = array();
        $q= "SELECT
              u.id,
              t.id as personal_id,
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
            ORDER BY t.NAME ";

        if ($elementsCount){
            $q.="LIMIT :firstElement, :elementsCount";
            $params['firstElement'] = $firstElement;
            $params['elementsCount'] = $elementsCount;
        }

        $result = $this->fetchAll($q, $params);
        return $result;
    }

    /**
     * Get amount all registered users
     * @return array
     */
    public function getAllRegisteredCount(){
        $q = "SELECT count(id) AS count
              FROM user";
        $result = $this->fetchOne($q);
        return $result;
    }

    /**
     * Get all users which names contain searchstring
     * @param string $name
     * @return array
     */
    public function searchByName($name){
        $searchName = '%' . $name . '%';
        $q="SELECT t.NAME as name,
                u.id,
                d.name as dep,
                p.name as pos
            FROM `user` u
            JOIN `tc-db-main`.`personal` t
              ON u.personal_id = t.id
            LEFT JOIN department as d
              ON u.department_id = d.id
            LEFT JOIN position as p
              ON u.position_id = p.id
            WHERE t.NAME LIKE :searchName
            ORDER BY t.NAME
        ";
        $params=array();
        $params['searchName']=$searchName;
        $result = $this->fetchAll($q,$params);

        return $result;
    }

    /**
     * Add new user
     * @param string $user
     * @param string $email
     * @param string $hash
     * @param string $salt
     * @param integer $position
     * @param integer $department
     * @param integer $tel
     * @param date $bday
     * @param bool $is_shown
     * @return bool
     */
    public function insertUsers($user, $email, $hash, $salt, $position, $department, $tel, $bday, $is_shown){
        $add="INSERT INTO user(personal_id, position_id, email, password, salt, department_id, created, birthday, phone,is_shown)
            VALUES (:user,:position,:email,:hash,:salt,:department, NOW(), :bday, :tel, :is_shown)";
        $params=array();
        $params['user'] = $user;
        $params['position'] = $position;
        $params['email'] = $email;
        $params['hash'] = $hash;
        $params['salt'] = $salt;
        $params['department'] = $department;
        $params['bday'] = $bday;
        $params['tel'] = $tel;
        $params['is_shown'] = $is_shown;

        $result = $this->execute($add,$params);
        return $result;
    }

    /**
     * Validation of the contents of fields
     * @param string $email
     * @param integer $tel
     * @param integer $position
     * @param integer $department
     * @return array
     */
    public function checkUserAttr($email, $tel, $position, $department){
        $errors = array();
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)){
            $errors[] = 'Email';
        }

        if (!is_numeric($tel)){
            $errors[] = 'Телефон';
        }

        if (!$position){
            $errors[] = 'Должность';
        }

        if (!$department){
            $errors[] = 'Отдел';
        }
        return $errors;
    }

    /**
     * Get all user attributes by id
     * @param integer $id
     * @return array
     */
    public function getInfo($id){
        $q="
            SELECT u.id,
                u.email,
                u.position_id,
                u.password,
                u.salt,
                t.id as personal_id,
                t.name
            FROM `user` u
            JOIN `tc-db-main`.`personal` t
              ON u.personal_id = t.id
            WHERE u.id = :id
        ";
        $params=array();
        $params['id']=$id;
        $result = $this->fetchOne($q,$params);

        return $result;
    }

    /**
     * Get all user attributes by email
     * @param string $email
     * @return array
     */
    public function getInfoByEmail($email){
        $q="SELECT *
            FROM `user`
            WHERE email=:email";
        $params = array();
        $params['email']=$email;
        $result = $this->fetchOne($q,$params);

        return $result;
    }

    /**
     * Get user attributes by codekey
     * @param integer $codekey
     * @return array
     */
    public function getInfoByCodeKey($codekey){
        $codekey = (int) $codekey;
        $q="SELECT u.id, u.personal_id, u.email, u.password, u.salt
            FROM `user` u
            JOIN `tc-db-main`.`personal` t ON u.personal_id = t.id
            WHERE SUBSTRING( HEX(`CODEKEY`) , 5, 4 ) = HEX($codekey)";
        $result = $this->fetchOne($q);
        return $result;
    }

    /**
     * Get list etrys and exits in date range
     * @param integer $userId
     * @param date $fromDate
     * @param date $toDate
     * @return array
     */
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

    /**
     * Get all position name and id
     * @return array
     */
    public function getPositionsList(){
        $q ="SELECT name, id
             FROM position";

        $result = $this->fetchAll($q);
        return $result;
    }

    /**
     * Get all department name and id
     * @return array
     */
    public function getDepartmentsList(){
        $q = "SELECT name, id
              FROM department";

        $result = $this->fetchAll($q);
        return $result;

    }

    /**
     * Get user role by user_id
     * @param integer $userId
     * @return array
     */
    public function getUserRoles($userId){
        $q = "SELECT r.name, r.id
            FROM users_roles as ur
            JOIN role as r ON ur.role_id = r.id
            JOIN user as u ON ur.user_id = u.id
            WHERE u.id = :userId";
        $params=array();
        $params['userId']=$userId;
        $result = $this->fetchAll($q,$params);
        return $result;
    }

    /**
     * Get all user attributes by user_id
     * @param integer $userId
     * @return array
     */
    public function getUserInfo($userId){
        $q = "SELECT
              u.id,
              u.personal_id,
              u.position_id,
              u.department_id,
              t.name,
              u.email,
              d.name as department,
              p.name as position,
              u.birthday,
              u.phone,
              u.created,
              u.is_shown
            FROM `tc-db-main`.`personal` t
            JOIN `user` u
              ON t.id = u.personal_id
            LEFT JOIN `position` p
              ON u.position_id = p.id
            LEFT JOIN `department` d
              ON u.department_id = d.id
            WHERE u.id = :id
            ";
        $params=array();
        $params['id']=$userId;

        $result = $this->fetchOne($q,$params);
        $result['created'] = date("d.m.Y", strtotime($result['created']));
        return $result;
    }

    /**
     * Get user status by user_id
     * @param integer $id
     * @return array
     */
    public function getUserStatus($id){
        $q = "SELECT SUBSTRING( HEX(`logdata`) , 10, 1 ) as status
            FROM `tc-db-log`.`logs`
            WHERE emphint = :id
            AND logtime  >= NOW() - INTERVAL 1 DAY
            ORDER BY logtime DESC
            LIMIT 1";
        $params=array();
        $params['id']=$id;

        $result = $this->fetchOne($q,$params);
        return $result;
    }

    /**
     * Get all user statuses 
     * @return array
     */
    public function getUserStatuses(){
        $q = "SELECT * FROM status";
        $result = $this->fetchAll($q);
        return $result;
    }

    /**
     * Get permission for role by role_id
     * @param integer $roleId
     * @return array
     */
    public function getRolePermissions($roleId){
        $q = "SELECT p.key
                FROM roles_permissions rp
                INNER JOIN role r ON rp.role_id = r.id
                INNER JOIN permission p ON rp.permission_id = p.id
                WHERE role.id = :roleId";
        $params=array();
        $params['roleId']=$roleId;
        $result = $this->fetchAll($q,$params);
        return $result;
    }

    /**
     * Add timeoff for current user
     * @param integer $id
     * @param integer $type
     * @param date $data
     * @return array
     */
    public function setTimeoffs($id, $type, $data){
        $q = 'INSERT INTO users_statuses(user_id, status_id, date) VALUES (:id, :type, :date) ';
        $params = array();
        $params['id'] = $id;
        $params['type'] = $type;
        $params['date'] = $data;
        $result = $this->execute($q, $params);
        return $result;
    }

    /**
     * Get timeoff for current user by id
     * @param integer $id
     * @param integer $type
     * @param date $data
     * @return array
     */
    public function getTimeoffsById($id, $date, $type){

        $date1 = date("y-m-d", strtotime($date));
        $date2 = date("y-m-d", (strtotime($date) + 30*24*60*60 ));
        $params = array();
        $params['id'] = $id;
        $params['date1'] = $date1;
        $params['date2'] = $date2;
        $q = "SELECT *
            FROM users_statuses AS u
        LEFT JOIN status AS s ON u.status_id = s.id
        WHERE u.user_id in
        (SELECT id FROM user WHERE id = :id AND is_shown = 1 )
        AND u.date
        BETWEEN :date1 AND :date2 " ;

        if($type){
            $params['type'] = $type;
            $q = $q." AND u.status_id = :type";
        }
        $result = $this->fetchAll($q, $params);
        return $result;
    }

    /**
     * Edit current user
     * @param integer $id
     * @param integer $position
     * @param string $email
     * @param integer $department
     * @param date $birthday
     * @param integer $phone
     * @param bool $is_shown
     * @return bool
     */
    public function editUser($id, $position, $email, $department, $birthday, $phone, $is_shown){
        $params = array();
        $params['id'] = $id;
        $params['position'] = $position;
        $params['email'] = $email;
        $params['department'] = $department;
        $params['birthday'] = $birthday;
        $params['phone'] = $phone;
        $params['is_shown'] = $is_shown;
        $q= "UPDATE user
            SET position_id = (:position),
            email = (:email),
            department_id = (:department),
            birthday = (:birthday),
            phone = (:phone),
            is_shown = (:is_shown)
            WHERE id = (:id)";
        $result = $this->execute($q, $params);
        return $result;
    }

    /**
     * Change password
     * @param integer $id
     * @param string $newPass
     * @return bool
     */
    public function editUserPass($id,$newPass){
        $params = array();
        $params['id'] = $id;
        $params['newPass'] = $newPass;
        $q = "UPDATE user SET password = (:newPass) WHERE id = (:id)";
        $result = $this->execute($q, $params);
        return $result;
    }

    /**
     * Delete user by id
     * @param integer $id
     * @return bool
     */
    public function deleteUser($id){
      $params = array();
      $params['id'] = $id;
      $q = "DELETE FROM user WHERE id = (:id)";
      $result = $this->execute($q, $params);
      return $result;
    }

    /**
     * Get personal_id by id
     * @param integer $id
     * @return integer
     */
    public function getPersonalId($id){
        $params =array();
        $params['id'] = $id;
        $q = "SELECT personal_id FROM user WHERE id = :id";
        $result = $this->fetchOne($q, $params);
        if (isset($result['personal_id'])){
            return $result['personal_id'];
        } else {
            return false;
        }
    }

    /**
     * Get id by personal_id
     * @param integer $personalId
     * @return integer
     */
    public function getId($personalId){
        $params =array();
        $params['personalId'] = $personalId;
        $q = "SELECT id FROM user WHERE personal_id = :personalId";
        $result = $this->fetchOne($q, $params);
        if (isset($result['id'])){
            return $result['id'];
        } else {
            return false;
        }
    }
}