{extends "protected/views/index.tpl"}
{block name="content"}
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
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
        <form method='post' id="add-department" style="float:left;">
            <input type="text" name="position" value="{$position['name']}">
             <button type="submit" class="btn"> Сохранить </button>&nbsp;
        </form>
        <form action="{$_root}/positions/delete" method='POST' id="delete-position">
            <input type="hidden" name="id" value="{$position['id']}">
            <button id="delete" type="submit" class="btn"> Удалить </button>
            <a href="{$_root}/positions" class="btn">Отмена</a>
        </form>
    </div>
{/block}
{/extends}