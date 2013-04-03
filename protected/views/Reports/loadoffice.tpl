{extends "protected/views/index.tpl"}
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
            var plot1 = $.jqplot ('office-load', [{$stringForGraph}]);
        });
</script>
<div class='calendar'>
  <form>
    <input type="hidden" name="date" id="datepicker">
    <span>{$date|date_format:"%d.%m.%Y"}</span>

  </form>
</div>

<div id="office-load"></div>
    
{/block}

{/extends}