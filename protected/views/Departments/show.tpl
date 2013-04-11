{extends "protected/views/index.tpl"}

    {block name="breadcrumbs"}
        <ul class="breadcrumb">
          <li><a href="{$_root}/"> Главная </a> <span class="divider">/</span></li>
          <li class="active"> Отдел {$depName['name']} </li>
        </ul>
    {/block}

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
                    <td><a href='{$_root}/users/show?id={$user['id']}'> {$user['name']}</a> 
                        {if isset($depName['chief_id']) && ($depName['chief_id']==$user['id'])}
                            <span id="chief">начальник</span>
                        {/if}
                    </td>
                    <td>{$user['position']}</td>
                    {if ('users_private_info'|checkPermission) || ($userId==$user['id'])}
                        <td>{$user['time']['total_sum']|formatDate}</td>
                    {else}
                        <td>Нет доступа</td>
                    {/if}
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