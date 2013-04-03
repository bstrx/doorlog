{extends "protected/views/index.tpl"}
    {block name="breadcrumbs"}
        <ul class="breadcrumb">
          <li><a href="{$_root}/"> Главная </a> <span class="divider"> / </span></li>
          <li><a href="{$_root}/roles/"> Права доступа </a> <span class="divider"> / </span> </li>
          <li class="active"> Редактировать </li>
        </ul>
    {/block}

    {block name="content"}
    {include file='protected/views/dialog.tpl'}
    <div class="span7">
        <h1>Редактирование роли</h1>
        <form method='post' id="change-permissions">                
            {foreach from=$allPermissions item=group}
                <span class="tbl-span"><h3>{$group['group_name']}</h3></span></br>
            <table class="table table-bordered">
                <tbody>
                    {foreach from=$group['permissions'] item=permName key=key}
                        <tr><td>
                        {html_checkboxes name="checkbox" output=$permName['perm_name'] values=$key selected=$rolePermissions}
                        </td></tr>
                    {/foreach}
                </tbody>
            </table>
            {/foreach}
            <input type="hidden" name="changes" value="done">
        </form>
        
        <form id="delete" method='POST' action="{$_root}/roles/delete">
            <input type="hidden" name="id" value="{$roleId}">
        </form>
        <button type="submit" class="btn btn-success" form="change-permissions"> Сохранить </button>
        <a class="btn" href="{$_root}/roles">Отмена</a>
        <a href="#myModal" role="button" class="btn btn-danger" data-toggle="modal" form="delete">Удалить</a>
   </div>
   {/block}
{/extends}