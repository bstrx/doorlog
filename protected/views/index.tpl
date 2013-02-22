<!DOCTYPE html>
<html>
    <head>
        <title>{block name="title"}Учёт рабочего времени{/block}</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8">
        <meta name="description" content="Система учёта рабочего времени, v2">
        <link href="/doorlog/protected/vendor/twitter/bootstrap/docs/assets/css/bootstrap.css" rel="stylesheet">
        <link href="/doorlog/protected/vendor/twitter/bootstrap/docs/assets/css/bootstrap-responsive.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/doorlog/css/main.css">
    </head>
    <body>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="/doorlog/protected/vendor/twitter/bootstrap/docs/assets/js/bootstrap.min.js"></script>

        {block name="javascript"}{/block}
        {block name="menu"}{include file='protected/views/menu.tpl'}{/block}
        {block name="FlashMessages"}
            {if isset($_flashMessages)}
                {foreach key=type item=messageArr from=$_flashMessages}
                    {foreach item=message from=$_flashMessages[$type]}                       
                        <div class='flash_{$type}'> {$message} </div>
                    {/foreach}
                {/foreach}
            {/if}
        {/block}
        {block name="search" }
        <div class="search" align="center">
             <form class="form-search">
                 <input type="text" class="input-medium search-query" width="350px">
                <button type="submit" class="btn">Найти</button>
            </form>
        </div>
        {/block}
        
        {block name="content"}
        {/block}
    </body>
</html>

