{extends "protected/views/index.tpl"}
{block name="javascript"}
    <script src="{$_root}/assets/js/reportsDatepicker.js"></script>
{/block}
{block name="title"} Табель {/block}
{block name="breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="{$_root}/"> Главная </a> <span class="divider">/</span></li>
        <li class="active"> Табель </li>
    </ul>
{/block}
{block name="content"}
Отчет за месяц:
<form id='timesheet' type='GET' action='{$_root}/reports/timesheet'>
    <input name = "date" type="text" id="datepicker" class='withoutDays' value = "{$date}" />
    <br>
    <input form = "timesheet" type="submit" id="add" value = "Сформировать" class="btn btn-success" >
</form>
<br>
<h3>Отчет за {$date}</h3>
<table id='timesheetTable' class='table table-bordered'>
    <tr>
        <td rowspan='3' width='25px'> Номер по порядку </td>
        <td rowspan='3' width='50px'> Фамилия, инициалы, должность(специальность, профессия) </td>
        <td rowspan='3' width='25px'> Табельный номер </td>
        <td colspan='16'> Отметки о явках и неявках на работу по числам месяца </td>
    </tr>

    <tr>
            {for $day=1 to 9}
                {if $days[$day-1] == 0}
                    <td>
                {else}
                    <td bgcolor='red'>
                {/if}
                 0{$day} </td>
            {/for}
            {for $day=10 to 15}
                {if $days[$day-1] == 0}
                    <td>
                {else}
                    <td bgcolor='red'>
                {/if}
                {$day} </td>
            {/for}
           <td>

    </tr>
    <tr>
            {for $day=16 to $dayCount}
                {if $days[$day-1] == 0}
                    <td>
                {else}
                    <td bgcolor='red'>
                {/if}
                {$day} </td>
            {/for}
            {for $td=0 to 31-$dayCount-1}
               <td></td>
            {/for}
    </tr>
    <tr>
        <td> 1 </td>
        <td> 2 </td>
        <td> 3 </td>
        <td colspan='16'> 4 </td>
    </tr>
    {$id = 1}
    {foreach from=$timesheet item=currentUser}
        <tr>
            <td rowspan='4'> {$id} </td>
            <td rowspan='4'> {$currentUser['name']}, {$currentUser['position']} </td>
            <td rowspan='4'>  </td>
            {$partitionDate = 1}
               {foreach from=$currentUser['report'] item=report}
               {if $partitionDate <= 15}
                    {if $report['dayType'] == 0}
                        {if $report['time'] == 0}
                            <td id = 'workday'> Н </td>
                        {else}
                            <td id = 'workday'> Я </td>
                        {/if}
                    {else}
                        <td bgcolor='red'> В </td>
                    {/if} 
                {$partitionDate=$partitionDate+1}
                {/if}
                {/foreach}
            <td></td>
        </tr>
        <tr>
            {$partitionDate = 1}
            {foreach from=$currentUser['report'] item=report}
            {if $partitionDate <= 15}
                {if $report['dayType'] == 0}
                    {if $report['time'] == 0}
                        <td id = 'workday'>  </td>
                    {else}
                        <td id = 'workday'> {$report['time']|date_format:"%H:%M"} </td>
                    {/if}
                {else}
                    <td bgcolor='red'> {$report['time']|date_format:"%H:%M"} </td>
                {/if} 
            {$partitionDate=$partitionDate+1}
            {/if}
            {/foreach}
            <td></td>
        </tr>
        <tr>
            {$partitionDate = 1}
            {foreach from=$currentUser['report'] item=report}
               {if $partitionDate > 15}
                    {if $report['dayType'] == 0}
                        {if $report['time'] == 0}
                            <td id = 'workday'> Н </td>
                        {else}
                            <td id = 'workday'> Я </td>
                        {/if}
                    {else}
                        <td bgcolor='red'> В </td>
                    {/if}
                {/if}
                {$partitionDate=$partitionDate+1}
            {/foreach}
            {for $td=0 to 30-$dayCount}
                <td></td>
            {/for}
        </tr>
        <tr>
            {$partitionDate = 1}
            {foreach from=$currentUser['report'] item=report}
               {if $partitionDate > 15}
                    {if $report['dayType'] == 0}
                        {if $report['time'] == 0}
                            <td id = 'workday'>  </td>
                        {else}
                            <td id = 'workday'> {$report['time']|date_format:"%H:%M"} </td>
                        {/if}
                    {else}
                        <td bgcolor='red'> {$report['time']|date_format:"%H:%M"} </td>
                    {/if}
                {/if}
                {$partitionDate=$partitionDate+1}
            {/foreach}
            {for $td=0 to 30-$dayCount}
                <td></td>
            {/for}
        </tr>
        {$id=$id+1}
    {/foreach}

<table>
{/block}