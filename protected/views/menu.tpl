{block name="main_menu"}
<div class="navbar">
    <div class="navbar-inner">
        <div class="container">
            <ul class="nav">
                <li>
                    <a href="{$_root}/">Главная</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
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
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        Отчёты <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><s>По себе</s></a></li>
                        <li><a href="#"><s>Графический</s></a></li>
                        <li><a href="{$_root}/reports/timeoffs">По отгулам</a></li>
                        <li><a href="#"><s>По отделам</s></a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        Настройки <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="{$_root}/departments">Отделы</a></li>
                        <li><a href="{$_root}/roles">Права доступа</a></li>
                        <li><a href="{$_root}/users">Пользователи</a></li>
                        <li><a href="{$_root}/positions">Должности</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav pull-right">
                <li><a href="{$_root}/users/logout">Выйти</a></li>
            </ul>

            <form class="navbar-form pull-left" action="{$_root}/users/search">
                <input type="text" class="span2" id="autocomplete" name="text" value={if isset($text)}{$text}{/if}>
                <input type="hidden" id="id" name="id">
                <button type="submit" class="btn">Поиск</button>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function() {
        $("#autocomplete").autocomplete({
            minLength: 3,
            delay: 600,
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
                                label:item.name + " | " + item.dep + " | " + item.pos,
                                id:item.id
                            };
                        }));
                    }
                });
            },
            select: function( event, ui ) {
                $("#id").val(ui.item.id);
            },
            messages: {
                noResults: '',
                results: function() {
                }
            }
        });
    });
    $(document).ready(function () {
        $('#autocomplete').keyup(function (e) {
            if((e.keyCode!=37) && (e.keyCode!=38) && (e.keyCode!=39) && (e.keyCode!=40) && (e.keyCode!=13)){
                $("#id").val('');
            }
        });
    });
</script>
{/block}


