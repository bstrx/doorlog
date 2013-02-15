<?php

class Registry{
    protected static $_registry = array();

    public static function setValue($key, $val){
        if(!array_key_exists($key,  self::$_registry)){
            self::$_registry[$key] = $val;
        }
    }

    public static function geValue($key){
        if(array_key_exists($key, self::$_registry)){
            return self::$_registry[$key];
        }
    }

    protected function __construct() {

    }

}
