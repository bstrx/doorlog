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
        <form method='post' id="edit-position">
            <input type="text" name="position" value="{$position['name']}">
             <button type="submit" id="save" class="btn"> Сохранить </button>
        </form>
        <form action="{$_root}/positions/delete" method='POST' id="delete-position">
            <input type="hidden" name="id" value="{$position['id']}">
            <button id="delete" type="submit" class="btn"> Удалить </button>
        </form>
        <a href="{$_root}/positions" class="btn">Отмена</a>
    </div>

<div id="dialog" title="Диалоговое окно">
  <p>Действительно хотите удалить?</p>
</div>
    
{/block}
{/extends}