<div class="accordion hidden" id="accordion2">
    <div class="accordion-group">
        <div class="accordion-heading">
            <p class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse">
            </p>
        </div>
        <div id="collapse" class="accordion-body collapse out">
            <div class="accordion-inner">
            </div>
        </div>
    </div>
</div>
{if isset($userName)}
<div class="accordion" id="accordion2">
    <div class="accordion-group">
        <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse{$tableId}">
                <h4>{$userName}</h4>
            </a>
        </div>
        <div id="collapse{$tableId}" class="accordion-body collapse out">
            <div class="accordion-inner">
{/if}
        <table class="table table-bordered reports">
            <th> День недели </th>
            <th> Дата </th>
            <th> Время </th>
            <th> Тип отгула </th>
            {foreach from=$reportAllDaysArray item=timeoff}
                {if $timeoff['dayType']}
                    <tr class='info'>
                {else}
                    <tr>
                {/if}
                    <td> {$timeoff['dayName']} </td>
                    <td> {$timeoff['date']|date_format:"%d.%m.%Y"} </td>
                    <td> {$timeoff['time']|formatDate} </td>
                    <td> {$timeoff['timeoffName']} </td>
                </tr>
            {/foreach}
    </table>
    <a class="btn btn-primary" href="/reports/download?user_id={if $userSelected}{$userSelected}{else}{$tableId}{/if}&date={$timeoffsAttr['date']}">Сохранить</a>
{if isset($userName)}
            </div>
        </div>
    </div>
</div>
{/if}