$(function() {
  $( "#datepicker" ).datepicker({
    changeMonth: true,
    changeYear: true,
    yearRange: "-80:-16",
    dateFormat: 'dd.mm.yy',
    defaultDate: '-16y'
  });
});