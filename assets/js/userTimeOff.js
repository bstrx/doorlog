$(function() {
    $( "#from" ).datepicker({
        defaultDate: "+1w",
        dateFormat: "dd-mm-yy",
        changeMonth: true,
        numberOfMonths: 1,
        onClose: function( selectedDate ) {
            $( "#to" ).datepicker( "option", "minDate", selectedDate );
        }
    });
    $( "#to" ).datepicker({
        defaultDate: "+1w",
        dateFormat: "dd-mm-yy",
        changeMonth: true,
        numberOfMonths: 1,
        onClose: function( selectedDate ) {
            $( "#from" ).datepicker( "option", "maxDate", selectedDate );
        }
    });
});
$(document).ready(function()
{
     $('#delete').bind('click',function(){
         return confirm("действительно хотите удалить?");
     });
});
