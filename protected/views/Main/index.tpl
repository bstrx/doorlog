<!-- class='timer' data-unixtime="$period['exit']"-->
{extends "protected/views/index.tpl"}

    {block name="content"}

    <script type="text/javascript">
        $(
            function() {
                var elements = $('.timer')
                if (elements.length) {
                    setInterval( function() {
                        elements.each( function() {
                            setDate(this)
                        })
                    }, 1000);
                }
            }
        )

        function setDate(element) {
            var unixtime = $(element).attr('data-unixtime') | 0;
            var currentDate = new Date(unixtime * 1000);
            var h = currentDate.getHours(); // 0-24 format
            var m = currentDate.getMinutes();
            var s = currentDate.getSeconds();
            $(element).text(h + ':' + m + ':' + s);
            $(element).attr('data-unixtime', ++unixtime)
        }
    </script>

    <div class="span7">
        <div class="tabbable">
            <ul class="nav nav-tabs" data-tabs="tabs">
                <li class="active"><a data-toggle="tab" href="#day">День</a></li>
                <li><a data-toggle="tab" href="#week">Неделя</a></li>
                <li><a data-toggle="tab" href="#month">Месяц</a></li>
            </ul>

            <div class="tab-content">
                <!-- Вкладка "День" -->
                <div class="tab-pane active" id="day">
                    {block name="menu"} {include file='protected/views/Main/day.tpl'} {/block}
                </div>

                <!-- Вкладка "Неделя" -->
                <div class="tab-pane" id="week">
                    {block name="menu"} {include file='protected/views/Main/week.tpl'} {/block}
                </div>

                <!--Вкладка "Месяц"-->
                <div class="tab-pane" id="month">
                    {block name="menu"} {include file='protected/views/Main/month.tpl'} {/block}
                </div>
            </div>
        </div>
    </div>
    {/block}
{/extends}