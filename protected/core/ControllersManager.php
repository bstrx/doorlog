<?php

namespace core;

class ControllersManager{
    private $typedUrl =  array();


    function runController(){
        $typedUrl = $_GET['route'];

        if ($typedUrl)
        {
            $urlArr=  explode("/", $typedUrl);
            $class = "controllers\\".(ucfirst($urlArr[0]));
            $method = $urlArr[1];
        } else {
            $class = "controllers\\Main";
            $method = "index";
        }

        if(class_exists($class, TRUE)){

            $obj = new $class;
            
        }

        if(method_exists($obj, $method)){

            $method .= 'Action';
            $obj->$method();
            
        }
    }

}