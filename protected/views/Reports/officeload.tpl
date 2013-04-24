{extends "protected/views/index.tpl"}
{block name="javascript"}
<link href="{$_root}/assets/css/jquery.jqplot.min.css" rel="stylesheet" type="text/css">
<script src="{$_root}/assets/js/jquery.jqplot.min.js"></script>
<script src="{$_root}/assets/js/jqplot.canvasAxisLabelRenderer.min.js"></script>
<script src="{$_root}/assets/js/jqplot.canvasTextRenderer.min.js"></script>
<script src="{$_root}/assets/js/jqplot.canvasAxisLabelRenderer.min.js"></script>
<script src="{$_root}/assets/js/jqplot.highlighter.min.js"></script>
<script>
        $(function() {
            $('#datepicker').datepicker({
                showOn: 'both',
                buttonImage: "{$_root}/assets/images/calendar.png",
                buttonImageOnly: true,
                dateFormat: "yy-mm-dd",
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

            $('.calendar span').on('click', function () {
                $('#datepicker').datepicker("show");
            });
        });

        $(document).ready(function(){
            var plot1 = $.jqplot ('office-load', [{$stringForGraph},{$outStringForGraph}],{
            axesDefaults: {
                labelRenderer: $.jqplot.CanvasAxisLabelRenderer
                    },
             axes: {
                yaxis: {
                 label:"Кол-во входов и выходов",
                 padMin: 0
                 },
                 xaxis: {
                    label: "Время",
                    pad:0,
                    max:23,
                    min:0,
                    tickInterval: 1,
                    tickOptions: {
                    formatString: '%d'
                 }}
            },
            series:[
                { color: "#4bb2c5", label:"Входы"},
                { color: "#EAA228", label:"Выходы"}
            ],
            legend:{
                show: true,
                xoffset: 12,
                yoffset: 12
            },
            highlighter:{
            show: true,
            tooltipAxes: 'y'
            }});
        });
</script>
{/block}
{block name="title"} Загрузка офиса {/block}
{block name="pagetitle"}<h1>Загрузка офиса</h1>{/block}

{block name="breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="{$_root}/"> Главная </a> <span class="divider">/</span></li>
        <li class="active"> Отчет по загрузке </li>
    </ul>
{/block}

{block name="content"}
    <div class="span9">
        <div class='calendar' align="right">
            <form>
                <input type="hidden" name="date" id="datepicker">
                <span>{$date|date_format:"%d.%m.%Y"}</span>
            </form>
        </div>

        <div id="office-load"></div>
        <p>График отображает количество входов в офис и выходов из офиса в указанные часы.</p>
    </div>
{/block}

{/extends}