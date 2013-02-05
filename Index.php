<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        
        
        
<?php
         ini_set('display_errors', true);
         ini_set('error_reporting',  E_ALL);
         require 'protected/config/config.php';
         require 'protected/core/MailSender.php';
         require 'protected/controllers/News.php';
         
         $get_url = new ControllersManager();
         $get_url->getUrl();
        
         

?>
        
        
        
        
    </body>
</html>