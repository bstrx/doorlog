{extends "protected/views/index.tpl"}

{block name="content"}
    <div class="span7">
        <h1>Добавить отдел</h1>
        <form method='post' id="add-department">
            <input type="text" name="depName" id="add-dep-label" placeholder="Название отдела">
            <br>
            <br>
            <button type="submit" class="btn btn-success" id="add-dep"> Добавить </button>
            <a class="btn" href="{$_root}/departments" id="add-dep-cancel">Отмена</a>
        </form>
    </div>
{/block}

{/extends}