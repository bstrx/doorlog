{extends "protected/views/index.tpl"}

{block name="content"}
    <div class="span7">
        <form method='post' id="add-department">
            <input type="text" name="depName" placeholder="Название отдела">
            <button type="submit" class="btn"> Добавить </button>
            <a class="btn" href="{$_root}/departments">Отмена</a>
        </form>
    </div>
{/block}

{/extends}