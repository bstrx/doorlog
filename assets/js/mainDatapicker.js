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