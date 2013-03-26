{*<div align=right>{$date|date_format:"%m-%Y"}</div>*}

<table class="table table-bordered">
    <colgroup>
        <col class="col-large">
    </colgroup>
    <tbody>
        <tr>
            <td> Всего </td>
            <td>
                {if isset($month['days'][$currentDate]['setTimer']) and {$month['days'][$currentDate]['setTimer']} == 1 }
                    <span class='timer' data-unixtime="{$month['total_sum']}"> </span>    
                {else}{$month['total_sum']|formatDate}
                {/if}
            </td>
        </tr>
    </tbody>
</table>