{extends "protected/views/index.tpl"}
    {block name="pagetitle"}<h1>Результаты поиска</h1>{/block}
    {block name="content"}
    <div class="span7">
        <table class="table table-bordered">
            {if $search}
                <th> Имя </th>
                {foreach from=$search item=user key=key}
                
                    <tr>
                        <td><a href='{$_root}/users/show?id={$search[$key]['id']}'> {$search[$key]['name']}</a></td>
                    </tr>
                
            {/foreach}
            {else}
            <h3>По запросу "{$text}" пользователей не найдено</h3>
            {/if}
       </table>
    </div>
    {/block}
{/extends}