<script>
        $(function() {
        $("#autocomplete").autocomplete({
            minLength: 3,
            delay: 600,
            source: function( request, response ) {
                $.ajax({
                    url: "{$_root}/users/autocomplete",
                    dataType: "json",
                    data:{
                        name:request.term
                    },

                    success: function(data) {
                        response($.map(data, function(item) {
                            if (typeof(item.dep) == 'string')  item.dep = " | " + item.dep;
                                else item.dep = '';
                            if (typeof(item.pos) == 'string')  item.pos = " | " + item.pos;
                                else item.pos = '';
                            return {
                                label: item.name + item.dep + item.pos,
                                id:item.id
                            };
                        }));
                    }
                });
            },
            select: function( event, ui ) {
                $("#id").val(ui.item.id);
            },
            messages: {
                noResults: '',
                results: function() {
                }
            }
        });
    });

    $(document).ready(function () {
        $('#autocomplete').keyup(function (e) {
            if((e.keyCode!=37) && (e.keyCode!=38) && (e.keyCode!=39) && (e.keyCode!=40) && (e.keyCode!=13)){
                $("#id").val('');
            }
        });
    });
</script>