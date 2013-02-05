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
         
             $mail = new MailSender();
             $mail ->from = "comstwork@gmail.com";
    $mail -> to = "kirill.demidov@opensoftdev.ru"; 
    $mail -> subject = "test";
    $mail -> msg = "testing...";
    $mail -> msg = "testing...";
    $mail -> rigorous_email_check = 0;
    if($mail->send()){
        echo "success";
    }else{
        echo "error_brahahaha";
    }
    echo "<br>";
    echo $mail -> msg;
?>
        
        
        
        
    </body>
</html>