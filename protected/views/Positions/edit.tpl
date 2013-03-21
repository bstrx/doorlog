{extends "protected/views/index.tpl"}
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
                            $("#delete-position").submit();
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
        {block name="pagetitle"}<h1>Редактировать должность</h1>{/block}
        <form method='post'>
            <input type="text" name="position" id="edit-label" value="{$position['name']}"><br />
             <button type="submit" id="save" class="btn btn-success"> Сохранить </button>
        </form>
        <a href="{$_root}/positions" id="edit-cancel" class="btn">Отмена</a>
        <form action="{$_root}/positions/delete" id="delete-position" method='POST'>
            <input type="hidden" name="id" value="{$position['id']}">
            <button id="delete" type="submit" class="btn btn-danger"> Удалить </button>
        </form>
    </div>

<div id="dialog" title="Диалоговое окно">
  <p>Действительно хотите удалить?</p>
</div>
    
{/block}
{/extends}