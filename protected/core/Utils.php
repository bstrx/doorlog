<?php
namespace core;

class Utils{

    static function log($type, $data){
       $db = ConnectDb::getInstance();           
       $result = $db->query("INSERT INTO log(type, data) 
             VALUES ('$type', '$data')");
       return result;
    }     
}