<?php

        use core\MailSender;
        use core\ControllersManager;
        use controllers\News;

        ini_set('display_errors', true);
        ini_set('error_reporting',  E_ALL);
         
        header('Content-Type: text/html; charset=utf-8');
         
        require_once("protected/core/Autoloader.php");
        require 'protected/config/config.php';

        $auto = new Autoloader();
        $auto->register();
         
        //$news = new News();
        //echo $news->old();
         
        $get_url = new ControllersManager();
        $get_url->getUrl();
        
        
?>
