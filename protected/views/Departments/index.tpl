{extends "protected/views/index.tpl"}

{block name="content"}
    <div class="span7">
        <h1>Отделы</h1>
        <a href="{$_root}/departments/add">Добавить отдел</a>

        <table class="table table-bordered">
            <th> Название отдела </th>
            <th> Кол-во сотрудников </th>
            <th> Начальник </th>
            <th></th>

            {foreach from=$departments item=department}
                <tr>
                    <td><a href="{$_root}/departments/show?id={$department['id']}">{$department['name']}</a></td>
                    <td> {$department['total_users']} </td>
                    <td> {$department['chief_name']} </td>
                    <td><a href="{$_root}/departments/edit?id={$department['id']}">Редактировать</a></td>
                </tr>
            {/foreach}
        </table>
    </div>
{/block}

{/extends}