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
            {if 'user_manage'|checkPermission}
                <a class="btn btn-success" href="{$_root}/users/manage?id={$userInfo['id']}"> Редактировать </a>
                <a class="btn" href="{$_root}/users"> Отмена </a>
            {/if}
        </div>
        {if 'timeoffs_add'|checkPermission}
            <div class="span4 additional">
                {include file='protected/views/Users/timeoff.tpl'}
            </div>
        {/if}
    {/block}
{/extends}
