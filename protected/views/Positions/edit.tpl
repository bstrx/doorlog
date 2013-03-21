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
            <input type="text" name="position" style="display:block;" value="{$position['name']}">
             <button type="submit" id="save" style="float:left; margin-right:5px;" class="btn btn-success"> Сохранить </button>
        </form>
        <a href="{$_root}/positions" style="float:left; margin-right:5px; margin-top:-10px;" class="btn">Отмена</a>
        <form action="{$_root}/positions/delete" method='POST'>
            <input type="hidden" name="id" value="{$position['id']}">
            <button id="delete" type="submit" class="btn btn-danger"> Удалить </button>
        </form>
    </div>

<div id="dialog" title="Диалоговое окно">
  <p>Действительно хотите удалить?</p>
</div>
    
{/block}
{/extends}