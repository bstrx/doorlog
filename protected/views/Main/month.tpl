{*<div align=right>{$date|date_format:"%m-%Y"}</div>*}

<table class="table table-bordered">
    <colgroup>
        <col class="col-large">
    </colgroup>
    <tbody>
        <tr>
            <td>Рабочих дней</td>
            <td>{$workingDays}</td>
        </tr>
        <tr>
            <td>Взято отгулов</td>
            <td>{$reportsDays}</td>
        </tr>
        <tr>
            <td>Отработано дней</td>
            <td>{$workedDays}</td>
        </tr>
        <tr>
            <td> Всего </td>
            <td>
                {if isset($month['days'][$currentDate]['setTimer']) && {$month['days'][$currentDate]['setTimer']} && {$date|date_format:"m"} == {$currentDate|date_format:"m"}}
                    <span class='timer' data-unixtime="{$month['total_sum']}"> </span>
                {else}{$month['total_sum']|formatDate}
                {/if}
            </td>
        </tr>
    </tbody>
</table>