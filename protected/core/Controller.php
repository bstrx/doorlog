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
        $cfg = Registry::getValue('config');
        $userInfo = Registry::getValue('user');
        $smarty->assign(array(
            '_root' => $cfg['root'],
            '_user' => $userInfo,
            '_menu' => $departmentsModel->getMenuDepartments(),
            '_flashMessages' => FlashMessages::getMessage()
        ));

        $smarty->registerPlugin(
            'modifier',
            'formatDate',
            array('core\DateTime', 'formatDate')
        );

        $smarty->display('protected/views/'.$path);
        exit();
    }

    protected function redirect($url = '/') {
        $cfg = Registry::getValue('config');
        header('Location: ' . $cfg['root'] . $url);
    }



}
