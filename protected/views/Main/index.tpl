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
                    <div align=right>{$date|date_format:"%d-%m-%Y"}</div>
                    <table class="table table-bordered">
                        <th>Вход</th>
                        <th>Выход</th>
                        <th>Время в офисе</th>
                        {if ($day && $day['periods'])}
                            {foreach from=$day['periods'] item=period}
                                <tr>
                                    <td> {$period['enter']|date_format:"%H:%M"}</td>
                                    {if ($period['enter']|date_format:"%D" == $period['exit']|date_format:"%D")}
                                        <td> {$period['exit']|date_format:"%H:%M"} </td>
                                    {else}
                                        <td> {$period['exit']|date_format:"%H:%M (%D)"} </td>
                                    {/if}
                                    <td>
                                        {$period['diff']|formatDate}
                                    </td>

                                </tr>
                            {/foreach}
                            <tr>
                                <td colspan=2>Всего</td>
                                <td>
                                    {$day['sum']|formatDate}
                                </td>
                            </tr>
                        {else}
                            <tr>
                                <td  colspan=3>
                                    <div align=center>
                                        В этот день посещений не было
                                    </div>
                                </td>
                            </tr>
                        {/if}
                    </table>
                </div>

                <!-- Вкладка "Неделя" -->
                <div class="tab-pane" id="week">
                    <table class="table table-bordered">
                        <th>День</th>
                        <th>Время в офисе</th>

                        {if isset($week['days'])}
                            {foreach from=$week['days'] key=date item=singleDay}
                                <tr>
                                    <td colspan>{$date|date_format:"%d/%m/%Y"}</td>
                                    <td> {$singleDay['sum']|formatDate} </td>
                                </tr>
                            {/foreach}

                            <tr>
                                <td> Всего </td>
                                <td> {$week['total_sum']|formatDate} </td>
                            </tr>
                        {else}
                            <tr>
                                <td  colspan=2>
                                    <div align=center>
                                        На этой неделе посещений не было
                                    </div>
                                </td>
                            </tr>
                        {/if}
                    </table>
                </div>


                <!--Вкладка "Месяц"-->
                <div class="tab-pane" id="month">
                    <table class="table table-bordered">
                    <tr>
                        <td> Всего</td>
                        <td> {$month['total_sum']|formatDate} </td>
                    </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    {/block}
{/extends}