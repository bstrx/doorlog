<?php

         class ControllersManager{
             private $test_url =  array();
             
             function getUrl(){
                 $test_url = $_GET['route'];
                 $url_arr=  explode("/", $test_url);
                 $class = ucfirst($url_arr[0]);
                 $method = $url_arr[1];
                 if(class_exists($class, TRUE)){
                     
                     $obj = new $class;
                     
                 }
                 
                 if(method_exists($obj, $method)){
                     
                     $obj = $class->$method();
                 }
             }
             
             function __autoload($classname){
                 require "controllers/".$classname.".php";
             }
             
             
             
         }

?>
