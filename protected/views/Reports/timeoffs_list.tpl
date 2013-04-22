{extends "protected/views/index.tpl"}
{block name="javascript"}
    <script src="{$_root}/assets/js/reportsTimesOffsList.js"></script>
{/block}
{block name="title"} Отчет по посещаемости {/block}
    {block name="breadcrumbs"}
        <ul class="breadcrumb">
          <li><a href="{$_root}/"> Главная </a> <span class="divider">/</span></li>
          <li class="active"> Отчет по посещаемости </li>
        </ul>
    {/block}
    {block name="pagetitle"}<h1> Отчет по посещаемости </h1>{/block}
    {block name="content"}

        <form id = "reports" type='GET' action = "{$_root}/reports/timeoffs">

        <select id = 'type' name='stype'>
            <option value='1'> Пользователь </option>
            {if {$smarty.get.stype} == 2}
            <option selected value='2'> Отделы </option>
            {else}
            <option value='2'> Отделы </option>
            {/if}
        </select>
        <div id="user">
            <select id='user_id' name = 'user_id'>
            {foreach from=$allUsers item=user}
            {if {$user['id']} == {$smarty.get.user_id}}
            asd{$_GET['user_id']}
                <option value = "{$user['id']}" selected> {$user['name']} </option>
                {else} 
                <option value = "{$user['id']}"> {$user['name']} </option>
                {/if}
            {/foreach}
            </select>
        </div>

        <div id="dep">
            <select id='dep_id' name='dep_id'>
            {foreach from=$allDep item=dep}
            {if {$user['id']} == {$smarty.get.user_id}}
                <option value = "{$dep['id']}" selected> {$dep['name']} </option>
                {else}
                <option value = "{$dep['id']}"> {$dep['name']} </option>
                {/if}
            {/foreach}
            </select>
        </div>


        <label for = "datepicker"> Дата </label>
        <input name = "date" type="text" id="datepicker" class='withoutDays' value = "{$timeoffsAttr['date']|date_format:"%m.%Y"}" />

    </form>
    <input form = "reports" type="submit" id="add" value = "Сформировать" class="btn btn-success" >
    <br>
    <br>
    <div class="span7">
    {if $reportAllDaysArray}
        <h3>{$name['user']}</h3>
        {include file='protected/views/Reports/timeoffs.tpl' reportAllDaysArray = $reportAllDaysArray}
    {else}
        {if $timeoffsAllUsers}
            <h3>{$name['dep']}</h3>
            {foreach from=$timeoffsAllUsers item=allUsers}
                {if $allUsers['reports']}
                    {include file='protected/views/Reports/timeoffs.tpl' reportAllDaysArray = $allUsers['reports'] tableId=$allUsers['id'] userName = $allUsers['name']}
                    {else}
                {/if}
            {/foreach}
        {else}{/if}
    {/if}
    </div>
    {/block}
{/extends}