{extends "protected/views/index.tpl"}

    {block name="content"}

    <script type="text/javascript">
        $(function() {
                var elements = $('.timer')
                elements.each( function() {
                    setDate(this)
                })

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
            var currentDate = new Date(unixtime * 1000);
            var h = currentDate.getHours(); // 0-24 format
            var m = currentDate.getMinutes();
            var s = currentDate.getSeconds();
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
    </script>

     <div class="span7">

         <div align=right class='right-calendar'>
             <form>
                 <input name="date" type="hidden" id="datepicker" /> <span>{$date|date_format:"%d.%m.%Y"}</span>
             </form>
         </div>
        <div class="tabbable">
            <ul class="nav nav-tabs" data-tabs="tabs">
                <li class="active"><a data-toggle="tab" href="#day">День</a></li>
                <li><a data-toggle="tab" href="#week">Неделя</a></li>
                <li><a data-toggle="tab" href="#month">Месяц</a></li>
            </ul>

            <div class="tab-content">
                {* Вкладка "День" *}
                <div class="tab-pane active" id="day">
                    {block name="menu"} {include file='protected/views/Main/day.tpl'} {/block}
                </div>

                {* Вкладка "Неделя" *}
                <div class="tab-pane" id="week">
                    {block name="menu"} {include file='protected/views/Main/week.tpl'} {/block}
                </div>

                {* Вкладка "Месяц" *}
                <div class="tab-pane" id="month">
                    {block name="menu"} {include file='protected/views/Main/month.tpl'} {/block}
                </div>
            </div>
        </div>
    </div>
    {/block}
{/extends}