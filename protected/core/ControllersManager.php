<?php

namespace core;

class ControllersManager{
    private $typedUrl =  array();

    function runController(){
        $typedUrl = $_GET['route'];
        $urlArr=  explode("/", $typedUrl);
        $class = "controllers\\".(ucfirst($urlArr[0]));
        //$class = "controllers\\".$class;
        $method = $urlArr[1];
        if(class_exists($class, TRUE)){

            $obj = new $class;
            
        }

        if(method_exists($obj, $method)){

            $obj->$method();
            
        }
    }

}