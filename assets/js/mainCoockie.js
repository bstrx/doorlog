
function setCookie(c_name,value)
    {
      var c_value=escape(value);
      document.cookie=c_name + "=" + c_value;
    }

$(function() {
    $('#dayCol').on('click', function () {
        setCookie('col','day');
    });
    $('#weekCol').on('click', function () {
        setCookie('col','week')
    });
    $('#monthCol').on('click', function () {
        setCookie('col','month')
   });
});
