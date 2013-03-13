<?php
namespace core;

class DateTime{
    static $daysShortNames = array('Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Cб', 'Вс');
    static $daysFullNames = array('Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Cуббота', 'Воскресенье');

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
        foreach (self::$daysFullNames as $name) {
            $date = date("Y-m-d", $ts);
            $weekDays[] = array(
                'date' => $date,
                'name' => $name,
            );
            $ts += 24 * 60 * 60;
        }

        return $weekDays;
    }

    static function getWeekFirstDay($ut) {
        $dayNum = date('w', $ut);

        if ($dayNum == 0) {
            $firstDay = strtotime('Monday last week', $ut);
        }
        else {
            $firstDay = strtotime('Monday this week', $ut);
        }

        return $firstDay;
    }
}