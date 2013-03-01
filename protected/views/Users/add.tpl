{extends "protected/views/index.tpl"}
    {block name="content"}
        <div class="Users">
            <form action="add" method="POST">
                <p>Выберите пользователя:</p>
                <select name="user">
                    {html_options options=$users}
                </select> </br>
                <p>Выберите должность:</p>
                <select name="position">
                    {html_options options=$positions}
                </select> </br>
                <p>Добавить Email:</p> <input type="text" maxlength="25" size="40" name="email"></p>
                <input type=submit value="Добавить">
            </form>
        </div>
    {/block}
{/extends}