{extends "protected/views/index.tpl"}
{block name="javascript"}
    <script src="{$_root}/assets/js/reportsDatepicker.js"></script>
    <script src="{$_root}/assets/js/reportsAutocomplete.js"></script>
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
            <option value='1' selected> Пользователь </option>
            {if {$smarty.get.stype} == 2}
                <option value='2' selected> Отделы </option>
            {else}
                <option value='2'> Отделы </option>
            {/if}
        </select>
        <div id="user">
            {$userSelected=0}
            <select id='user_id' name = 'user_id'>
            {foreach from=$allUsers item=user}
            {if {$user['id']} == {$smarty.get.user_id}}
                <option value = "{$user['id']}" {$userSelected=$user['id']} selected> {$user['name']} </option>
            {else}
                <option value = "{$user['id']}"> {$user['name']} </option>
            {/if}
            {/foreach}
            </select>
        </div>

        <div id="dep">
            <select id='dep_id' name='dep_id'>
            {foreach from=$allDep item=dep}
            {if {$dep['id']} == {$smarty.get.dep_id}}
                <option value = "{$dep['id']}" {$depSelected=$dep['id']} selected> {$dep['name']} </option>
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
    {if $totalDepInfo}
        <br>
        <br>
        <table class="table table-bordered reports">
            <tr>
                <td> Имя </td>
                <td> Часы </td>
                {foreach from=$totalDepInfo['statuses'] item=totalUserInfo}
                    <td>{$totalUserInfo['name']}</td>
                {/foreach}
            <tr>
            {foreach from=$totalDepInfo['totalUserStats'] item=user}
            <tr>
                <td><a href="{$_root}/reports/timeoffs?stype=1&user_id={$user['id']}&dep_id=0&date={$totalDepInfo['date']}">{$user['name']}</a></td>
                {foreach from=$user['stats'] item=userStats}
                <td>{$userStats}</td>
                {/foreach}
            </tr>
            {/foreach}
        </table>
    {/if}
    {/if}
    </div>
    {/block}
{/extends}