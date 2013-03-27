{extends "protected/views/index.tpl"}
    {block name="content"}
    <h3>Добавить нового пользователя</h3>
        <div class="users">
            <form method="POST">
                <p>Выберите пользователя:</p>
                <select name="userId">
                    {html_options options=$users}
                </select> </br>

                <p>Выберите отдел:</p>
                <select name="department">
                    <option> </option>
                    {html_options options=$departments}
                </select> </br>

                <p>Выберите должность:</p>
                <select name="position">
                    <option> </option>
                    {html_options options=$positions}
                </select> </br>

                <p>Укажите email:</p> <input type="text" name="email">
                <p>Укажите дату рождения:</p> <input type="text" placeholder="дд.мм.гггг" maxlength="45" size="40" name="birthday">
                <p>Укажите номер телефона:</p> <input type="text" name="phone"></br>
                <input type=submit value="Добавить">
            </form>
        </div>

    {/block}
{/extends}
