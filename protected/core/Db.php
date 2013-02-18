<?php

namespace core;
use core\Registry;

class Db {
    
    protected static $_instance;
    private $values;
    private $host;
    private $dbname;
    private $user;
    private $password;




    private function __construct() {
        
    }
 
    private function __clone() {
        
    }
    
    public static function getInstance() {
        
       if (null === self::$_instance) {
          
            $values = Registry::getValue('config');
            $valuesDb = $values['db'];

            
            self::$_instance = new \PDO("mysql:host=" . $valuesDb['host'] . ";dbname=" . $valuesDb['dbname'] , $valuesDb['user'], $valuesDb['password']);
            
            self::$_instance->query ( 'SET character_set_connection = utf-8' );
            self::$_instance->query ( 'SET character_set_client = utf-8' );
            self::$_instance->query ( 'SET character_set_results = utf-8' );
            self::$_instance->query ( 'SET NAMES utf8' );
       }
        
       return self::$_instance;
    }

}


