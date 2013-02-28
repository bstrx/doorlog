<?php
namespace core;

abstract class Controller {
    protected function render($path, array $values) {
        $smarty = new \Smarty();

        $smarty->setTemplateDir('protected/vendor/smarty/templates/');
        $smarty->setCompileDir('protected/vendor/smarty/templates_c/');
        $smarty->setConfigDir('protected/vendor/smarty/configs/');
        $smarty->setCacheDir('protected/vendor/smarty/cache/');

        $smarty->assign($values);

        $departmentsModel = new \models\Departments();
        $smarty->assign(array('_flashMessages' => FlashMessages::getMessage()));
        $smarty->assign(array('_menu' => $departmentsModel->getMenuDepartments()));
        $smarty->display('protected/views/'.$path);
    }
}
