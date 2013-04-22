{extends "protected/views/index.tpl"}

    {block name="breadcrumbs"}
        <ul class="breadcrumb">
            <li><a href="{$_root}/"> Главная </a> <span class="divider"> / </span></li>
            <li class="active"> Профиль </li>
        </ul>
    {/block}

    {block name="pagetitle"}<h1>Настройки профиля</h1>{/block}

    {block name="content"}
    <div class="span7">
        <table class="table table-bordered">
            <colgroup>
                <col class="col-small">
            </colgroup>
            {foreach from=userInfo item=user}
                <th> Имя </th>
                <td>{$userInfo['name']}</td>
                <tr><th> Отдел </th>
                <td> {if (isset($userInfo['department']))}
                        {$userInfo['department']}
                     {/if}
                </td></tr>
                <tr><th> Должность </th>
                <td> {if (isset($userInfo['position']))}
                        {$userInfo['position']}
                     {/if}
                </td></tr>
                <tr><th> Статус </th>
                <td>
                {if $userInfo['status']==2}
                    <span class="label label-success">В офисе</span>
                {else}
                    <span class="label">Не в офисе</span>
                {/if}
                </td></tr>
                <tr><th> Телефон </th>
                <td> {$userInfo['phone']} </td>
                </tr>
                {if $userInfo['birthday']}
                    <tr><th> Дата рождения </th>
                    <td> {$userInfo['birthday']|date_format:"%d.%m.%Y"} </td></tr>
                {/if}
                <tr><th> Дата создания </th>
                <td> {$userInfo['created']} </td>
                </tr>
            {/foreach}
        </table>                        
    </div>
    <div class="span4 additional">
        <form method="POST">
            <p>Изменить пароль:</p>
            <p>Старый пароль:</p>
            <input type="password" name="oldPass">
            <p>Новый пароль:</p>
            <input type="password" name="newPass"><br>
            <button type=submit class="btn btn-success"> Сохранить </button>
        </form>
    </div>
    {/block}
{extends}