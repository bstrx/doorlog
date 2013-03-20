{extends "protected/views/index.tpl"}
    {block name="content"}

    <div class="span7">

                
                {foreach from=$allPermissions item=group}
                <span class="tbl-span">{$group['group_name']}</span></br>
                <table class="table table-bordered">
                    <tbody>

                {foreach from=$group['permissions'] item=perm_name key=key}
                    
                        <tr><td>{$perm_name}</td></tr>
                        
                
                    {/foreach}
                           </tbody>
                </table>
                            
                        
                    {/foreach} 
                


    {/block}
{/extends}