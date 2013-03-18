{extends "protected/views/index.tpl"}
    {block name="content"}

    <div class="span7">
        <table class="table table-bordered">
            <thead>
                {foreach from=$allPermissions item=groupName}
                    <th>{$groupName['group_name']}</th>

                {/foreach}
            </thead>
            <tbody>
                
                {foreach from=$allPermissions item=permission}
                        <tr>
                            <td> {$permission['name']} </td>
                            
                        </tr>
                    {/foreach}
                 
            </tbody>


        </table>

    {/block}
{/extends}