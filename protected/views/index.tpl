<!DOCTYPE html>
<html>
    <head>
        <title>{block name="title"}Учёт рабочего времени{/block}</title>
        <meta charset="utf-8">
        <meta name="description" content="Система учёта рабочего времени, v2">
        <link href="{$_root}/protected/vendor/twitter/bootstrap/docs/assets/css/bootstrap.css" rel="stylesheet">
        <link href="{$_root}/protected/vendor/twitter/bootstrap/docs/assets/css/bootstrap-responsive.css" rel="stylesheet">
        <link href="{$_root}/assets/css/main.css" rel="stylesheet" type="text/css">
        <link href="{$_root}/assets/images/i.ico" rel="icon" type="images/x-icon">
        <script src="{$_root}/assets/js/jquery-1.9.1.min.js"></script>
        <script src="{$_root}/protected/vendor/twitter/bootstrap/docs/assets/js/bootstrap.min.js"></script>
        <script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js" type="text/javascript" ></script>
        <link href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" rel="stylesheet"  />
    </head>
    <body>
        {block name="javascript"}{/block}

        {if $_user}
            {block name="menu"}{include file='protected/views/menu.tpl'}{/block}
        {/if}

        <div id="content">
            {block name="breadcrumbs"}{/block}
            {block name="pagetitle"}{/block}

            {block name="FlashMessages"}
                {if isset($_flashMessages)}
                    {foreach key=type item=messageArr from=$_flashMessages}
                        {foreach item=message from=$_flashMessages[$type]}
                            <div class='alert alert-{$type}'> {$message} </div>
                        {/foreach}
                    {/foreach}
                {/if}
            {/block}

            {block name="content"} {/block}
        </div>
    </body>
</html>
