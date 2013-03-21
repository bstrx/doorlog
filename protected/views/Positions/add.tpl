{extends "protected/views/index.tpl"}

{block name="pagetitle"}<h1>Добавить должность</h1>{/block}

{block name="content"}
    <div class="span7">
        <form method='post' id="add-positions">
            <input type="text" id="add-position" name="posName" placeholder="Название должности">
            <button type="submit" id="success" class="btn btn-success"> Добавить </button>
        </form>
        <a class="btn" id="add-cancel" href="{$_root}/positions">Отмена</a>
    </div>
{/block}

{/extends}