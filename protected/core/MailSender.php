<?php

namespace core;
/**
 * Description of MailSender
 *
 * @author adrenaline
 */
class MailSender {

    var $to = '';
    var $subject = '';
    var $msg = '';
    var $from = 'Opensoft Savage';
    var $validate_email = true;
    var $allow_empty_subject = false;
    var $allow_empty_msg = false;
    var $headers = array();

    public function __construct($to, $subject, $msg) {
        $this->to = $to;
        $this->subject = $subject;
        $this->msg = $msg;
    }

    function checkFields(){
        if(empty($this->to)){
            return FALSE;
        }

        if(!$this->allow_empty_subject && empty($this->subject)){
            return FALSE;
        }

        if(!$this->allow_empty_msg && empty($this->msg)){
            return FALSE;
        }

        if(!empty($this->from)){
            $this->headers .= "From: $this->from";
        }

        if($this->validate_email){
            if(!preg_match("/[-0-9a-z_\.]+@[-0-9a-z_\.]+\.[a-z]{2,6}/i", $this -> to)){
                return FALSE;
            }
            return TRUE;
        }
    }

    function send(){
        if(!MailSender::checkFields()){
            return false;
        }

        $subject = $this->safeString($this->subject);
        $message = $this->safeString($this->msg);

        return mail($this->to, $subject, $message);
    }

    function safeString($str) {
        return htmlspecialchars(stripslashes(trim($str)));
    }
}