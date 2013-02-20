<?php
    use core\ControllersManager;
    use core\Acl;
    use core\Registry;

    ini_set('display_errors', true);
    ini_set('error_reporting',  E_ALL);

    header('Content-Type: text/html; charset=utf-8');

    require 'protected/core/Autoloader.php';
    require 'protected/vendor/autoload.php';

    $autoloader = new Autoloader();
    $autoloader->register();

    $cfg = require 'protected/config/config.php';
    Registry::setValue('config', $cfg);

    $controllerManager = new ControllersManager();
    $controllerManager->runController();



//        $_SESSION['NAME'] = 'Маслов Святослав';
//
//        $rolesPermissions = Acl::getUserPermissions("name");
//
//        foreach ($rolesPermissions as $role => $permissions) {
//            foreach ($permissions as $permission) {
//                echo $role . " " . $permission . "<br>";
//            }
//        }
?>
