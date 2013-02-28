<?php
namespace core;

class FlashMessages{
    static $typesArray = array('success', 'info', 'error');

    function addMessage($message, $type){
        if (in_array($type, self::$typesArray)) {
            $_SESSION['flashMessages'][$type][] = $message;
        }
        return false;
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