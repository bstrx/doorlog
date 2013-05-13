{block name="main_menu"}
<div class="navbar">
    <div class="navbar-inner">
        <div class="container">
            <ul class="nav">
                <li><a href="{$_root}/"><i class="icon-home"></i></a></li>
                {if 'menu_departments'|checkPermission}
                <li class="dropdown">
                    <a href="" class="dropdown-toggle" data-toggle="dropdown">
                        Отделы <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        {if isset($_menu)}
                            {foreach from=$_menu item=departments}
                                <li><a href="{$_root}/departments/show?id={$departments['id']}">{$departments['name']}</a></li>
                            {/foreach}
                        {/if}
                    </ul>
                </li>
                {/if}

                {if 'menu_reports'|checkPermission}
                <li class="dropdown">
                    <a href="" class="dropdown-toggle" data-toggle="dropdown">
                        Отчёты <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="{$_root}/reports/officeload">По загрузке</a></li>
                        <li><a href="{$_root}/reports/timeoffs">По посещаемости</a></li>
                        <li><a href="{$_root}/reports/timesheet"> Табель </a></li>
                    </ul>
                </li>
                {/if}

                {if 'menu_settings'|checkPermission}
                <li class="dropdown">
                    <a href="" class="dropdown-toggle" data-toggle="dropdown">
                        Настройки <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="{$_root}/departments">Отделы</a></li>
                        <li><a href="{$_root}/roles">Права доступа</a></li>
                        <li><a href="{$_root}/users">Пользователи</a></li>
                        <li><a href="{$_root}/positions">Должности</a></li>
                        <li><a href="{$_root}/holidays">Выходные дни</a></li>
                    </ul>
                </li>
                {/if}

            </ul>
            <ul class="nav pull-right">
                <li><a href="{$_root}/users/profile">Мой профиль</a></li>
                <li><a href="{$_root}/users/logout">Выйти</a></li>
            </ul>

            {if 'menu_search'|checkPermission}
                <form class="navbar-form pull-left" action="{$_root}/users/search">
                    <input type="text" class="span2" id="autocomplete" name="text" value={if isset($text)}{$text}{/if}>
                    <input type="hidden" id="id" name="id">
                    <button type="submit" class="btn">Поиск</button>
                </form>
            {/if}
        </div>
    </div>
</div>
{include file="protected/views/AutocompleteUser.tpl"}
{/block}


