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
                            $("#delete-dep").submit();
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
        <h1>Редактировать отдел</h1>
        <form method='post' id="edit-department">
            <input type="text" id="edit-dep-label" name="depName" value="{$departments['name']}">
            <br>
            <br>
            <button type="submit" class="btn btn-success" id = 'edit-dep'> Сохранить </button>
        </form>
        <a class="btn" id="edit-dep-cancel" href="{$_root}/departments">Отмена</a>
        <form action = "/departments/delete" method='post' id="del-department">
            <input type="hidden" name="id" value="{$departments['id']}">
            <button type="submit" class="btn btn-danger" id = "delete-dep"> Удалить </button>
        </form>
    </div>
<div id="dialog">
    <p>Дейсвительно хотите удалить?</p>
    <form action = "/departments/delete" method='post' id = "delete-dep">
        <input type="hidden" name="id" value="{$departments['id']}">
    </form>
</div>



{/block}

{/extends}