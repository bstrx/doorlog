{extends "protected/views/index.tpl"}
    {block name="content"}
        <table class="table table-bordered">
            <th> Имя </th>
            {foreach from=$search item=user key=key}
                <tr> 
                    <td><a href='{$_root}/users/show?id={$search[$key]['id']}'> {$search[$key]['name']}</a></td>
                </tr>
            {/foreach}
       </table>
    {/block}
{/extends}