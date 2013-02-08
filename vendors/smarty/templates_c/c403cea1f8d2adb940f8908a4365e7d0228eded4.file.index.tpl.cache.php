<?php /* Smarty version Smarty-3.1.13, created on 2013-02-08 13:46:02
         compiled from "vendors/smarty/templates/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:13237667625114c95ae9d491-32916874%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c403cea1f8d2adb940f8908a4365e7d0228eded4' => 
    array (
      0 => 'vendors/smarty/templates/index.tpl',
      1 => 1360223739,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '13237667625114c95ae9d491-32916874',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'name' => 0,
    'foo' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_5114c95aeea145_40601212',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5114c95aeea145_40601212')) {function content_5114c95aeea145_40601212($_smarty_tpl) {?>Welcome <?php echo $_smarty_tpl->tpl_vars['name']->value;?>
 to Smarty
<script language="javascript">
  var foo = <?php echo $_smarty_tpl->tpl_vars['foo']->value;?>
;
  function dosomething() {
    alert("foo is " + foo);
  }
  dosomething();
</script>
<?php }} ?>