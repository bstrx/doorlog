{extends "protected/views/index.tpl"}

    {block name="content"}

    <div class="role">
        <h1>Добавление роли</h1>        
        <form method="POST">
            <p>Название роли:</p> <input type="text" maxlength="45" size="40" name="roleName"><br>
            <input type=submit value="Добавить" class="btn btn-success">
            <a class="btn" href="{$_root}/roles">Отмена</a>
        </form>
    </div>


    {/block}

{/extends}  