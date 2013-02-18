<?php

namespace core;

class ControllersManager{
    private $typedUrl =  array();

<<<<<<< HEAD
    function runController(){
        $typedUrl = $_GET['route'];
        $urlArr=  explode("/", $typedUrl);
        $class = "controllers\\".(ucfirst($urlArr[0]));
        //$class = "controllers\\".$class;
        $method = $urlArr[1];
=======
    function getUrl(){
        $test_url = $_GET['route'];

        if ($test_url)
        {
            $url_arr=  explode("/", $test_url);
            $class = "controllers\\".(ucfirst($url_arr[0]));
            $method = $url_arr[1];
        } else {
            $class = "controllers\\Main";
            $method = "index";
        }

>>>>>>> 37a9c944656439bcbafea9376a7bca6dbd7c4637
        if(class_exists($class, TRUE)){

            $obj = new $class;
            
        }

        if(method_exists($obj, $method)){

            $obj->$method();
            
        }
    }

}