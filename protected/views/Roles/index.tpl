{extends "protected/views/index.tpl"}

    {block name="content"}
    <div class="span7">
        <table class="table table-bordered">
        <thead>
                    <th>Роль</th>
                    <th>Кол-во обладателей</th>
                    <th>Управление</th>

                </thead>
                <tbody>
                    {foreach from=$roles item=role}
                        <tr>
                            <td> {$role['name']} </td>
                            <td> {$role['users_count']} </td>
                            <td><a href="{$_root}/roles/edit?id={$role['id']}">Редактировать</a></td>

                        </tr>
                    {/foreach}
                </tbody>
            </table>

    {/block}

{/extends}    