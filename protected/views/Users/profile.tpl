{extends "protected/views/index.tpl"}
{block name="title"}Настройки профиля{/block}

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
            {/foreach}
        </table>
    </div>
    <div class="span4 additional">
        {include file='protected/views/Users/changePassword.tpl'}
    </div>
    {/block}
{extends}