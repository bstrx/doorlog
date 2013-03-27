{extends "protected/views/index.tpl"}

{block name="pagetitle"}<h1>Добавить отдел</h1>{/block}

{block name="content"}
    <div class="span7">
        <form method='post' id="add-department">
            <input type="text" name="depName" placeholder="Название отдела">
        </form>
        <button type="submit" class="btn btn-success"  form="add-department"> Добавить </button>
        <a class="btn" href="{$_root}/departments">Отмена</a>
    </div>
{/block}

{block name="content"}
<div class="span7">
    <form method='post' id="add-positions">
        <input type="text" id="add-position" name="posName" placeholder="Название должности">
    </form>
    <button type="submit" id="success" class="btn btn-success" form="add-positions"> Добавить </button>
    <a class="btn" id="add-cancel" href="{$_root}/positions">Отмена</a>
</div>
{/block}

{/extends}