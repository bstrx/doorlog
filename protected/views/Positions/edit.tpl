{extends "protected/views/index.tpl"}
{block name="content"}
    <script>
        $(document).ready(function()
        {
           $('#delete').bind('click',function(){
                if(confirm("действительно хотите удалить?")){
                    return true;
                }
                else{
                    return false;
                }
           });
        });
    </script>
    <div class="span7">
        <form method='post' id="edit-position">
            <input type="text" name="position" value="{$position['name']}">
             <button type="submit" class="btn"> Сохранить </button>&nbsp;
        </form>
        <form action="{$_root}/positions/delete" method='POST' id="edit-position">
            <input type="hidden" name="id" value="{$position['id']}">
            <button id="delete" type="submit" class="btn"> Удалить </button>&nbsp;
        </form>
        <a href="{$_root}/positions" class="btn">Отмена</a>
    </div>
{/block}
{/extends}