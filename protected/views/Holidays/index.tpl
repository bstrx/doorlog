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
                        <td>
                        <form method="POST">
                                <select name="тип" {if $holiday['type']==1 or $holiday['type']==2} class="text-error"{/if}>
                                    {html_options values=$values output=$types selected=$values[$holiday['type']]}
                                </select>
                                <input type="hidden" value="{$holiday['date']}">
                       </form>
                       </td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
{/block}
{/extends}