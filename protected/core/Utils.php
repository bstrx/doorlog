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