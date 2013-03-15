{extends "protected/views/index.tpl"}

{block name="content"}
    <div class="span7">
        <form method='post' id="add-department">
            <input type="text" name="depName" placeholder="Название отдела">
            <button type="submit" class="btn"> Добавить </button>
            <input value="Отмена" class="btn" onclick="location.href='/departments'" type="button">
        </form>
    </div>
{/block}

{/extends}