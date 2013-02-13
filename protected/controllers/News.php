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
        echo $old_val='hello vova';

        $this->render();
    }
}

?>
