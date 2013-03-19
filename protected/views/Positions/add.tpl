{extends "protected/views/index.tpl"}

{block name="pagetitle"}<h1>Добавление должности</h1>{/block}

{block name="content"}
    <div class="span7">
        <form method='post' id="add-department">
            <input type="text" name="posName" placeholder="Название Должности">
            <button type="submit" class="btn"> Добавить </button>
        </form>
    </div>
{/block}

{/extends}