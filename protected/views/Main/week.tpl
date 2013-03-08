<div align=right>
    {$weekDays['0']['date']|date_format:"%d-%m-%Y"}
    -
    {$weekDays['6']['date']|date_format:"%d-%m-%Y"}
</div>

<table class="table table-bordered">
    <th> День </th>
    <th> Дата </th>
    <th> Время в офисе </th>

    {foreach from=$weekDays item=dayInfo}
        <tr>
            <td> {$dayInfo['name']} </td>
            <td> {$dayInfo['date']|date_format:"%d-%m-%Y"} </td>
            <td>
                {if isset($week['days'][$dayInfo['date']])}
                    {$week['days'][$date]['sum']|formatDate}
                {else}
                    ---
                {/if}
            </td>
        </tr>
    {/foreach}

    <tr>
        <td colspan=2> Всего </td>
        <td> {$week['total_sum']|formatDate} </td>
    </tr>
</table>
