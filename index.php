<?php
    session_start();
    ini_set('display_errors', true);
    ini_set('error_reporting',  E_ALL);
    setlocale(LC_ALL, "ru_RU.UTF-8");
    header('Content-Type: text/html; charset=utf-8');

    use core\ControllersManager;
    use core\Acl;
    use core\Utils;
    use core\Registry;
    use core\Authentication;

    require 'protected/core/Autoloader.php';
    require 'protected/vendor/autoload.php';

    $auto = new Autoloader();
    $auto->register();

    $cfg = require 'protected/config/config.php';
    Registry::setValue('config', $cfg);

    $auth = new Authentication();
    $auth->checkAccess();

    try {
        $controllerManager = new ControllersManager();
        $controllerManager->runController();
    } catch (Exception $e) {
        Utils::showException($e);
    }
?>
