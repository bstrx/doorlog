{extends "protected/views/index.tpl"}
{block name="title"}Вход в систему{/block}
    {block name="pagetitle"}<h1>Вход в систему</h1>{/block}

    {block name="content"}
        <div id="auth">
            <form method="POST" id="login">
                <p>
                    <label for="login"> Введите email или номер пропуска: </label>
                    <input type="text" size="40" id="login" name="login">
                    <label for="pass"> Введите пароль: </label>
                    <input type="password" id="pass" size="40" name="password"><br>
                    <small><a href="{$_root}/users/forgotPassword"> Забыли пароль? </a></small>
                </p>
                <input type="submit" value="Войти" class="btn btn-success">
            </form>
        </div>
    {/block}

{/extends}
