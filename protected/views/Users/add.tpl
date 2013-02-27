{extends "protected/views/index.tpl"}
    {block name="addUsers"}
        <div class="Users">
            <form action="add" method="POST">
                <p>Выберите пользователя:</p>
                <select name="user">
                    {html_options options=$users}
                </select> </br>
                <p>Добавить Email:</p> <input type="text" maxlength="25" size="40" name="email"></p>
                <input type=submit value="Добавить">
            </form>
        </div>
    {/block}
{/extends}