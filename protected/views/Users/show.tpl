{extends "protected/views/index.tpl"}
    {block name="title"}Просмотр пользователя{/block}
    {block name="pagetitle"}<h1>Просмотр пользователя {$userInfo['name']}</h1>{/block}

    {block name="breadcrumbs"}
        <ul class="breadcrumb">
            <li><a href="{$_root}/"> Главная </a> <span class="divider">/</span></li>
            <li>
                <a href="{$_root}/departments/show?id={$userInfo['department_id']}"> Отдел {$userInfo['department']} </a>
                <span class="divider"> / </span>
            </li>
            <li class="active"> Пользователь {$userInfo['name']} </li>
        </ul>
    {/block}

    {block name="javascript"}
        <script src="{$_root}/assets/js/holidaysDatepicker.js"></script>
        <script src="{$_root}/assets/js/rangeDatepicker.js"></script>
    {/block}

    {block name="content"}
        <div class="span7">
            {if 'users_profile'|checkPermission}
                <a href="{$_root}/users/profile?id={$smarty.get.id}">Профиль пользователя</a>
            {/if}
            {if $userInfo}
                <table class="table table-bordered">
                    <colgroup>
                        <col class="col-small">
                    </colgroup>
                    {foreach from=userInfo item=user}
                        <tr>
                            <td> Имя </td>
                            <td>{$userInfo['name']}</td>
                        </tr>
                        <tr>
                            <td> Отдел </td>
                            <td>
                                {if (isset($userInfo['department']))}
                                    {$userInfo['department']}
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <td> Должность </td>
                            <td>
                                {if (isset($userInfo['position']))}
                                    {$userInfo['position']}
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <td> Статус </td>
                            <td>
                                {if $userInfo['status']==2}
                                    <span class="label label-success">В офисе</span>
                                {else}
                                    <span class="label">Не в офисе</span>
                                {/if}
                            </td>
                        </tr>
                        {if ('users_private_info'|checkPermission) || ($permission==1)}
                            <tr>
                                <td> Телефон </td>
                                <td> {$userInfo['phone']} </td>
                            </tr>
                            {if $userInfo['birthday']}
                                <tr>
                                    <td> Дата рождения </td>
                                    <td> {$userInfo['birthday']|date_format:"%d.%m.%Y"} </td>
                                </tr>
                            {/if}
                        {/if}
                        <tr>
                            <td> Дата создания </td>
                            <td> {$userInfo['created']} </td>
                        </tr>
                    {/foreach}
                </table>
            {/if}
            {if 'users_edit'|checkPermission}
                <a class="btn btn-success" href="{$_root}/users/manage?id={$userInfo['id']}"> Редактировать </a>
                <a class="btn" href="{$_root}/users"> Отмена </a>
            {/if}
        </div>

        {if $permission==1 || 'timeoffs_add'|checkPermission}
            <div class="span4 additional">
                {include file='protected/views/Users/timeoff.tpl'}
            </div>
        {/if}
    {/block}
{/extends}
