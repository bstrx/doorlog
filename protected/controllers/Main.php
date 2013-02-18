<?php

namespace controllers;

use core\Controller;

/**
 * Description of NewsContoller
 *
 * @author adrenaline
 */
class Main extends Controller {

    function indexAction() {
        $this->render("Main/index.tpl" , array('value' => 2) );
    }

}

?>
