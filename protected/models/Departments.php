<?php

namespace models;
use core\Db;
use core\Model;

class Departments extends Model {

        /**
         * Get all departments(id, name, chief_name) and amount users
         * @return array
         */
        public function getAll(){
            $q = "SELECT
                d.id,
                d.name,
                count(u.id) as total_users,
                t.name as chief_name
                FROM department as d
                LEFT JOIN user as u ON u.department_id = d.id
                LEFT JOIN user as us ON us.id = d.chief_id
                LEFT JOIN `tc-db-main`.personal as t ON t.id = us.personal_id
                GROUP BY d.id";
            $result = $this->fetchAll($q);
        return $result;
        }

        /**
         * Get all depatments name and id
         * @return array
         */
        public function getMenuDepartments(){
            $q = "SELECT name, id
                FROM department";
                $result = $this->fetchAll($q);
            return $result;
        }

        /**
         * Get department name by id
         * @param integer $id
         * @return array
         */
        public function getDepById($id){
            $q = "SELECT * FROM department WHERE id = (:id)";
            $params = array();
            $params['id'] = $id;
            $result = $this->fetchOne($q, $params);
            return $result;
        }

        /**
         * Add new departament
         * @param string $depName
         * @return bool
         */
        public function createDep($depName){
            $q = "INSERT INTO department(name) VALUES(:depName)";
            $params = array();
            $params['depName'] = $depName;
            $result = $this->execute($q, $params);
            return $result;
            }

        /**
         * Delete departament
         * @param integer $id
         * @return bool
         */
        public function dellDep($id){
            $params = array();
            $params['id'] = $id;
            $q = "DELETE FROM department WHERE id = (:id)";
            $q1 = "UPDATE user SET department_id = '0' WHERE department_id = (:id) ";
            $result = $this->execute($q, $params);
            $result1 = $this->execute($q1, $params);
            return $result;
        }

        /**
         * Edit departament
         * @param string $newname
         * @param integer $id
         * @param integer $chief
         * @return bool
         */
        public function editDep($newname, $id, $chief){
            $params = array();
            $params['id'] = $id;
            $params['newname'] = $newname;
            $params['chief'] = $chief;
            $q = "UPDATE department SET name = (:newname), chief_id = (:chief) WHERE id = (:id) ";
            $result = $this->execute($q, $params);
            return $result;
        }

        /**
         * Get all users in current departament
         * @param integer $depId
         * @return array
         */
        public function getUsers($depId){
            $attr = array();
            $q = "SELECT p.name , pos.name as position, u.personal_id, u.id
                FROM `tc-db-main`.personal as p
                LEFT JOIN `savage-db`.user as u
                ON u.personal_id = p.id
                LEFT JOIN `savage-db`.position as pos
                ON u.position_id = pos.id
                WHERE u.department_id = :depId";
            $attr['depId'] = $depId;
            $result = $this->fetchAll($q, $attr);
            return $result;
        }

        public function getTotalUsers($id){
            $params = array();
            $params['id'] = $id;
            $q = "SELECT count(id) as total_users
                FROM user
                WHERE department_id = :id";
            $result = $this->fetchOne($q, $params);
            return $result;
        }
}