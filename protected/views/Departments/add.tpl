{extends "protected/views/index.tpl"}

{block name="content"}
    <div class="span7">
        <h1>Добавить отдел</h1>
        <form method='post' id="add-department">
            <input type="text" name="depName" placeholder="Название отдела">
        </form>
        <button type="submit" class="btn btn-success"  form="add-department"> Добавить </button>
        <a class="btn" href="{$_root}/departments">Отмена</a>
    </div>
{/block}

{/extends}