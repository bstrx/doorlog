{extends "protected/views/index.tpl"}
    {block name="content"}
        <div class="Users">
            <form method="POST">
                <p>Выберите пользователя:</p>
                <select name="userId">
                    {html_options options=$users}
                </select> </br>
                <p>Укажите Email:</p> <input type="text" maxlength="25" size="40" name="email"></p>
                <input type=submit value="Добавить">
            </form>
        </div>
    {/block}
{/extends}