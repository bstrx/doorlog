<?php
namespace controllers;

use core\Controller;

class Departments extends Controller {

    function indexAction() {
        $this->render("Main/index.tpl" , array('value' => 2) );
    }

}