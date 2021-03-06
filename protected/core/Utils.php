<?php
namespace core;

class Utils{
    static $daysFullNames = array('Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Cуббота', 'Воскресенье');

    /**
     * Logs data to db
     * @param string $type f.e. 'USER_ADD'
     * @param string $data
     * @return bool
     */
    public static function log($type, $data){
        $db = Db::getInstance();
        $result = $db->query("INSERT INTO log(type, data)
            VALUES ('$type', '$data')");

        return $result;
    }

    /**
     * Shows exception
     * @param object $e
     */
    public static function showException($e) {
        echo('Message: ' . $e->getMessage());
        echo('<br>' . 'File: ' . $e->getFile());
        echo('<br>' . 'Line: ' . $e->getLine());
        if($e->getCode()){
            echo('<br>' . 'Code: ' . $e->getCode());
        }
        echo('<br>' . 'Trace: ' . '<pre>' . $e->getTraceAsString() . '</pre>');
    }

    /**
     * Generates random string (for salt, password)
     * @param int $minchar
     * @param int $maxchar
     * @return string
     */
    public static function createRandomString($minchar = 5, $maxchar=10){
        $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz";
        $length = mt_rand($minchar,$maxchar);
        $randomString = '';
        $charsCount = strlen($chars) - 1;
        for($i = 0; $i < $length; $i++){
            $randomString .= $chars[mt_rand(1, $charsCount)];
        }

        return $randomString;
    }

    /**
     * Sends letter to specified email
     * @param string $email
     * @param string $subject
     * @param string $message
     * @return bool
     */
    public static function sendMail($email, $subject, $message) {
        if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $headers  = 'MIME-Version: 1.0' . "\r\n";
            $headers .= 'Content-type: text/html; charset=UTF-8' . "\r\n";
            $headers .= 'From: Opensoft Savage' . "\r\n";
            return mail($email, $subject, $message, $headers);
        }

        return false;
    }

    /**
     * Transforms unixtime to hours and minutes
     * @param int $unixtime
     * @return string
     */
    public static function formatDate($unixtime) {
        $h = floor($unixtime / 3600);
        $m = floor($unixtime % 3600 / 60);

        $h = str_pad($h, 2, "0", STR_PAD_LEFT);
        $m = str_pad($m, 2, "0", STR_PAD_LEFT);

        $str = $h . ' ч ' . $m . ' м';

        return $str;
    }

    /**
     * Returns all days of the week which includes specified date
     * @param $date
     * @return array
     */
    public static function getWeekDays($date) {
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

    /**
     * Returns first day of the month which includes specified day
     * @param int $ut day unixtime
     * @return int unixtime
     */
    public static function getWeekFirstDay($ut) {
        $dayNum = date('w', $ut);

        if ($dayNum == 0) {
            $firstDay = strtotime('Monday last week', $ut);
        } else {
            $firstDay = strtotime('Monday this week', $ut);
        }

        return $firstDay;
    }

    public static function redirect($url = '/') {
        $cfg = Registry::getValue('config');
        header('Location: ' . $cfg['root'] . $url);
        die();
    }

    /**
     * Create *.xls file
     * @param array $report
     * @return void
     */
    public function tabletoxls($report){
        if ($report){
            $pExcel = new \PHPExcel();
            $pExcel->setActiveSheetIndex(0);
            $aSheet = $pExcel->getActiveSheet();
            //style
            $aSheet->getColumnDimension('A')->setWidth(15);
            $aSheet->getColumnDimension('B')->setWidth(10);
            $aSheet->getColumnDimension('D')->setWidth(10);

            $iter = 1;
            $countUser = count($report);
            for ($usr=0; $usr < $countUser; $usr++) {
                $aSheet->mergeCells("A$iter:D$iter");
                $aSheet->setCellValueByColumnAndRow(0,$iter, $report[$usr]['name']);
                $iter++;
                $aSheet->setCellValueByColumnAndRow(0,$iter,'День недели');
                $aSheet->setCellValueByColumnAndRow(1,$iter,'Дата');
                $aSheet->setCellValueByColumnAndRow(2,$iter,'Время');
                $aSheet->setCellValueByColumnAndRow(3,$iter,'Тип отгула');
                $iter++;

                foreach ($report[$usr]['reports'] as $curr) {
                    $aSheet->setCellValueByColumnAndRow(0, $iter, $curr['dayName']);
                    $aSheet->setCellValueByColumnAndRow(1, $iter, $curr['date']);
                    $aSheet->setCellValueByColumnAndRow(2, $iter, $curr['time']);
                    $aSheet->setCellValueByColumnAndRow(3, $iter, $curr['timeoffName']);
                    $iter++;
                }
            }
            $objWriter = new \PHPExcel_Writer_Excel5($pExcel);
            if ($countUser>1){
                $name = $report[0]['depName'].'.xls';
            } else {
                $name = $report[0]['name'].'.xls';
            }
            header('Content-Disposition: attachment; filename='.$name);
            $objWriter->save('php://output');
        }

    }
}