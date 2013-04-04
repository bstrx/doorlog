{extends "protected/views/index.tpl"}
    {block name="pagetitle"}<h1>Вход в систему</h1>{/block}

    {block name="content"}
        <div id="auth">
            <form method="POST" id="login">
                <p>
                    <label for="login"> Введите email или номер пропуска: </label>
                    <input type="text" size="40" id="login" name="login">
                    <label for="pass"> Введите пароль: </label>
                    <input type="password" id="pass" size="40" name="password">
                </p>

                <input type="submit" value="Войти" class="btn btn-success">
            </form>
            <a href="#myModal" role="button" data-toggle="modal"> Забыли пароль? </a>
        </div>
        <div id="myModal" class="modal hide fade">
            <div class="modal-header">
              <button type="button" class="close"></button>
              <h3 id="myModalLabel">Отправить новый пароль на почту</h3>
            </div>
            <div class="modal-body">
              <label for="loginForForgotPassword"> Введите email или номер пропуска: </label>
              <input type="text" size="40" id="loginForForgotPassword" form="login" name="loginForForgotPassword"><br>
              <button class="btn btn-success" type="submit" form="login">Отправить</button>
              <button class="btn" data-dismiss="modal" aria-hidden="true">Отмена</button>
            </div>
        </div>
    {/block}

{/extends}
