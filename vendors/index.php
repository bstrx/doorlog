<?php

ini_set('display_errors', 1);
  error_reporting(E_ALL);

require_once('smarty/setup.php');

$smarty= new Smarty_DoorLog();

//require_once('smarty/libs/Smarty.class.php');

//$smarty = new Smarty;



//$smarty->force_compile = true;
//$smarty->debugging = true;
//$smarty->caching = true;
//$smarty->cache_lifetime = 120;

$smarty->left_delimiter = '<!--{';
$smarty->right_delimiter = '}-->';

$smarty->assign('foo', 'bar');
$smarty->assign('name', 'Albert');
$smarty->display("smarty/templates/index.tpl");

?>
