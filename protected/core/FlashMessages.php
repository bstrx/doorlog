<?php
namespace core;

class FlashMessages{
    function addMessage($message, $type){
        $_SESSION['flashMessages'][$type][] = $message;
    }

    function getMessage(){
        $flashMessages = array();
        if(isset($_SESSION['flashMessages'])){
          $flashMessages = $_SESSION['flashMessages'];
          unset($_SESSION['flashMessages']);
        }
        return $flashMessages;
    }
}