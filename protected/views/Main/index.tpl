{extends "protected/views/index.tpl"}

    {block name="content"}
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
                    <table class="table table-bordered">
                        <th>Вход</th>
                        <th>Выход</th>
                        <th>Время в офисе</th>
                        {if ($day && $day['periods'])}
                            {foreach from=$day['periods'] item=period}
                                <tr>
                                    <td> {$period['enter']|date_format:"%H:%M"}</td>
                                    <td> {$period['exit']|date_format:"%H:%M"} </td>
                                    <td> {$period['diff']|date_format:"%H:%M"} </td>
                                </tr>
                            {/foreach}
                            <tr>
                                <td colspan=2>Всего</td>
                                <td><b>{$day['sum']|date_format:"%H:%M"}</b></td>
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

                        {foreach from=$week['days'] key=date item=singleDay}
                            <tr>
                                <td colspan>{$date}</td>
                                <td> <b>{$singleDay['sum']|date_format:"%H:%M"}</b></td>
                            </tr>
                        {/foreach}
                        <tr>
                            <td> Всего</td>
                            <td> <b>{$singleDay['sum']|date_format:"%d %H:%M"}</b></td>
                        </tr>
                    </table>
                </div>

                <!-- Вкладка "Месяц" -->
                <div class="tab-pane" id="month">
                    <table class="table table-bordered">

                    <th>День</th>
                    <th>Время в офисе</th>

                    {foreach from=$month['days'] key=dayDate item=singleDay}
                        <tr>
                            <td>{$dayDate}</td>
                            <td> {$singleDay['sum']|date_format:"%H:%M"}</td>
                        </tr>
                    {/foreach}
                    <tr>
                        <td> Всего</td>
                        <td>

                            {math equation="round(x / 3600)" x=$month['total_sum']} ч.
                            {math equation="round(x % 3600 / 60)" x=$month['total_sum']} м.
                        </td>
                    </tr>
                    </table>
                </div>
            </div>
        </div>
        </div>
    {/block}

{/extends}