{extends "protected/views/index.tpl"}

    {block name="content"}
    <div class="span7">
        <table class="table table-bordered">
        <thead>
                    <th>Роль</th>
                    <th>Кол-во обладателей</th>

                </thead>
                <tbody>
                    {foreach from=$roles item=role}
                        <tr>
                            <td> {$role['role_name']} </td>
                            <td> {$role['users_count']} </td>

                        </tr>
                    {/foreach}
                </tbody>
            </table>

    {/block}

{/extends}    