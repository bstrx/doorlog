{extends "protected/views/index.tpl"}

{block name="content"}
    <div class="span7">
        <form method='post' id="add-position">
            <input type="text" name="posName" placeholder="Название Должности">
            <button type="submit" class="btn"> Добавить </button>
        </form>
    </div>
{/block}

{/extends}