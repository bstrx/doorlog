<?php
namespace core;

class Utils{

    static function log($type, $data){
       $db = Db::getInstance();
       $result = $db->query("INSERT INTO log(type, data)
             VALUES ('$type', '$data')");
       return $result;
    }

    static function showException($e) {
        echo('Message: ' . $e->getMessage());
        echo('<br>' . 'File: ' . $e->getFile());
        echo('<br>' . 'Line: ' . $e->getLine());
        if($e->getCode()){
            echo('<br>' . 'Code: ' . $e->getCode());
        }
        echo('<br>' . 'Trace: ' . '<pre>' . $e->getTraceAsString() . '</pre>');
    }

    static function createRandomString($minchar = 5, $maxchar=10){
        $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz";
        $length = mt_rand($minchar,$maxchar);
        $randomString = '';
        $charsCount = strlen($chars) - 1;
        for($i = 0; $i < $length; $i++){
            $randomString .= $chars[mt_rand(1, $charsCount)];
        }
        return $randomString;
    }

    static function formatDate($unixtime)
    {
        $h = floor($unixtime / 3600);
        $m = floor($unixtime % 3600 / 60);

        if ($h) {
            $str = $h . ' ч. ' . $m . ' м.';
        } else {
            $str = $m . ' м.';
        }

        return $str;
    }
}