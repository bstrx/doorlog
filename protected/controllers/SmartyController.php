<?php

namespace controllers;

abstract class SmartyController {

    function render($array) {

        $smarty = new Smarty();

        $smarty->template_dir = "../../vendors/smarty/templates/";
        $smarty->compile_dir = "../../vendors/smarty/templates_c/";
        $smarty->config_dir = "../../vendors/smarty/cache/";
        $smarty->cache_dir = "../../vendors/smarty/configs/";
        
        
        foreach ($array as $key => $value) {
            $smarty->assign($key, $value);
        }
        
        $smarty->display("smarty/templates/index.tpl");
    }

}

?>
