<?php
namespace core;

class FlashMessages{
    static $typesArray = array('success', 'info', 'error');

    /**
     * Add message of specified type to messages array
     * @param string $message
     * @param string $type influence style of message
     * @return bool
     */
    public static function addMessage($message, $type){
        if (in_array($type, self::$typesArray)) {
            $_SESSION['flashMessages'][$type][] = $message;
            return true;
        }
        return false;
    }

    /**
     * Gets all messages and clears the array
     * @return array
     */
    public static function getMessage(){
        $flashMessages = array();
        if(isset($_SESSION['flashMessages'])){
            $flashMessages = $_SESSION['flashMessages'];
            unset($_SESSION['flashMessages']);
        }
        return $flashMessages;
    }
}