{extends "protected/views/index.tpl"}
    {block name="pagetitle"}<h1>Просмотр пользователя</h1>{/block}

    {block name="content"}
        <div class="span7">
            {if $userInfo}
                <table class="table table-bordered">
                    <th> Имя </th>
                    <th> Отдел </th>
                    <th> Должность </th>
                    <th> Статус </th>
                    <th> Телефон </th>
                    <th> Дата рождения </th>
                    {foreach from=userInfo item=user}
                        <tr>
                            <td>{$userInfo['name']}</td>
                            <td> {if (isset($userInfo['department']))}
                                    {$userInfo['department']}
                                 {/if}
                            </td>
                            <td> {if (isset($userInfo['position']))}
                                    {$userInfo['position']}
                                 {/if}
                            </td>
                            <td>{if $userInfo['status']==2}
                                    <span class="label label-success">В офисе</span>
                                {else}
                                    <span class="label">Не в офисе</span>
                                {/if}
                            </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                    {/foreach}
                </table>
            {/if}
        </div>
        <div id='vacation'>{include file='protected/views/Users/timeoff.tpl'}</div>
    {/block}
{/extends}
