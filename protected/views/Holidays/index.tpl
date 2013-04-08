{extends "protected/views/index.tpl"}
{block name="pagetitle"}<h1>Учёт рабочего дня</h1>{/block}

{block name="content"}
    <div class="span7">
        <table class="table table-bordered">
            <thead>
                <th> День недели </th>
                <th> Дата </th>
                <th> Тип </th>
            </thead>
            <tbody>
                {foreach from=$holidays item=holiday}
                    <tr>
                        <td>{$holiday['Days']}</td>
                        <td> {$holiday['date']}</td>
                        {if $holiday['type']==1}
                        <td>
                        <form method="POST">
                                <select name="тип" class="text-error">
                                    {html_options values=$values output=$types selected=$first}
                                </select>
                                <input type="hidden" value="{$holiday['date']}">
                       </form>
                       </td>
                       {elseif $holiday['type']==2}
                        <td>
                        <form method="POST">
                                <select name="тип" class="text-error">
                                    {html_options values=$values output=$types selected=$second}
                                </select>
                                <input type="hidden" value="{$holiday['date']}">
                       </form>
                       </td>
                       {elseif $holiday['type']==0}
                       <td>
                       <form method="POST">
                                <select name="тип">
                                    {html_options values=$values output=$types selected=$third}
                                </select>
                                <input type="hidden" value="{$holiday['date']}">
                       </form>
                       </td>
                       {/if}
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
{/block}
{/extends}