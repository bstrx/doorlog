{extends "protected/views/index.tpl"}

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

    {block name="content"}

    {include file='protected/views/dialog.tpl'}
        {if isset($userId)}
            {block name="pagetitle"}<h1>Изменить пользователя {$userInfo['name']}</h1>{/block}
        {else}
            {block name="pagetitle"}<h1>Добавить пользователя</h1>{/block}
        {/if}

        <script>
        $(function() {
          $( "#datepicker" ).datepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: "1930:",
            dateFormat: 'yy-mm-dd'
          });
        });
        </script>
        <form method="POST" id="user">
            {if !isset($userId)}
                <p>Пользователь:</p>
                <select name="userId">
                    {html_options options=$users}
                </select> </br>
            {/if}

            <p>Отдел:</p>
            <select name="department">
                <option value=0></option>
                {html_options options=$departments selected={$userInfo['department_id']}}
            </select> </br>

            <p>Должность:</p>
            <select name="position">
                <option value=0></option>
                {html_options options=$positions selected={$userInfo['position_id']}}
            </select> </br>


            <p>Права доступа:</p>
            <select name="role">
                {html_options options=$roles selected={$userRole['0']['id']}}
            </select>

            <p>Email:</p>
            <input type="text" maxlength="45" size="40" name="email"
                {if isset($userId)}
                    value={$userInfo['email']}
                {/if}>

            <p>Телефон:</p>
            <input type="text" maxlength="11" name="phone"
                {if isset($userId)}
                    value={$userInfo['phone']}
                {/if}>

            <p>Дата рождения:</p>
            <input name="birthday" id="datepicker" type="text"
                {if isset($userId)}
                    value="{$userInfo['birthday']}"
                {/if}/>
            <br>
            {if isset($userId)}
                {if $userInfo['is_shown']}
                    <input name="is_shown" type="checkbox" value="1">Выводить в отчётах
                    <br>
                {else}
                    <input name="is_shown" type="checkbox" value="1" checked>Выводить в отчётах
                    <br>
                {/if}

            {else}
                    <input name="is_shown" type="checkbox" value="1" checked>Выводить при отчётах
                    <br>
            {/if}


            {if isset($userId)}
                <p>Изменить пароль(не обязательно):</p>
                    <p>Старый пароль:</p>
                    <input type="password" name="oldPass">
                    <p>Новый пароль:</p>
                    <input type="password" name="newPass">
            {/if}
        </form>

        <form action = "{$_root}/users/delete" method='post'  id="delete">
            <input type="hidden" name="id" value="{$userId}">
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
            <a href="#myModal" role="button" class="btn btn-danger" data-toggle="modal">Удалить</a>
        {else}
            <a class="btn" href="{$_root}/users"> Отмена </a>
        {/if}
    {/block}
{/extends}