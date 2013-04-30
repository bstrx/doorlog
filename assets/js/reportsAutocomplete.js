$(document).ready(function () {
	if ($("select#type").val() == 2) {
		$("div#dep").show();
        $("div#user").hide();
        $("select#user_id").find(":selected").val(0);
	}
        $("select#type").change(function(){
            selectedVal = $(this).find(":selected").val();
            if (selectedVal == 2) {
                $("div#dep").show();
                $("div#user").hide();
                $("select#user_id").find(":selected").val(0);
            } else {
                $("div#user").show();
                $("div#dep").hide();
                $("select#dep_id").find(":selected").val(0);
            }
        });
});
