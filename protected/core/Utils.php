<?php
namespace core;

class Utils{

    static function log($type, $data){
       $db = Db::getInstance();           
       $result = $db->query("INSERT INTO log(type, data) 
             VALUES ('$type', '$data')");
       return $result;
    }     
}

class ExceptionsManager {
    static function show($e) {
        echo('Message: ' . $e->getMessage());
        echo('<br>' . 'File: ' . $e->getFile());
        echo('<br>' . 'Line: ' . $e->getLine());
        if($e->getCode()){
            echo('<br>' . 'Code: ' . $e->getCode());
        echo('<br>' . 'Trace: ' . '<pre>' . $e->getTraceAsString() . '</pre>');
        }
    }
}