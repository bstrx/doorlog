<?php
namespace core;

use models\Departments as Dep;

abstract class Controller {
    /**
     * Sets up smarty settings and variables and renders template
     * @param string $path path to template
     * @param array $values smartyVarName => value
     * @return void
     */
    protected function render($path, array $values = array()) {
        $smarty = new \Smarty();

        $smarty->setTemplateDir('protected/vendor/smarty/templates/');
        $smarty->setCompileDir('protected/vendor/smarty/templates_c/');
        $smarty->setConfigDir('protected/vendor/smarty/configs/');
        $smarty->setCacheDir('protected/vendor/smarty/cache/');
        $smarty->escape_html = true;

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
            array('core\Utils', 'formatDate')
        );

        $smarty->registerPlugin('modifier',
                                'checkPermission',
                                 array('core\Acl', 'checkPermission')
        );

        $smarty->display('protected/views/'.$path);
        exit();
    }

    /**
     * Redirects using root path
     * @param string $url
     * @return void
     */
}
