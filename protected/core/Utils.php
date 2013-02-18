<?php

namespace core;

    class Utils{
        
        static function log($type, $data){
           $db1 = ConnectDb::getInstance();           
           $result1 = $db1->query("INSERT INTO log(type, data) 
                 VALUES ('$type', '$data')");
           if(!result1)
               return false;
           else return true;
        }     
    }
    
    ?>
