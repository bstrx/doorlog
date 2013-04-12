{extends "protected/views/index.tpl"}
{block name="pagetitle"}<h1>Выходые дни</h1>{/block}

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
    <div class="span7">
        <form method="GET" id="date">
        <label for = "datepicker"> Дата </label>
        <input name = "date" type="text" id="datepicker" value = "{$date}" />
        </form>
        <button form="date" class="btn btn-success" type="submit">Сформировать</button>
        {if $holidays}
            <table class="table table-bordered">
                <thead>
                    <th> День недели </th>
                    <th> Дата </th>
                    <th> Тип </th>
                </thead>
                <tbody>
                <form method="POST" id="type">
                    {foreach from=$holidays item=holiday}
                        <tr>
                            <td>{$holiday['days']}</td>
                            <td> {$holiday['date']}</td>
                            <td>
                                <select name="{$holiday['date']}"{if $holiday['trigger']==1} id="holiday"{/if} {if $holiday['type']==1 or $holiday['type']==2} class="text-error"{/if}>
                                    <option value="0"{if $holiday['trigger']==0} selected {/if}>Рабочий</option>
                                    {html_options values=$values output=$types selected=$holiday['type']}
                                </select>
                            </td>
                        </tr>
                    {/foreach}
                </form>
                </tbody>
            </table>
            <button form="type" class="btn btn-success" type="submit">Сохранить</button>
            <button id="auto">Автозаполнение</button>
        {/if}
    </div>
{/block}
{/extends}