$(document).ready(function()
{
     $('#delete').bind('click',function(){
         return confirm("действительно хотите удалить?");
     });
});