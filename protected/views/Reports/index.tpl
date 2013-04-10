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
<script type="text/javascript">
    $(function() {
        $("#timeoff_autocomplete").autocomplete({
            minLength: 3,
            source: function( request, response ) {
                $.ajax({
                    url: "{$_root}/users/autocomplete",
                    dataType: "json",
                    data:{
                        name:request.term
                    },

                    success: function(data) {
                        response($.map(data, function(item) {
                            return {
                                label:item.name,
                                id:item.id
                            };
                        }));
                    }
                });
            },
            select: function( event, ui ) {
                $("#timeoff_autocomplete_id").val(ui.item.id);
            },
            messages: {
                noResults: '',
                results: function() {
                }
            }
        });
    });
    $(document).ready(function () {
        $('#timeoff_autocomplete').keyup(function (e) {
            if((e.keyCode!=37) && (e.keyCode!=38) && (e.keyCode!=39) && (e.keyCode!=40) && (e.keyCode!=13)){
                $("#timeoff_autocomplete_id").val('');
            }
        });
    $("select#dep_id").find(":selected").val(0);
        $("select#type").change(function(){
            selectedVal = $(this).find(":selected").val();
            if (selectedVal == 2) {
                $("div#dep").show();
                $("div#user").hide();
                $("select#user_id").find(":selected").val(0);
            } else {
                $("div#user").show();
                $("div#dep").hide();
            }
        });
 });
</script>
<style>
.ui-datepicker-calendar {
    display: none;
    }
#dep{
    display: none;
}
</style>
        <form id = "reports" type='GET' action = "{$_root}/reports/timeoffs">

        <select id = 'type'>
            <option value='1'> Пользователь </option>
            <option value='2'> Отделы </option>
        </select>
        <div id="user">
            <select id='user_id' name = 'user_id'>
            {foreach from=$allUsers item=user}
                <option value = "{$user['id']}"> {$user['name']} </option>
            {/foreach}
            </select>
        </div>

        <div id="dep">
            <select id='dep_id' name = 'dep_id'>
            {foreach from=$allDep item=dep}
                <option value = "{$dep['id']}"> {$dep['name']} </option>
            {/foreach}
            </select>
        </div>


        <label for = "datepicker"> Дата </label>
        <input name = "date" type="text" id="datepicker" value = "{$timeoffsAttr['date']}" />

        <label for = "type"> Тип </label>
        <select name = "type">
            <option value = "0"> Все </option>
            {foreach from=$statuses item=stat}
                <option value = "{$stat['id']}"> {$stat['name']} </option>
            {/foreach}
        </select>

    </form>
    <input form = "reports" type="submit" id="add" value = "Сформировать" class="btn btn-success" >
    <br>
    <br>
    <div class="span7">
    {if $reportAllDaysArray}
        <table class="table table-bordered">
            <th> День недели </th>
            <th> Дата </th>
            <th> Тип </th>
            <th> Время </th>
            {foreach from=$reportAllDaysArray item=timeoff}
            <tr>
                <td>{$timeoff['dayName']}</td>
                <td>{$timeoff['date']|date_format:"%d.%m.%Y"}</td>
                <td>{$timeoff['timeoffName']}</td>
                <td>{$timeoff['time']|formatDate}</td>
            </tr>
            {/foreach}
        </table>
    {else}
    {if $timeoffsAllUsers}
        {foreach from=$timeoffsAllUsers item=allUsers}
            <h3>{$allUsers['name']}</h3>
            {if $allUsers['reports']}
            <table class="table table-bordered">
                <th> Дата </th>
                <th> Тип </th>
                <th> Время </th>
                <tr>
                    {foreach from=$allUsers['reports'] item=report}
                    <tr>
                        <td>{$report['dayName']}</td>
                        <td>{$report['date']|date_format:"%d.%m.%Y"}</td>
                        <td>{$report['timeoffName']}</td>
                        <td>{$report['time']|formatDate}</td>
                    {/foreach}
                </tr>
            </table>
            {else}<h5>Отгулов нет</h5>
            {/if}
        {/foreach}{else}<h5>Отгулов нет<h5>
    {/if}
    {/if}
</div>
    {/block}
{/extends}