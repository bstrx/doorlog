{extends "protected/views/index.tpl"}
    
    {block name="content"}
    {if isset($id)}
        {block name="pagetitle"}<h1>Редактировать пользователя {$userInfo['name']}</h1>{/block}
    {else}
        {block name="pagetitle"}<h1>Добавить пользователя</h1>{/block}
    {/if}
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
            <form method="POST">
                {if !isset($id)}
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
                    {if isset($id)}
                        value={$userInfo['email']}
                    {/if}></p>

                <p>Укажите Телефон:</p>
                <input type="text" maxlength="11" name="phone"
                    {if isset($id)}
                        value={$userInfo['phone']}
                    {/if}></p>

                <p>Дата рождения:</p>
                <input name="birthday" id="datepicker" type="text" placeholder="ГГГГ.ММ.ДД"
                    {if isset($id)}
                        value="{$userInfo['birthday']}"
                    {/if}/></p>

                <input type=submit class="btn" value="Выполнить">
            </form>
    {/block}
{/extends}