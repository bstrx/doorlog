{extends "protected/views/index.tpl"}

    {block name="content"}
        <a href="/users/add">Добавить пользователя</a>
        <table class="table table-bordered">
            <thead>
                <th>Имя</th>
                <th>Должность</th>
                <th>Отдел</th>
                <th>Email</th>
            </thead>
            <tbody>
                {foreach from=$users item=user}
                    <tr>
                        <td> {$user['name']} </td>
                        <td> {$user['position']} </td>
                        <td> {$user['department']} </td>
                        <td> {$user['email']} </td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    {/block}

{/extends}