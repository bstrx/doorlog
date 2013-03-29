{extends "protected/views/index.tpl"}
    {block name="pagetitle"}<h1>Просмотр отдела "{$depName['name']}"</h1>{/block}

    {block name="content"}
    <div class="span7">
        <table class="table table-bordered">
            <th> Имя </th>
            <th> Должность </th>
            <th> Отработано за неделю </th>
            <th> Статус</th>

            {foreach from=$users item=user}
                <tr>
                    <td><a href='{$_root}/users/show?id={$user['id']}'> {$user['name']}</a> {if isset($user['chief'])} <span id="chief">начальник</span> {/if}</td>
                    <td>{$user['position']}</td>
                    <td>{$user['time']['total_sum']|formatDate}</td>
                    <td>
                        {if {$user['status']} == 2 }
                            <span class="label label-success">В офисе</span>
                        {else}
                            <span class="label">Не в офисе</span>
                        {/if}
                    </td>
                </tr>
            {/foreach}
       </table>
    </div>
    {/block}

{/extends}