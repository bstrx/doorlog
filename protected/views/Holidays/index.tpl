{extends "protected/views/index.tpl"}
{block name="pagetitle"}<h1>Выходые дни</h1>{/block}

{block name="content"}
    <div class="span7">
        <table class="table table-bordered">
            <thead>
                <th> День недели </th>
                <th> Дата </th>
                <th> Тип </th>
            </thead>
            <tbody>
            <form method="POST" id="type">
                {foreach from=$holidays item=holiday}
                    <tr>
                        <td>{$holiday['Days']}</td>
                        <td> {$holiday['date']}</td>
                        <td>

                                <select name="{$holiday['date']}" {if $holiday['type']==1 or $holiday['type']==2} class="text-error"{/if}>
                                    {html_options values=$values output=$types selected=$values[$holiday['type']]}
                                </select>
                                <input type="hidden" id="date" value="{$holiday['date']}">
                      
                       </td>
                    </tr>
                {/foreach}
            </tbody>
            </form>
        </table>
        <button form="type" class="btn btn-success" type="submit">Сохранить</button>
    </div>
{/block}
{/extends}