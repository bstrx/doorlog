{extends "protected/views/index.tpl"}
{block name="content"}
    <div class="span7">
        <form method='POST' id="edit-position">
            <input type="text" name="position" value="{$position['name']}">
            <button type="submit" class="btn"> Изменить </button>
            <a href="{$_root}/positions" class="btn">Отмена</a>
        </form>
        <form action="{$_root}/positions/delete" method='POST' id="delete-position">
            <input type="hidden" name="id" value="{$position['id']}">
            <button type="submit" class="btn"> Удалить </button>
        </form>
    </div>
{/block}
{/extends}