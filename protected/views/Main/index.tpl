{extends "protected/views/index.tpl"}

    {block name="content"}

    <script type="text/javascript">
        $(function() {
                var elements = $('.timer');
                elements.each( function() {
                    setDate(this)
                });

                if (elements.length) {
                    setInterval( function() {
                        elements.each( function() {
                            setDate(this)
                        })
                    }, 1000);
                }
        });

        function setDate(element) {
            var unixtime = $(element).attr('data-unixtime') | 0;
            var h = Math.floor(unixtime / 3600);
            var m = Math.floor(unixtime % 3600 / 60);
            var s = Math.floor(unixtime % 3600 % 60);

            if (h < 10) h = '0' + h;
            if (m < 10) m = '0' + m;
            if (s < 10) s = '0' + s;

            $(element).text(h + ' ч ' + m + ' м ' + s + ' c');
            $(element).attr('data-unixtime', ++unixtime)
        }

        $(function() {
            $('#datepicker').datepicker({
                showOn: 'both',
                buttonImage: "assets/images/calendar.png",
                buttonImageOnly: true,
                dateFormat: "dd-mm-yy",
                autoSize: true,
                firstDay: 1,
                dayNamesMin: ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'],
                yearRange: "c-1:c",
                maxDate: "c",
                defaultDate: new Date('{$date}'),
                monthNames: ['Январь','Февраль','Март','Апрель','Май','Июнь', 'Июль','Август','Сентябрь','Октябрь','Ноябрь','Декабрь'],
                onSelect: function (dateText, inst) {
                    $(this).parent('form').submit();
                }
            });

            $('.right-calendar span').on('click', function () {
                $('#datepicker').datepicker("show");
            });
        });

        function setCookie(c_name,value)
            {
              var c_value=escape(value);
              document.cookie=c_name + "=" + c_value;
            }

        $(function() {
            $('#dayCol').on('click', function () {
                setCookie('col','day');
            });
            $('#weekCol').on('click', function () {
                setCookie('col','week')
            });
            $('#monthCol').on('click', function () {
                setCookie('col','month')
           });
        });
    </script>
     <div class="span7">

         <div align=right class='right-calendar'>
             <form>
                 <input name="date" type="hidden" id="datepicker" /> <span>{$date|date_format:"%d.%m.%Y"}</span>
             </form>
         </div>
        <div class="tabbable">
            <ul class="nav nav-tabs" data-tabs="tabs">
                <li
                    {if !isset($smarty.cookies.col) || $smarty.cookies.col==day}
                        class="active"
                    {/if}>
                    <a data-toggle="tab" href="#day" id="dayCol">День</a>
                </li>
                <li
                    {if $smarty.cookies.col==week}
                        class="active"
                    {/if}>
                    <a data-toggle="tab" href="#week" id="weekCol">Неделя</a>
                </li>
                <li
                    {if $smarty.cookies.col==month}
                        class="active"
                    {/if}>
                    <a data-toggle="tab" href="#month" id="monthCol">Месяц</a>
                </li>
            </ul>

            <div class="tab-content">
                {* Вкладка "День" *}
                <div {if !isset($smarty.cookies.col) || $smarty.cookies.col==day}
                         class="tab-pane active"
                     {else}
                         class="tab-pane"
                     {/if} id="day">
                    {include file="protected/views/Main/day.tpl"}
                </div>

                {* Вкладка "Неделя" *}
                <div {if $smarty.cookies.col==week}
                        class="tab-pane active"
                     {else}
                         class="tab-pane"
                     {/if} id="week">
                    {include file='protected/views/Main/week.tpl'}
                </div>

                {* Вкладка "Месяц" *}
                <div {if $smarty.cookies.col==month}
                         class="tab-pane active"
                     {else}
                         class="tab-pane"
                     {/if} id="month">
                    {include file='protected/views/Main/month.tpl'}
                </div>
            </div>
        </div>
    </div>
    {/block}
{/extends}