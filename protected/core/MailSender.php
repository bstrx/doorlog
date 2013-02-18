<?php

namespace core;
/**
 * Description of MailSender
 *
 * @author adrenaline
 */
class MailSender {
    var $to = "";
    var $from = "";
    var $subject = "";
    var $msg = "";
    var $validate_email = true;
    var $rigorous_email_chek = true;
    var $allow_empty_subject = false;
    var $allow_empty_msg = false;
    
    var $headers = array();
    
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
            $this->headers[] = "From: $this->from";
        }
        
        
        if($this->validate_email){
            if(!preg_match("/[-0-9a-z_\.]+@[-0-9a-z_\.]+\.[a-z]{2,6}/i", $this -> to)){
                return FALSE;
            }
            return TRUE;
        }
    
    }
    
    
    function send(){
        if(!$this->checkFields()){
            return TRUE;
        }
        
        $subject = $this->safeString($this->subject);
        $message = $this->safeString($this->msg);
        
        if (mail($this->to, $subject, $message)) {

}
        
function safeString($str) {
    return htmlspecialchars(stripslashes(trim($str)));
}
    }
}