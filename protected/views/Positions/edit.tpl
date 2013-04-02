{extends "protected/views/index.tpl"}

{block name="breadcrumbs"}
    <ul class="breadcrumb">
      <li><a href="/">Главная</a> <span class="divider">/</span></li>
      <li><a href="{$_root}/positions/">Должности</a> <span class="divider">/</span></li>
      <li class="active">Редактировать</li>
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
        <form method='post' id="edit-position">
            <input type="text" name="position" id="edit-label" value="{$position['name']}"><br />
        </form>
        
        <form action="{$_root}/positions/delete" id="delete-position" method='POST'>
            <input type="hidden" name="id" value="{$position['id']}">
        </form>
        
        <button type="submit" id="save" class="btn btn-success" form="edit-position"> Сохранить </button>
        <a href="{$_root}/positions" id="edit-cancel" class="btn">Отмена</a>
        <button id="delete" type="submit" class="btn btn-danger" form="delete-position"> Удалить </button>
    </div>

<div id="dialog" title="Диалоговое окно">
  <p>Действительно хотите удалить?</p>
</div>
    
{/block}
{/extends}