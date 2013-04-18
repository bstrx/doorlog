{extends "protected/views/index.tpl"}
    {block name="content"}
        <form method="POST">
            <p>Изменить пароль:</p>
            <p>Старый пароль:</p>
            <input type="password" name="oldPass">
            <p>Новый пароль:</p>
            <input type="password" name="newPass"><br>
            <button type=submit class="btn btn-success"> Сохранить </button>
        </form>        
    {/block}
{extends}