<?php
namespace controllers;

use core\Controller;
use models\Users as UsersModel;
use core\Registry;
use core\Utils;
use models\Holidays as HolidaysModel;
class Main extends Controller
{
    const IN_OFFICE = 2;
    const OUT_OFFICE = 1;

    /**
     * Render main page
     * @return void
     */
    public function indexAction() {
        $userInfo = Registry::getValue('user');
        $userPersonalId = $userInfo['personal_id'];
        $date = $this->getDate();
        if (isset($_COOKIE['col'])){
            $currentTab = array('day'=>'', 'week'=>'', 'month'=>'');
            $currentTab[$_COOKIE['col']] = 'active';
        } else {
            $currentTab = array('day'=>'active', 'week'=>'', 'month'=>'');
        }
            
        $dayInfo = array();
        $weekInfo = $this->getWeekInfo($userPersonalId, $date);
        $monthInfo = $this->getMonthInfo($userPersonalId, $date);


        if (isset($weekInfo['days'][$date])) {
            $dayInfo = $weekInfo['days'][$date];
        }

        $holidaysModel = new HolidaysModel();
        $holidays = $holidaysModel->getAllDays($date);

        $sortedHolidays = array();
        $sum=0;
        foreach ($holidays as $holiday) {
            if ($holiday['type']!=1){
                $sum++;
            }
            $sortedHolidays[$holiday['date']] = $holiday['trigger'];
        }

        $this->render("Main/index.tpl", array(
            'currentDate' => date('Y-m-d', time()),
            'date' => $date,
            'weekDays' => Utils::getWeekDays($date),
            'day' => $dayInfo,
            'week' => $weekInfo,
            'month' => $monthInfo,
            'holidays' => $sortedHolidays,
            'currentTab' => $currentTab,
            'sum'=>$sum
        ));
    }
    
    /**
     * Get week information for user
     * @param integer $userPersonalId
     * @param string $date
     * @return array
     */
    public function getWeekInfo($userPersonalId, $date) {
        $uDay = 24 * 60 * 60;
        $uTime = strtotime($date);
        $uWeekFirstDay = Utils::getWeekFirstDay($uTime);
        $uOffsetDay = $uWeekFirstDay + 7 * $uDay;

        $usersModel = new UsersModel();
        $weekActions = $usersModel->getActions($userPersonalId, $uWeekFirstDay - $uDay, $uOffsetDay);
        $weekPeriods = $this->formPeriods($weekActions, date('Y-m-d', $uOffsetDay));
        return $weekPeriods;
    }

    /**
     * Get month informations for user
     * @param integer $userPersonalId
     * @param string $date
     * @return array
     */
    public function getMonthInfo($userPersonalId, $date) {
        $uDay = 24 * 60 * 60;
        $uTime = strtotime($date);
        $uMonthFirstDay = strtotime('first day of this month', $uTime) - $uDay;
        $uOffsetDay = strtotime('last day of this month', $uTime) + $uDay;

        $usersModel = new UsersModel();
        $monthActions = $usersModel->getActions($userPersonalId, $uMonthFirstDay, $uOffsetDay);
        $monthPeriods = $this->formPeriods($monthActions, date('Y-m-d', $uOffsetDay));
        return $monthPeriods;
    }

    /**
     * Forms array for Periods
     * @param array $actions
     * @param string $offsetDate optional
     * @return array
     */
    public function formPeriods(array $actions, $offsetDate = null) {
        $daysPeriods = array();
        $daysPeriods['total_sum'] = 0;
        $setTimer = false;
        $currentDate = date('Y-m-d', time());
        $previousDate = date('Y-m-d', strtotime('now - 1 day'));

        $actsCount = count($actions);
        for ($i = 0; $i < $actsCount; $i++) {
            $diff = 0;
            $enterTime = null;
            $exitTime = null;
            $day = $actions[$i]['day'];

            if (!isset($daysPeriods['days'][$day])) $daysPeriods['days'][$day] = array();
            if (!isset($daysPeriods['days'][$day]['sum'])) $daysPeriods['days'][$day]['sum'] = 0;
            if (!isset($daysPeriods['days'][$day]['periods'])) $daysPeriods['days'][$day]['periods'] = array();

            //нам нужно выделить пары вход + выход, чтобы добавить их разницу к тому, сколько человек провёл в офисе
            if ($actions[$i]['direction'] == self::IN_OFFICE
                && $day != $offsetDate
                && isset($actions[$i+1])
                && $actions[$i+1]['direction'] == self::OUT_OFFICE){

                $enterTime = strtotime($actions[$i]['logtime']);
                $exitTime = strtotime($actions[$i+1]['logtime']);
                $diff = $exitTime - $enterTime;

                $daysPeriods['days'][$day]['periods'][] = array(
                    'enter' => $enterTime,
                    'exit' => $exitTime,
                    'diff' => $diff,
                    'setTimer' => false,
                );

                $i++;
            } else {
                $actionTime = strtotime($actions[$i]['logtime']);

                if ($actions[$i]['direction'] == self::IN_OFFICE && $day != $offsetDate) {
                    $enterTime = $actionTime;

                    if (!isset($actions[$i+1]) && ($day == $currentDate || $day == $previousDate)) {
                        $setTimer = true;
                        $exitTime = time();
                        $diff = $exitTime - $enterTime;
                    }
                } else $exitTime = $actionTime;

                $daysPeriods['days'][$day]['periods'][] = array(
                    'enter' => $enterTime,
                    'exit' => $exitTime,
                    'diff' => $diff,
                    'setTimer' => $setTimer,
                );
            }

            $daysPeriods['days'][$day]['setTimer'] = $setTimer;
            $daysPeriods['days'][$day]['sum'] += $diff;
            $daysPeriods['total_sum'] += $diff;
        }

        return $daysPeriods;
    }

    /**
     * Return date from $_GET or now date
     * @return date
     */
    public function getDate() {
        if (!empty($_GET['date'])) {
            $unixtime = strtotime($_GET['date']);
            $date = date('Y-m-d', $unixtime);
        } else $date = date('Y-m-d');

        return $date;
    }
}