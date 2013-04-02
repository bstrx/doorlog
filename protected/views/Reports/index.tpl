{extends "protected/views/index.tpl"}
    {block name="breadcrumbs"}
        <ul class="breadcrumb">
          <li><a href="{$_root}/"> Главная </a> <span class="divider">/</span></li>
          <li class="active"> Отгулы </li>
        </ul>
    {/block}
    {block name="pagetitle"}<h1>Отгулы</h1>{/block}
    {block name="content"}
<script type="text/javascript">
$(function() {
    $('#datepicker').datepicker( {
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'yy-mm',
        closeText : "Готово",
        currentText: "Сегодня",
        onClose: function(dateText, inst) { 
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            $(this).datepicker('setDate', new Date(year, month, 1));
        }
    });
});
</script>
<style>
.ui-datepicker-calendar {
    display: none;
    }
</style>
        <form id = "reports" type='GET' action = "{$_root}/reports/timeoffs">
        <input name = "id" type="hidden" value = "122"/>
        <label for = "datepicker"> Дата </label>
        <input name = "date" type="text" id="datepicker" />
        <br>
        <select name = "type">
            <option value = "0"> Все </option>
            {foreach from=$statuses item=stat}
                <option value = "{$stat['id']}"> {$stat['name']} </option>
            {/foreach}
        </select>

    </form>
    <input form = "reports" type="submit" id="add" value = "Сформировать" class="btn btn-success">
    <br>
    <br>
    <div class="span7">
    {if $timeoffs}
    <table class="table table-bordered">
        <th> Дата </th>
        <th> Тип </th>
        {foreach from=$timeoffs item=timeoff}
        <tr>
            <td>{$timeoff['date']}</td>
            <td>{$timeoff['status_id']}</td>
        </tr>
        {/foreach}
    </table>
    {else}<h3>В этом месяце отгулов нет</h3>
    {/if}
</div>
    {/block}
{/extends}