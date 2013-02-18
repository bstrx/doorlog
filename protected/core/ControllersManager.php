<?php

namespace core;

class ControllersManager {

    private $testUrl = array();

    function getUrl() {

        $testUrl = isset($_GET['route']) ? $_GET['route'] : null;

        if ($testUrl) {
            $urlArr = explode("/", $testUrl);          
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

        if (method_exists($obj, $method)){

            $obj->$method();
        }
    }

}