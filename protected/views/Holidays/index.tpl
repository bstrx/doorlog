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
                        {if $holiday['type'] ==1}
                            <td>
                            <form method="POST">
                                <select name="тип" class="text-error">
                                    <option class="text-error" value="t1" selected>Выходной</option>
                                    <option class="text-error" value="t2">короткий</option>
                                    <option value="t3" class="text-black">рабочий</option>
                                </select>
                            </form>
                            </td>
                        {elseif $holiday['type']==0}
                            <td>
                            <form method="POST">
                                <select name="тип">
                                    <option class="text-error" value="t1">Выходной</option>
                                    <option class="text-error" value="t2">короткий</option>
                                    <option class="text-black" value="t3" selected>рабочий</option>
                                </select>
                            </form>
                            </td>
                        {elseif $holiday['type']==2}
                            <td>
                            <form method="POST">
                                <select name="тип" class="text-error">
                                    <option class="text-error" value="t1">Выходной</option>
                                    <option class="text-error" value="t2" selected>короткий</option>
                                    <option class="text-black" value="t3">рабочий</option>
                                </select>
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