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

        $("#selectType").click(function(){
        selectType = document.getElementById('selectType').value;
        if (selectType == 1) {
            selectuser = document.getElementById('selectuser');
            selectuser.style.display='block';
            selectdep = document.getElementById('selectdep');
            selectdep.style.display='none';

        } else if(selectType == 2) {
            selectdep = document.getElementById('selectdep');
            selectdep.style.display='block';
            selectuser = document.getElementById('selectuser');
            selectuser.style.display='none';

        } else {
            selectdep = document.getElementById('selectdep');
            selectdep.style.display='none';
            selectuser = document.getElementById('selectuser');
            selectuser.style.display='none';

        }

        });
            });

</script>
<style>
.ui-datepicker-calendar {
    display: none;
    }
#selectuser{
    display: none; 
}
#selectdep{
    display: none;
}
</style>
        <form id = "reports" type='GET' action = "{$_root}/reports/timeoffs">

        <select id = 'selectType'>
            <option id='all' value='0'> Все </option>
            <option value='1' > Пользователь </option>
            <option value='2'> Отделы </option>
        </select>
        <div id="selectuser">
            <select name = 'user_id'>
            <option value='0'></option>
            {foreach from=$allUsers item=user}
                <option value = "{$user['id']}"> {$user['name']} </option>
            {/foreach}
            </select>
        </div>

        <div id="selectdep">
            <select name = 'dep_id'>
            <option value='0'></option>
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
    {if $timeoffs}
        <table class="table table-bordered">
            <th> Дата </th>
            <th> Тип </th>
            {foreach from=$timeoffs item=timeoff}
            <tr>
                <td>{$timeoff['date']}</td>
                <td>{$timeoff['name']}</td>
            </tr>
            {/foreach}
        </table>
    {else}
    {if $timeoffsAllUsers}
        {foreach from=$timeoffsAllUsers item=allUsers}
            <h3>{$allUsers['name']}</h3>
            {if $allUsers['timeoffs']}
            <table class="table table-bordered">
                <th> Дата </th>
                <th> Тип </th>
                <tr>
                    {foreach from=$allUsers['timeoffs'] item=timeoffUser}
                    <tr>
                        <td>{$timeoffUser['date']}</td>
                        <td>{$timeoffUser['name']}</td>
                    {/foreach}
                </tr>
            </table>
            {else}<h5>Отгулов нет</h5>
            {/if}
        {/foreach}
    {/if}
    {/if}
</div>
    {/block}
{/extends}