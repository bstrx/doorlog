{extends "protected/views/index.tpl"}

    {block name="content"}
        <div class='span7'>
            <table class="table table-bordered">
                <thead>
                    <th>Имя</th>
                    <th>Email</th>
                    <th>Отдел</th>
                    <th>Должность</th>
                </thead>
                <tbody>
                    {foreach from=$users item=user}
                        <tr>
                            <td> {$user['name']} </td>
                            <td> {$user['email']} </td>
                            <td> {$user['department']} </td>
                            <td> {$user['position']} </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
            <a href="{$_root}/users/add">Добавить пользователя</a>
        </div>
    {/block}

{/extends}