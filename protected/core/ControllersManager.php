<?php

namespace core;

class ControllersManager {

    private $typedUrl = array();

    function getUrl() {

        $typedUrl = isset($_GET['route']) ? $_GET['route'] : null;

        if ($typedUrl) {
            $urlArr = explode("/", $typedUrl);
            $class = "controllers\\" . (ucfirst($urlArr[0]));
            if (empty($urlArr[1])) {
                $method = "index";
            } else {
                $method = $urlArr[1];
            }
        } else {
            $class = "controllers\\Main";
            $method = "index";
        }

        if (class_exists($class, TRUE)){

            $obj = new $class;
           
        }

        $method .= 'Action';
        if(method_exists($obj, $method)){        
            $obj->$method();
        }
    }

}
