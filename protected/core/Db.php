<?php

namespace core;
use core\Registry;

class Db {
    protected static $_instance;

    private function __construct() {}

    private function __clone() {}

    public static function getInstance() {
       if (null === self::$_instance) {
            $values = Registry::getValue('config');
            $valuesDb = $values['db'];
            $connectionString = "mysql:host=" . $valuesDb['host'] . ";port=" . $valuesDb['port'] .";dbname=" . $valuesDb['dbname'];

            self::$_instance = new \PDO($connectionString, $valuesDb['user'], $valuesDb['password']);
            self::$_instance->query ( 'SET character_set_connection = utf-8' );
            self::$_instance->query ( 'SET character_set_client = utf-8' );
            self::$_instance->query ( 'SET character_set_results = utf-8' );
            self::$_instance->query ( 'SET NAMES utf8' );
            self::$_instance->setAttribute(\PDO::ATTR_EMULATE_PREPARES, FALSE);

       }

       return self::$_instance;
    }
}


