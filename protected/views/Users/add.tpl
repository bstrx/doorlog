{extends "protected/views/index.tpl"}
    {block name="content"}
        <div class="users">
            <form method="POST">
                <p>Выберите пользователя:</p>
                <select name="userId">
                    {html_options options=$users}
                </select> </br>


                <p>Выберите отдел:</p>
                <select name="department">
                    {html_options options=$departments}
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
