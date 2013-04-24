{extends "protected/views/index.tpl"}

    {block name="title"}
        {if isset($userId)}
            Изменить пользователя {$userInfo['name']}
        {else}
            Добавить пользователя
        {/if}
    {/block}

    {block name="breadcrumbs"}
        <ul class="breadcrumb">
          <li><a href="{$_root}/"> Главная </a> <span class="divider"> / </span></li>
          <li><a href="{$_root}/users/"> Пользователи </a> <span class="divider"> / </span></li>
          {if isset($userId)}
              <li class="active"> Редактировать </li>
          {else}
              <li class="active"> Создать </li>
          {/if}
        </ul>
    {/block}

    {block name="javascript"}
        <script src="{$_root}/assets/js/birthdayDatepicker.js"></script>
    {/block}

    {block name="pagetitle"}
        {if isset($userId)}
            <h1>Изменить пользователя {$userInfo['name']}</h1>
        {else}
           <h1>Добавить пользователя</h1>
        {/if}
    {/block}

    {block name="content"}
        {include file='protected/views/dialog.tpl'}

        <form method="POST" id="user">
        <div class="span7">
        <table class='table table-bordered'>
            <tr>
                <td>Пользователь</td>
                <td>
                    {if !isset($userId)}
                        <select form='user' name="userId">
                            {html_options options=$users}
                        </select>
                        </br>
                    {/if}
                </td>
            </tr>
            <tr>
                <td>Отдел</td>
                <td>
                    <select form='user' name="department">
                        <option value=0></option>
                        {html_options options=$departments selected={$userInfo['department_id']}}
                    </select>
                    </br>
                </td>
            </tr>
            <tr>
                <td>Должность</td>
                <td>
                    <select name="position">
                        <option value=0></option>
                        {html_options options=$positions selected={$userInfo['position_id']}}
                    </select>
                    </br>
                </td>
            </tr>
            <tr>
                <td>Права доступа</td>
                <td>
                    <select name="role">
                        {html_options options=$roles selected={$userRole['0']['id']}}
                    </select>
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
                    <input type="text" maxlength="45" size="40" name="email"
                        {if isset($userId)}
                        value={$userInfo['email']}
                    {/if}>
                </td>
            </tr>
            <tr>
                <td>Телефон</td>
                <td>
                    <input type="text" maxlength="11" name="phone"
                    {if isset($userId)}
                    value={$userInfo['phone']}
                    {/if}>
                </td>
            </tr>
            <tr>
                <td>Дата рождения</td>
                <td>
                    <input name="birthday" id="datepicker" type="text"
                    {if isset($userId)}
                    value="{$userInfo['birthday']}"
                    {/if}/>
            <br>
                </td>
            </tr>
            <tr>
                <td>Выводить в отчётах </td>
                <td>
                    {if isset($userId)}
                        {if $userInfo['is_shown']}
                            <input name="is_shown" type="checkbox" value="1">Выводить в отчётах
                            <br>
                        {else}
                            <input name="is_shown" type="checkbox" value="1" checked>Выводить в отчётах
                            <br>
                        {/if}

                    {else}
                        <input name="is_shown" type="checkbox" value="1" checked>Выводить в отчётах
                        <br>
                    {/if}
                </td>
            </tr>
        </table>
        </form>
        <button type=submit class="btn btn-success" form="user">
            {if isset($userId)}
                Сохранить
            {else}
                Добавить
            {/if}
        </button>
        {if isset($userId)}
            <a class="btn" href="{$_root}/users/show?id={$userInfo['id']}"> Отмена </a>
            <a href="#myModal" role="button" class="btn btn-danger" data-toggle="modal" form="delete">Удалить</a>
        {else}
            <a class="btn" href="{$_root}/users"> Отмена </a>
        {/if}
    </div>
        <form action = "{$_root}/users/delete" method='post' id="delete">
            <input type="hidden" name="id" value="{$userId}">
        </form>
    {/block}
{/extends}
