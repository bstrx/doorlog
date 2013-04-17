$(function() {
    $('#datepicker').datepicker( {
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'mm.yy',
        closeText : "Готово",
        currentText: "Сегодня",
        onClose: function(dateText, inst) {
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            $(this).datepicker('setDate', new Date(year, month, 1));
        }
    });
    $('#ui-datepicker-div').addClass('disableDays');
});
$(document).ready(function () {
        $('#timeoff_autocomplete').keyup(function (e) {
            if((e.keyCode!=37) && (e.keyCode!=38) && (e.keyCode!=39) && (e.keyCode!=40) && (e.keyCode!=13)){
                $("#timeoff_autocomplete_id").val('');
            }
        });

    $("select#dep_id").find(":selected").val(0);
        $("select#type").change(function(){
            selectedVal = $(this).find(":selected").val();
            if (selectedVal == 2) {
                $("div#dep").show();
                $("div#user").hide();
                $("select#user_id").find(":selected").val(0);
            } else {
                $("div#user").show();
                $("div#dep").hide();
            }
        });
 });
$(function() {
        $("#timeoff_autocomplete").autocomplete({
            minLength: 3,
            source: function( request, response ) {
                $.ajax({
                    url: "{$_root}/users/autocomplete",
                    dataType: "json",
                    data:{
                        name:request.term
                    },

                    success: function(data) {
                        response($.map(data, function(item) {
                            return {
                                label:item.name,
                                id:item.id
                            };
                        }));
                    }
                });
            },
            select: function( event, ui ) {
                $("#timeoff_autocomplete_id").val(ui.item.id);
            },
            messages: {
                noResults: '',
                results: function() {
                }
            }
        });
    });
