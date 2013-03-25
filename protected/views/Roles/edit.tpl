{extends "protected/views/index.tpl"}
    {block name="content"}

    <div class="span7">
        <form method='post' id="change-permissions">
                
                {foreach from=$allPermissions item=group}
                <span class="tbl-span">{$group['group_name']}</span></br>
                <table class="table table-bordered">
                    <tbody>
                        {foreach from=$group['permissions'] item=perm_name key=key}
                            <tr><td>
                            {html_checkboxes name="chb" output=$perm_name['perm_name'] values=$key selected=$rolePermissions}
                            </td></tr>
                        {/foreach}
                    </tbody>
                </table>
                {/foreach}
                <input type="hidden" name="changes" value="done">
                <button type="submit" class="btn"> Изменить </button>
                <a class="btn" href="{$_root}/roles">Отмена</a>
        </form>
   </div>

   {/block}
{/extends}