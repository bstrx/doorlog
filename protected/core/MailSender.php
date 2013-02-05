<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of MailSender
 *
 * @author adrenaline
 */
class MailSender {
    var $to = "";
    var $from = "";
    var $reply_to = "";
    var $cc = "";
    var $bcc = "";
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
        
        if(!empty($this->reply_to)){
            $this->headers[] = "Reply to: $this->reply_to";
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
        
        if(mail($this->to, htmlspecialchars(stripcslashes(trim($this->subject))),
                htmlspecialchars(stripslashes(trim($this->msg))))){
            return TRUE;
        }  else {
            return FALSE;
        }
    }
}



?>
