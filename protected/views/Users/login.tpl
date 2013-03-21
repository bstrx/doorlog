{extends "protected/views/index.tpl"}
    {block name="pagetitle"}<h1>Вход в систему</h1>{/block}

    {block name="content"}
        <div id="auth">
            <form method="POST" action=".">
                <p>
                    <label for="login"> Введите email или номер пропуска: </label>
                    <input type="text" size="40" id="login" name="login">
                    <label for="pass"> Введите пароль: </label>
                    <input type="password" id="pass" size="40" name="password">
                </p>

                <input type="submit" value="Войти" class="btn btn-success">
            </form>
        </div>
    {/block}
{/extends}
