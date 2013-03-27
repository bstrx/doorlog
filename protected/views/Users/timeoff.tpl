<script type="text/javascript">
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


</script>

<script>
           $(document).ready(function()
                   {
                          $('#delete').bind('click',function(){
                                if(confirm("действительно хотите удалить?")){
                                        return true;
                                  }
                                else{
                                        return false;
                                   }
                           });
            });
        </script>
<div>
    <h1> Добавить отгул </h1>

    <form method="POST" action='{$_root}/users/vacation'>
        <p>
            <input type="hidden" id="id" name="id" value='{$id}'/>
            <label for="from"> Выберите начало периода: </label>
            <input type="text" id="from" name="from" />
            <label for="to"> Выберите окончание периода: </label>
            <input type="text" id="to" name="to" />

            <label for="timeoff_type"> Тип: </label>
            <select id="timeoff_type" name = "vtype">
                {foreach from=$statuses item=stat}
                    <option value = "{$stat['status_id']}"> {$stat['status_name']} </option>
                {/foreach}
            </select>
        </p>

        <input type="submit" value="Добавить" name="submit" id="add" class="btn btn-success">
    </form>
</div>
