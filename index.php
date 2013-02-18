<?php

        use core\MailSender;
        use core\ControllersManager;
        use controllers\News;
        use core\Acl;
        use core\Utils;
        use core\Registry;

        ini_set('display_errors', true);
        ini_set('error_reporting',  E_ALL);
         
        header('Content-Type: text/html; charset=utf-8');
         
        require_once("protected/core/Autoloader.php");
        require 'protected/vendor/autoload.php';

        $auto = new Autoloader();
        $auto->register();
         
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
