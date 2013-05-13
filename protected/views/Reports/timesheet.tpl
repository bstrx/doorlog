{extends "protected/views/index.tpl"}
{block name="title"} Табель {/block}
{block name="breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="{$_root}/"> Главная </a> <span class="divider">/</span></li>
        <li class="active"> Табель </li>
    </ul>
{/block}
{block name="content"}
<br>
<table class='table table-bordered'>
    <tr>
        <td> Имя </td>
           {for $day=1 to 9}
               <td> 0{$day} </td>
           {/for}
            {for $day=10 to $dayCount}
               <td> {$day} </td>
           {/for}
    </tr>
    {foreach from=$timesheet item=currentUser}
        <tr>
            <td> {$currentUser['name']} </td>
               {foreach from=$currentUser['report'] item=report}
                   <td> {$report['time']|date_format:"%H:%M"} </td>
               {/foreach}
        </tr>
    {/foreach}

<table>
{/block}