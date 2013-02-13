<?php
namespace core;

abstract class Controller
{
    protected function render(){
        define('SMARTY_DIR', '/var/www/doorlog/protected/vendors/smarty/');
        require_once (SMARTY_DIR . 'Smarty.class.php');
        $smarty = new \Smarty();
    }
}
