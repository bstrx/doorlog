{extends "protected/views/index.tpl"}
<title>{block name="title"}Редактировать должность{/block}</title>
{block name="breadcrumbs"}
    <ul class="breadcrumb">
      <li><a href="{$_root}/"> Главная </a> <span class="divider"> / </span></li>
      <li><a href="{$_root}/positions/"> Должности </a> <span class="divider"> / </span> </li>
      <li class="active"> Редактировать </li>
    </ul>
{/block}

{block name="content"}
    {include file='protected/views/dialog.tpl'}
    <div class="span7">
        {block name="pagetitle"}<h1>Редактировать должность</h1>{/block}
        <form method='post' id="edit-position">
            <input type="text" name="position" id="edit-label" value="{$position['name']}"><br />
        </form>
        
        <form action="{$_root}/positions/delete" id="delete" method='POST'>
            <input type="hidden" name="id" value="{$position['id']}">
        </form>
        
        <button type="submit" id="save" class="btn btn-success" form="edit-position"> Сохранить </button>
        <a href="{$_root}/positions" id="edit-cancel" class="btn">Отмена</a>
        <a href="#myModal" role="button" class="btn btn-danger" data-toggle="modal" form="delete">Удалить</a>
    </div>
    
{/block}
{/extends}