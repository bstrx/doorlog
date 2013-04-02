{extends "protected/views/index.tpl"}

    {block name="breadcrumbs"}
        <ul class="breadcrumb">
          <li><a href="/"> Главная </a> <span class="divider">/</span></li>
          <li><a href="{$_root}/roles/"> Права доступа </a> <span class="divider"> / </span> </li>
          <li class="active"> Редактировать </li>
        </ul>
    {/block}

    {block name="content"}
    <script>
        $(document).ready(function()
        {
                $("#dialog").dialog({
                    autoOpen: false,
                    modal: true,
                    position: ["center"],
                    buttons: {
                        "Ок": function() {
                            $("#delete-role").submit();
                        },
                        "Отмена": function() {
                            $(this).dialog("close");
                        }
                    }
                });
            $("#delete").click(function(e){
                e.preventDefault();
                $('#dialog').dialog('open');
            });
        });
    </script>

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
        
        <form id="delete-role" method='POST' action="{$_root}/roles/delete">
            <input type="hidden" name="id" value="{$roleId}">
        </form>
        <button type="submit" class="btn btn-success" form="change-permissions"> Сохранить </button>
        <a class="btn" href="{$_root}/roles">Отмена</a>
        <button id="delete" type="submit" class="btn btn-danger" form="delete-role"> Удалить </button>
        
   </div>

   <div id="dialog" title="Диалоговое окно">
     <p>Действительно хотите удалить?</p>
   </div>

   {/block}
{/extends}