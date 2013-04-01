{extends "protected/views/index.tpl"}
    
    {block name="content"}
        {if isset($userId)}
            {block name="pagetitle"}<h1>Изменить пользователя {$userInfo['name']}</h1>{/block}
        {else}
            {block name="pagetitle"}<h1>Добавить пользователя</h1>{/block}
        {/if}
        
        <script>
            $(document).ready(function()
            {
                    $("#dialog").dialog({
                        autoOpen: false,
                        modal: true,
                        position: ["center"],
                        buttons: {
                            "Ок": function() {
                                $("#del-user").submit();
                            },
                            "Отмена": function() {
                                $(this).dialog("close");
                            }
                        }
                    });
                $("#delete").click(function(e){
                    e.preventDefault();
                    $('#dialog').dialog('open');
                });
            });
        </script>
        
        <script>
        $(function() {
          $( "#datepicker" ).datepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: "1930:",
            dateFormat: 'yy-mm-dd'
          });
        });
        </script>
        <form method="POST" id="user">
            {if !isset($userId)}
                <p>Выберите пользователя:</p>
                <select name="userId">
                    {html_options options=$users}
                </select> </br>
            {/if}
            
            <p>Выберите отдел:</p>
            <select name="department">
                <option value=0></option>
                {html_options options=$departments selected={$userInfo['department_id']}}
            </select> </br>

            <p>Выберите должность:</p>
            <select name="position">
                <option value=0</option>
                {html_options options=$positions selected={$userInfo['position_id']}}
            </select> </br>

            <p>Укажите Email:</p>
            <input type="text" maxlength="45" size="40" name="email"
                {if isset($userId)}
                    value={$userInfo['email']}
                {/if}>

            <p>Укажите Телефон:</p>
            <input type="text" maxlength="11" name="phone"
                {if isset($userId)}
                    value={$userInfo['phone']}
                {/if}>

            <p>Дата рождения:</p>
            <input name="birthday" id="datepicker" type="text"
                {if isset($userId)}
                    value="{$userInfo['birthday']}"
                {/if}/>
            <br>
            
        </form>

        <form action = "{$_root}/users/delete" method='post'  id="del-user">
            <input type="hidden" name="id" value="{$userId}">
        </form>

        <button type=submit class="btn btn-success" form="user">
            {if isset($userId)}
                Сохранить
            {else}
                Добавить
            {/if}
        </button>

        <a class="btn" href="{$_root}/users"> Отмена </a>

        {if isset($userId)}
            <button type="submit" class="btn btn-danger" id="delete" form="del-user"> Удалить </button>
        {/if}

        <div id="dialog">
            <p>Дейсвительно хотите удалить?</p>
        </div>

    {/block}
{/extends}