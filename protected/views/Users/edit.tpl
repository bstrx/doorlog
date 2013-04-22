{extends "protected/views/index.tpl"}
{block name="title"}Редактировать пользователя{/block}
{block name="javascript"}
    <script src="{$_root}/assets/js/userDatepicker.js"></script>
{/block}
    {block name="pagetitle"}<h1>Редактировать пользователя {$userInfo['name']}</h1>{/block}

    {block name="content"}
        <form method='post'>
            <p>Изменить Email:</p> <input type="text" maxlength="45" size="40" name="email" value="{$userInfo['email']}"></p>
            <p>Изменить отдел:</p>
                <select name="department">
                    <option value=0></option>
                    {html_options options=$departments selected={$userInfo['department_id']}}
                </select> </br>

                <p>Изменить должность:</p>
                <select name="position">
                    <option value=0</option>
                    {html_options options=$positions selected={$userInfo['position_id']}}
                </select> </br>

                <p>Изменить Телефон:</p> <input type="text" maxlength="11" name="phone" value={$userInfo['phone']}></p>

                <p>Изменить дату рождения:</p><input name="birthday" id="datepicker" type="text" placeholder="ГГГГ.ММ.ДД" value="{$userInfo['birthday']}" /></p>

                <input type=submit class="btn" value="Изменить">
        </form>
    {/block}
{/extends}