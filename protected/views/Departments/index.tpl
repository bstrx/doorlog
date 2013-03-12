{extends "protected/views/index.tpl"}

{block name="content"}
    <div class="span7">
        <table class="table table-bordered">
            <th> Название отдела </th>
            <th> Кол-во сотрудников </th>
            <th> Начальник </th>

            {foreach from=$departments item=department}
                <tr>
                    <td> {$department['name']} </td>
                    <td> {$department['total_users']} </td>
                    <td> {$department['chief_name']} </td>
                </tr>
            {/foreach}
        </table>

        <form method='post' id="add-department">
            <input type="text" name="depName" placeholder="Название отдела">
            <button type="submit" class="btn"> Добавить </button>
        </form>
    </div>
{/block}

{/extends}