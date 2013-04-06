<?php
namespace core;

class Registry{
    protected static $_registry = array();

    public static function setValue($key, $val){
        if(!array_key_exists($key,  self::$_registry)){
            self::$_registry[$key] = $val;
            return true;
        }
        return false;
    }

    public static function getValue($key){
        if(array_key_exists($key, self::$_registry)){
            return self::$_registry[$key];
        }
        return false;
    }
}

