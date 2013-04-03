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
    });
</script>
<style>
.ui-datepicker-calendar {
    display: none;
    }
</style>
        <form id = "reports" type='GET' action = "{$_root}/reports/timeoffs">

        <label for = "timeoff_autocomplete"> Имя </label>
        <input type="text" id="timeoff_autocomplete" value = "{$timeoffsAttr['name']}">
        <input type="hidden" id="timeoff_autocomplete_id" name="id" value = "{$timeoffsAttr['id']}" >

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
    {if $timeoffs}
    <table class="table table-bordered">
        <th> Дата </th>
        <th> Тип </th>
        {foreach from=$timeoffs item=timeoff}
        <tr>
            <td>{$timeoff['date']}</td>
            {foreach from=$statuses item=stat}
                <td>{if {$stat['id']} == {$timeoff['status_id']}} {$stat['name']} {/if}</td>
            {/foreach}
            
        </tr>
        {/foreach}
    </table>
    {else}<h3>В этом месяце отгулов нет</h3>
    {/if}
</div>

    {/block}
{/extends}