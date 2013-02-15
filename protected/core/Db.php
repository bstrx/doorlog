<?php

namespace core;

class ConnectDb {
    
    protected static $_instance;
    
    private function __construct() {
        
    }
 
    private function __clone() {
        
    }
    
    public static function getInstance() {
        
        if (null === self::$_instance) {
            self::$_instance = new \PDO( 'mysql:host=localhost;dbname=tc-db-main', 'root', '123456');
            self::$_instance->query ( 'SET character_set_connection = utf-8' );
            self::$_instance->query ( 'SET character_set_client = utf-8' );
            self::$_instance->query ( 'SET character_set_results = utf-8' );
            self::$_instance->query ( 'SET NAMES utf8' );
        }
        
        return self::$_instance;
    }

}
