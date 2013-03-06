<?php
namespace core;

use models\Departments as Dep;

abstract class Controller {
    protected function render($path, array $values = array()) {
        $smarty = new \Smarty();

        $smarty->setTemplateDir('protected/vendor/smarty/templates/');
        $smarty->setCompileDir('protected/vendor/smarty/templates_c/');
        $smarty->setConfigDir('protected/vendor/smarty/configs/');
        $smarty->setCacheDir('protected/vendor/smarty/cache/');

        $smarty->assign($values);

        $departmentsModel = new Dep();
        $smarty->assign(array('_flashMessages' => FlashMessages::getMessage()));
        $smarty->assign(array('_menu' => $departmentsModel->getMenuDepartments()));

        $cfg = Registry::getValue('config');
        $smarty->assign(array('_root' => $cfg['root']));

        $smarty->display('protected/views/'.$path);
        exit();
    }
}
