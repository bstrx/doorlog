{extends "protected/views/index.tpl"}
{block name="title"}Месяц{/block}
{block name="javascript"}
<script src="{$_root}/assets/js/monthIndex.js"></script>
{/block}
{block name="breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="{$_root}/"> Главная </a> <span class="divider">/</span></li>
        <li class="active"> Месяц </li>
    </ul>
{/block}
{block name="pagetitle"}<h1>Месяц</h1>{/block}
{block name="content"}
<style>
.ui-datepicker-calendar {
    display: none;
    }
</style>
    <form method="GET" id="date">
        <label for = "datepicker"> Дата </label>
        <input name = "date" type="text" id="datepicker" value = "{$date}" />
    </form>
    {$sum}
{/block}
{/extends}