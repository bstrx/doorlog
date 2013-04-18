{extends "protected/views/index.tpl"}
{block name="javascript"}
    <script src="{$_root}/assets/js/mainIndex.js"></script>
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
                {if isset($smarty.cookies.col)}
                <li
                    {if $smarty.cookies.col==day}
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
                {else}
                <li class="active">
                    <a data-toggle="tab" href="#day" id="dayCol">День</a>
                </li>
                <li>
                    <a data-toggle="tab" href="#week" id="weekCol">Неделя</a>
                </li>
                <li>
                    <a data-toggle="tab" href="#month" id="monthCol">Месяц</a>
                </li>
                {/if}

            </ul>

            <div class="tab-content">
                {if isset($smarty.cookies.col)}
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
                {else}
                {* Вкладка "День" *}
                <div class="tab-pane active" id="day">
                    {include file="protected/views/Main/day.tpl"}
                </div>

                {* Вкладка "Неделя" *}
                <div class="tab-pane" id="week">
                    {include file='protected/views/Main/week.tpl'}
                </div>

                {* Вкладка "Месяц" *}
                <div class="tab-pane" id="month">
                    {include file='protected/views/Main/month.tpl'}
                </div>

                {/if}
            </div>
        </div>
    </div>
    {/block}
{/extends}
