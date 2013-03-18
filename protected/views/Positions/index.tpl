{extends "protected/views/index.tpl"}

{block name="content"}
    <div class="span7">
        <table class="table table-bordered">
            <th> Должности </th>
            <th> Количество сотрудников </th>
            
            {foreach from=$positions item=position}
                <tr>
                    <td> {$position['name']} </td>
                    <td> {$position['total_position']}</td>
                    <td> <a href="{$_root}/positions/edit?id={$position['id']}">Редактировать</a></td>
                </tr>
            {/foreach}
        </table>
        <a href="{$_root}/positions/add">Добавить должность</a>
    </div>
{/block}

{/extends}