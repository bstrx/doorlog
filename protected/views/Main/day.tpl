<div align=right>{$date|date_format:"%d-%m-%Y"}</div>
<table class="table table-bordered">
    <th>Вход</th>
    <th>Выход</th>
    <th>Время в офисе</th>
    {if ($day && $day['periods'])}
        {foreach from=$day['periods'] item=period}
            <tr>
                {*Вход*}
                <td>
                    {$period['enter']|date_format:"%H:%M"}
                </td>

                {*Выход*}
                <td>
                    {if !$period['setTimer']}
                        {if ($period['enter']|date_format:"%D" == $period['exit']|date_format:"%D")}
                            {$period['exit']|date_format:"%H:%M"}
                        {else}
                             {$period['exit']|date_format:"%H:%M (%D)"}
                        {/if}
                    {else}
                        в офисе
                    {/if}
                </td>

                {*Время в офисе*}
                {if $period['setTimer']}
                    <td class='timer' data-unixtime="{$period['diff']}"> </td>
                {else}
                    <td> {$period['diff']|formatDate} </td>
                {/if}
            </tr>
        {/foreach}

        {*Суммарное время*}
        <tr>
            <td colspan=2>
                Всего
            </td>

            <td>
                {if $day['setTimer']}
                    <span class='timer' data-unixtime="{$day['sum']}"> </span>
                {else}
                    {$day['sum']|formatDate}
                {/if}
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
