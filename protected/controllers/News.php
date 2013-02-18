<?php

namespace controllers;

use core\Controller;
/**
 * Description of NewsContoller
 *
 * @author adrenaline
 */
class News extends Controller {
    function old(){
<<<<<<< HEAD
        echo $oldVal='hello vova';

        $this->render(array('value' => 2));
=======
        $this->render("menu.tpl" , array('value' => 2) );
>>>>>>> 37a9c944656439bcbafea9376a7bca6dbd7c4637
    }
}

?>
