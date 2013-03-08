<div align=right>{$date|date_format:"%d-%m-%Y"}</div>
<table class="table table-bordered">
    <th>Вход</th>
    <th>Выход</th>
    <th>Время в офисе</th>
    {if ($day && $day['periods'])}
        {foreach from=$day['periods'] item=period}
            <tr>
                <td> {$period['enter']|date_format:"%H:%M"}</td>
                {if ($period['enter']|date_format:"%D" == $period['exit']|date_format:"%D")}
                    <td> {$period['exit']|date_format:"%H:%M"} </td>
                {else}
                    <td> {$period['exit']|date_format:"%H:%M (%D)"} </td>
                {/if}
                <td>
                    {$period['diff']|formatDate}
                </td>

            </tr>
        {/foreach}

        <tr>
            <td colspan=2> Всего </td>
            <td>
                {$day['sum']|formatDate}
            </td>
        </tr>
    {else}
        <tr>
            <td  colspan=3>
                <div align=center>  В этот день посещений не было </div>
            </td>
        </tr>
    {/if}
</table>
