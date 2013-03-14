<?php
namespace core;
class ControllersManager {
    private $typedUrl = array();
    public function runController() {
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
        } else {
           throw new \Exception('Requested page not found. Existing class required');
        }

        $method .= 'Action';
        if(method_exists($obj, $method)){
            $obj->$method();
        } else {
            throw new \Exception('Requested page not found. Existing method required');
        }
    }
}