<?php

namespace core;

class ControllersManager{
    private $test_url =  array();

    function getUrl(){

        $test_url = $_GET['route'];

        if ($test_url) {
            $url_arr=  explode("/", $test_url);
            $class = "controllers\\".(ucfirst($url_arr[0]));
            If(!$method = $url_arr[1]){
                $method = "index";
            } else
            {
                $method = $url_arr[1];
            }

        } else {
            $class = "controllers\\Main";
            $method = "index";
        }

//        if (!$test_url)
//            {$url_arr=  explode("/", $test_url);
//            $class = "controllers\\".(ucfirst($url_arr[0]));
//            $method = "index";
//
//        }

        if(class_exists($class, TRUE)){

            $obj = new $class;

        }

        if(method_exists($obj, $method)){

            $obj->$method();

        }
    }

}