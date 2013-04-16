{extends "protected/views/index.tpl"}
{block name="javascript"}
<link href="{$_root}/assets/css/jquery.jqplot.min.css" rel="stylesheet" type="text/css">
<script src="{$_root}/assets/js/jquery.jqplot.min.js"></script>
<script src="{$_root}/assets/js/jqplot.canvasAxisLabelRenderer.min.js"></script>
<script src="{$_root}/assets/js/jqplot.canvasTextRenderer.min.js"></script>
<script src="{$_root}/assets/js/jqplot.canvasAxisLabelRenderer.min.js"></script>
<script src="{$_root}/assets/js/jqplot.highlighter.min.js"></script>
{/block}
{block name="pagetitle"}<h1>Загрузка офиса</h1>{/block}

{block name="content"}
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
            var plot1 = $.jqplot ('office-load', [{$stringForGraph}],{
            axesDefaults: {
                labelRenderer: $.jqplot.CanvasAxisLabelRenderer
                    },
             axes: {
                yaxis: {
                 label:"Кол-во входов",
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
            highlighter:{
            show: true,
            tooltipAxes: 'y'
            }});
            
        });
</script>
<div class="span9">
<div class='calendar' align="right">
  <form>
    <input type="hidden" name="date" id="datepicker">
    <span>{$date|date_format:"%d.%m.%Y"}</span>

  </form>
</div>

<div id="office-load"></div>
    <p>График отображает количество входов в офис в указанные часы.</p>
</div>
    
{/block}

{/extends}