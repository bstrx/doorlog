<?php

namespace controllers;

use core\Controller;
/**
 * Description of NewsContoller
 *
 * @author adrenaline
 */
class News extends Controller {
    function oldAction(){

        $this->render("menu.tpl" , array('value' => 2) );

    }
}

?>
