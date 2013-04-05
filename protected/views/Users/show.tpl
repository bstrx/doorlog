{extends "protected/views/index.tpl"}
    {block name="pagetitle"}<h1>Просмотр пользователя {$userInfo['name']}</h1>{/block}

    {block name="breadcrumbs"}
        <ul class="breadcrumb">
          <li><a href="{$_root}/"> Главная </a> <span class="divider">/</span></li>
          <li><a href="{$_root}/departments/show?id={$userInfo['department_id']}"> Отдел {$userInfo['department']} </a> <span class="divider"> / </span> </li>
          <li class="active"> Пользователь {$userInfo['name']} </li>
        </ul>
    {/block}

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
#reportsdiv > .ui-datepicker-calendar{
    display: none;
    }
</style>


        <div class="span7">
            {if $userInfo}
                <table class="table table-bordered">
                    <th> Имя </th>
                    <th> Отдел </th>
                    <th> Должность </th>
                    <th> Статус </th>
                    <th> Телефон </th>
                    <th> Дата рождения </th>
                    <th> Дата создания </th>
                    {foreach from=userInfo item=user}
                        <tr>
                            <td>{$userInfo['name']}</td>
                            <td> {if (isset($userInfo['department']))}
                                    {$userInfo['department']}
                                 {/if}
                            </td>
                            <td> {if (isset($userInfo['position']))}
                                    {$userInfo['position']}
                                 {/if}
                            </td>
                            <td>{if $userInfo['status']==2}
                                    <span class="label label-success">В офисе</span>
                                {else}
                                    <span class="label">Не в офисе</span>
                                {/if}
                            </td>
                            <td> {$userInfo['phone']} </td>
                            <td> {$userInfo['birthday']} </td>
                            <td> {$userInfo['created']} </td>
                        </tr>
                    {/foreach}
                </table>
            {/if}
        <a class="btn btn-success" href="{$_root}/users/manage?id={$userInfo['id']}"> Редактировать </a>
        <a class="btn" href="{$_root}/users"> Отмена </a>
        <br>
        <br>

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
        {else}<h3>В этом месяце отгулов нет</h3>
        {/if}
        </div>
        <div class="span5">
            {include file='protected/views/Users/timeoff.tpl'}
            <br>
            <h3>Посмотреть отгулы</h3>
    <form id = "reports" type='GET' action = "{$_root}/users/show">
        <input type="hidden" name="id" value = "{$userInfo['id']}" > 
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
        </div>
</div>


    {/block}
{/extends}
