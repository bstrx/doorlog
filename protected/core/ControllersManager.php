<?php
namespace core;

class ControllersManager {
    /**
     * Create instance of controller's class and runs its'method depending on route(url) passed
     * If route is 'users/add', then class of controller will be 'Users' and method will be 'AddAction'
     * @return void
     */
    public $listUrl = array("Users\\forgotPassword");
    
    public function runController() {
        $typedUrl = isset($_GET['route']) ? $_GET['route'] : null;
        if ($typedUrl) {
            $urlArr = explode("/", $typedUrl);
            $class = ucfirst($urlArr[0]);
            if (empty($urlArr[1])) {
                $method = "index";
            } else {
                $method = $urlArr[1];
            }
        } else {
            $class = "Main";
            $method = "index";
        }

        if(!in_array($class."\\".$method, $this->listUrl)){
            $auth = new Authentication();
            $check = $auth->checkAccess($class, $method);
            if(!$check){
                $class = "Users";
                $method = "login";
            }
        }

        $class = "controllers\\" .$class;
        if (class_exists($class, TRUE)){
            $classInstance = new $class;
        } else {
           throw new \Exception('Requested page not found. Existing class required');
        }

        $method .= 'Action';
        if(method_exists($classInstance, $method)){
            $classInstance->$method();
        } else {
            throw new \Exception('Requested page not found. Existing method required');
        }
    }
}