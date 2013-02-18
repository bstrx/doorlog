<?php

        use core\MailSender;
        use core\ControllersManager;
        use controllers\News;
        use core\Acl;

        ini_set('display_errors', true);
        ini_set('error_reporting',  E_ALL);
         
        header('Content-Type: text/html; charset=utf-8');
         
        require_once("protected/core/Autoloader.php");
        require 'protected/config/config.php';
        require 'protected/vendor/autoload.php';

        $auto = new Autoloader();
        $auto->register();
         
<<<<<<< HEAD
        $getUrl = new ControllersManager();
        $getUrl->getUrl();
=======
        $get_url = new ControllersManager();
        $get_url->getUrl();
>>>>>>> 37a9c944656439bcbafea9376a7bca6dbd7c4637
        
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
