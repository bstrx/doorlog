$(function() {
    $( "#from" ).datepicker({
        monthNamesShort: ['Янв','Февр','Март','Апр','Май','Июнь', 'Июль','Авг','Сент','Окт','Нояб','Дек'],
        dayNamesMin: ['Вс','Пн','Вт','Ср','Чт','Пт','Сб'],
        defaultDate: "+1w",
        dateFormat: "dd-mm-yy",
        changeMonth: true,
        numberOfMonths: 1,
        onClose: function( selectedDate ) {
            $( "#to" ).datepicker( "option", "minDate", selectedDate );
        }
    });
    $( "#to" ).datepicker({
        monthNamesShort: ['Янв','Февр','Март','Апр','Май','Июнь', 'Июль','Авг','Сент','Окт','Нояб','Дек'],
        dayNamesMin: ['Вс','Пн','Вт','Ср','Чт','Пт','Сб'],
        defaultDate: "+1w",
        dateFormat: "dd-mm-yy",
        changeMonth: true,
        numberOfMonths: 1,
        onClose: function( selectedDate ) {
            $( "#from" ).datepicker( "option", "maxDate", selectedDate );
        }
    });
});

