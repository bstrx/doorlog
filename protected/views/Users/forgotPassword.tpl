{extends "protected/views/index.tpl"}
{block name="title"}Восстановление пароля{/block}
    {block name="pagetitle"}<h1>Восстановление пароля</h1>{/block}

    {block name="content"}
        <div>
            <form method="POST" id="forgotPassword">
                <p>
                    <label for="login"> Введите email или номер пропуска: </label>
                    <input type="text" size="40" name="loginForForgotPassword">
                </p>
                <input type="submit" value="Отправить" class="btn btn-success">
                <a class="btn" href="{$_root}/users/login"> Отмена </a>
            </form>
            
        </div>
    {/block}

{/extends}
