<?php

namespace core;

abstract class Controller {

    protected function render($value) {
        $smarty = new \Smarty();

        $smarty->setTemplateDir('/var/www/doorlog/protected/vendor/smarty/templates/');
        $smarty->setCompileDir('/var/www/doorlog/protected/vendor/smarty/templates_c/');
        $smarty->setConfigDir('/var/www/doorlog/protected/vendor/smarty/configs/');
        $smarty->setCacheDir('/var/www/doorlog/protected/vendor/smarty/cache/');

        $smarty->assign($value);
        $smarty->display('protected/views/index.tpl');
    }

}
