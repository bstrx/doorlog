<!DOCTYPE html>
<html>
    <head>
        <title>{block name="title"}Учёт рабочего времени{/block}</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8">
        <meta name="description" content="Система учёта рабочего времени, v2">
        <link href="/savage21/protected/vendor/twitter/bootstrap/docs/assets/css/bootstrap.css" rel="stylesheet">
        <link href="/savage21/protected/vendor/twitter/bootstrap/docs/assets/css/bootstrap-responsive.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/savage21/css/main.css">
        <link rel="icon" href="/savage21/images/logout.ico" type="images/x-icon">
    </head>
    <body>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="/savage21/protected/vendor/twitter/bootstrap/docs/assets/js/bootstrap.min.js"></script>

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
        {block name="content"} {/block}
    </body>
</html>

