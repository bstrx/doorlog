<?php
namespace core;

class DateTime{
    static $daysShortNames = array('Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Cб', 'Вс');
    static $daysFullNames = array('Понедельник', 'Вторник', 'Среда', 'Пятница', 'Четверг', 'Cуббота', 'Воскресенье');

    static function formatDate($unixtime) {
        $h = floor($unixtime / 3600);
        $m = floor($unixtime % 3600 / 60);

        $str = $h . ' ч ' . $m . ' м';
        return $str;
    }

    static function getWeekDays($date) {
        $ts = strtotime($date);
        $dayOfWeek = date('w', $ts);
        $offset = $dayOfWeek - 1;
        if ($offset < 0) {
            $offset = 6;
        }
        $ts -= $offset * 24 * 60 * 60;

        $weekDays = array();
        foreach (self::$daysShortNames as $name) {
            $date = date("Y-m-d", $ts);
            $weekDays[] = array(
                'date' => $date,
                'name' => $name,
            );
            $ts += 24 * 60 * 60;
        }

        return $weekDays;
    }

}