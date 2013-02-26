<?php
namespace models;

use core\Model;

class Users extends Model
{
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