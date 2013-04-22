{extends "protected/views/index.tpl"}

    {block name="breadcrumbs"}
        <ul class="breadcrumb">
            <li><a href="{$_root}/"> Главная </a> <span class="divider"> / </span></li>
            <li class="active"> Профиль </li>
        </ul>
    {/block}

    {block name="pagetitle"}<h1>Настройки профиля</h1>{/block}

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