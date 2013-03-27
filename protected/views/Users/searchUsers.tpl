{extends "protected/views/index.tpl"}
    {block name="content"}
        <table class="table table-bordered">
            <th> Имя </th>
            {foreach from=$searchUsers item=user key=key}
                <tr> {if isset($searchUsers[$key]['name'])}
                    <td><a href='{$_root}/users/show?id={$searchUsers[$key]['id']}'> {$searchUsers[$key]['name']}</a></td>
                    {/if}
                </tr>
            {/foreach}
       </table>
    {/block}
{/extends}