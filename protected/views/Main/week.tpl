<table class="table table-bordered">
    <colgroup>
        <col class="col-small">
        <col class="col-small">
    </colgroup>
    <thead>
        <th> День </th>
        <th> Дата </th>
        <th> Время в офисе </th>
    </thead>
    <tbody>
        {* Перебираем по каждому дню недели (weekDays), в независимости от наличия входов/выходов *}
        {foreach from=$weekDays item=dayInfo}
            <tr>
                <td> {$dayInfo['name']} </td>
                <td> {$dayInfo['date']|date_format:"%d.%m.%Y"} </td>
                <td>
                    {if isset($week['days'][$dayInfo['date']])}
                        {if ($week['days'][$dayInfo['date']]['setTimer'])}
                            {$timer = true}
                            <span class='timer' data-unixtime="{$week['days'][$dayInfo['date']]['sum']}"> </span>
                        {else}
                            {$week['days'][$dayInfo['date']]['sum']|formatDate}
                        {/if}
                    {else}
                        ---
                    {/if}
                </td>
            </tr>
        {/foreach}

        <tr>
            <td colspan=2> Всего </td>
            <td>
                {if isset($timer)}
                    <span class='timer' data-unixtime="{$week['total_sum']}"> </span>
                {else}
                    {$week['total_sum']|formatDate}
                {/if}
            </td>
        </tr>
    </tbody>
</table>
