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

    //Получает все периоды входов-выходов пользователя за определённый месяц
    public function getMonthlyUserActions($userId, $timestamp = null) {
        if (is_null($timestamp)) $timestamp = time();

        $month = date('n', $timestamp);
        $year = date('Y', $timestamp);

        $q = "SELECT id,
                logtime,
                emphint,
                DATE( logtime ) AS `day`,
                TIME( logtime ) AS `time`,
                SUBSTRING( HEX(  `logdata` ) , 10, 1 ) as direction
            FROM `tc-db-log`.`logs`
            WHERE
              emphint = {$userId}
              AND MONTH(logtime) = {$month}
              AND YEAR(logtime) = {$year}
            ORDER BY logtime ASC
            ";

        $result = $this->get($q);
        return $result;
    }

    //Получает все периоды входов-выходов пользователя за определённую неделю
    public function getWeeklyUserActions($userId, $timestamp = null) {
        if (is_null($timestamp)) $timestamp = time();

        $week = (int) date('W', $timestamp);
        $year = date('Y', $timestamp);

        $q = "SELECT id,
                logtime,
                emphint,
                DATE( logtime ) AS `day`,
                TIME( logtime ) AS `time`,
                SUBSTRING( HEX(  `logdata` ) , 10, 1 ) as direction
            FROM `tc-db-log`.`logs`
            WHERE
              emphint = {$userId}
              AND WEEK(logtime, 1) = {$week}
              AND YEAR(logtime) = {$year}
            ORDER BY logtime ASC
            ";

        $result = $this->get($q);
        return $result;
    }
}
