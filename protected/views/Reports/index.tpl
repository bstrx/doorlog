{extends "protected/views/index.tpl"}
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
        $("#autocomplete1").autocomplete({
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
                $("#id1").val(ui.item.id);
            },
            messages: {
                noResults: '',
                results: function() {
                }
            }
        });
    });
    $(document).ready(function () {
        $('#autocomplete1').keyup(function (e) {
            if((e.keyCode!=37) && (e.keyCode!=38) && (e.keyCode!=39) && (e.keyCode!=40) && (e.keyCode!=13)){
                $("#id1").val('');
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

        <label for = "autocomplete1"> Имя </label>
        <input type="text" id="autocomplete1">
        <input type="hidden" id="id1" name="id" value = "" >

        <label for = "datepicker"> Дата </label>
        <input name = "date" type="text" id="datepicker" />

        <label for = "type"> Тип </label>
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