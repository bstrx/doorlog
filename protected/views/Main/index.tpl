{extends "protected/views/index.tpl"}
<title>{block name="title"}Главная{/block}</title>
{block name="javascript"}
    <script src="{$_root}/assets/js/mainIndex.js"></script>
    <script src="{$_root}/assets/js/mainDatepicker.js"></script>
    <script src="{$_root}/assets/js/mainCookie.js"></script>
{/block}

    {block name="content"}
     <div class="span7">

         <div align=right class='right-calendar'>
             <form>
                 <input name="date" type="hidden" id="datepicker" /> <span>{$date|date_format:"%d.%m.%Y"}</span>
             </form>
         </div>
        <div class="tabbable">
            <ul class="nav nav-tabs" data-tabs="tabs">
                <li class='{$currentTab["day"]}'>
                    <a data-toggle="tab" href="#day" id="dayCol">День</a>
                </li>
                <li class='{$currentTab["week"]}'>
                    <a data-toggle="tab" href="#week" id="weekCol">Неделя</a>
                </li>
                <li class='{$currentTab["month"]}'>
                    <a data-toggle="tab" href="#month" id="monthCol">Месяц</a>
                </li>
            </ul>
                <div class="tab-content">
                {* Вкладка "День" *}
                <div class="tab-pane {$currentTab["day"]}" id="day">
                    {include file="protected/views/Main/day.tpl"}
                </div>

                {* Вкладка "Неделя" *}
                <div class="tab-pane {$currentTab["week"]}" id="week">
                    {include file='protected/views/Main/week.tpl'}
                </div>

                {* Вкладка "Месяц" *}
                <div class="tab-pane {$currentTab["month"]}" class="tab-pane" id="month">
                    {include file='protected/views/Main/month.tpl'}
                </div>
                </div>
        </div>
    </div>
    {/block}
{/extends}
