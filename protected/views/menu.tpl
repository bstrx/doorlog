{block name="javascrtipt"}
    <script src="/savage21/protected/vendor/twitter/bootstrap/docs/assets/js/bootstrap-dropdown.js"></script>
{/block}

{block name="menu"}
    <div class="bs-menu">
        <div class="btn-toolbar" style="margin: 0;">

            <button class="btn" type="submit" href="#"><a href="/">Главная</a></button>

            <div class="btn-group">
                    <button class="btn dropdown-toggle" data-toggle="dropdown">Отделы <span class="caret"></span></button>
                    <ul class="dropdown-menu">
                      <li><a href="#">QA</a></li>
                      <li><a href="#">RU.Project</a></li>
                      <li><a href="#">ONP</a></li>
                      <li><a href="#">Profit</a></li>
                      <li><a href="#">Administration</a></li>
                    </ul>
            </div><!-- /btn-group -->

            <div class="btn-group">
                    <button class="btn dropdown-toggle" data-toggle="dropdown">Отчеты <span class="caret"></span></button>
                    <ul class="dropdown-menu">
                      <li><a href="#">Отчет по себе</a></li>
                      <li><a href="#">Отчет графический</a></li>
                      <li><a href="#">Отчет по дням</a></li>
                      <li><a href="#">Отчет по отделам</a></li>
                    </ul>
            </div><!-- /btn-group -->

            <div class="btn-group">
                    <button class="btn dropdown-toggle" data-toggle="dropdown">Настройки <span class="caret"></span></button>
                    <ul class="dropdown-menu">
                      <li><a href="#">Отделы</a></li>
                      <li><a href="#">Права доступа</a></li>
                      <li><a href="#">Пользователи</a></li>
                    </ul>
            </div><!-- /btn-group -->

        </div><!-- /btn-toolbar -->
    </div>
{/block}