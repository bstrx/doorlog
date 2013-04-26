$(function() {

    $('#datepicker').datepicker( {
        monthNamesShort: ['Янв','Февр','Март','Апр','Май','Июнь', 'Июль','Авг','Сент','Окт','Нояб','Дек'],
        yearRange: "c-2:",
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'mm.yy',
        closeText : "Готово",
        currentText: "Сегодня",
        maxDate: "defaultDate",
        onClose: function(dateText, inst) {
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            $(this).datepicker('setDate', new Date(year, month, 1));
        }
    });

    $('#ui-datepicker-div').addClass('disableDays');
});