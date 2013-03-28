<table class="table table-bordered">
    <colgroup>
        <col class="col-small">
        <col class="col-small">
    </colgroup>
    <thead>
        <th>Вход</th>
        <th>Выход</th>
        <th>Время в офисе</th>
    </thead>
    <tbody>
        {if ($day && $day['periods'])}
            {foreach from=$day['periods'] item=period}
                {if $period['enter'] && ($period['exit'] || $period['setTimer'])}
                    <tr>
                        {*Вход*}
                        <td>
                            {$period['enter']|date_format:"%H:%M"}
                        </td>

                        {*Выход*}
                        <td>
                            {if !$period['setTimer']}
                                {if ($period['enter']|date_format:"%D" != $period['exit']|date_format:"%D")}
                                    {$period['exit']|date_format:"%H:%M (%d.%m.%Y)"}
                                {else}
                                    {$period['exit']|date_format:"%H:%M"}
                                {/if}
                            {else}
                                <span class="label label-success">В офисе</span>
                            {/if}
                        </td>

                        {*Время в офисе*}
                        {if $period['setTimer']}
                            <td class='timer' data-unixtime="{$period['diff']}"> </td>
                        {else}
                            <td> {$period['diff']|formatDate} </td>
                        {/if}
                    </tr>
                {/if}
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
    </tbody>
</table>



{*
    <td>
    {$period['enter']|date_format:"%H:%M"}
    </td>


    <td>
    {if !$period['setTimer']}
        {if ($period['enter']|date_format:"%D" != $period['exit']|date_format:"%D" && $period['enter'])}
            {$period['exit']|date_format:"%H:%M (%d.%m.%Y)"}
            {else}
            {$period['exit']|date_format:"%H:%M"}
        {/if}


        {else}
        в офисе
    {/if}
    </td>


    {if $period['setTimer']}
        <td class='timer' data-unixtime="{$period['diff']}"> </td>
        {else}
        <td> {$period['diff']|formatDate} </td>
    {/if}
*}
</tr>