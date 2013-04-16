{extends "protected/views/index.tpl"}
{block name="pagetitle"}<h1>Выходные дни</h1>{/block}

{block name="content"}
    <script type="text/javascript">
    $(document).ready(function () {
        $("#auto").click(function(){
            $("select#holiday").val(1);
            $("select#holiday").attr("class","text-error");
        });
    });
    $(function() {
    $('#datepicker').datepicker( {
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'mm.yy',
        closeText : "Готово",
        currentText: "Сегодня",
        onClose: function(dateText, inst) { 
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            $(this).datepicker('setDate', new Date(year, month, 1));
            $("form#date").submit();
        }
    });
});
</script>
<style>
.ui-datepicker-calendar {
    display: none;
    }
</style>
    <div class="span7">
        <form method="GET" id="date">
            <label for = "datepicker"> Дата </label>
            <input name = "date" type="text" id="datepicker" value = "{$date}" />
        </form>
        <table class="table table-bordered">
            <thead>
                <th> День недели </th>
                <th> Дата </th>
                <th> Тип </th>
            </thead>
            <tbody>
            <form method="POST" id="type">
                {$i=0}
                {foreach from=$holidays item=holiday}
                    <tr>
                        <td>{$holiday['days']}</td>
                        <td> {$holiday['date']}</td>
                        <td>
                            <select id="select" name="{$i}"{if $holiday['trigger']==1} id="holiday"{/if} {if $holiday['type']==1 or $holiday['type']==2} class="text-error"{/if}>
                                <option value="0"{if $holiday['trigger']==0} selected {/if}>Рабочий</option>
                                {html_options values=$values output=$types selected=$holiday['type']}
                            </select>
                        </td>
                    </tr>
                    {$i=$i+1}
                {/foreach}
            </form>
            </tbody>
        </table>
    <button form="type" class="btn btn-success" type="submit">Сохранить</button>
    </div>
    <div class="span4 additional">
            

            <p>Пометить все субботы и воскресенья как выходные. Для того, чтобы изменения вступили в силу, необходимо их сохранить</p>
            <button id="auto" class="btn">Автозаполнение</button>
    </div>
{/block}
{/extends}