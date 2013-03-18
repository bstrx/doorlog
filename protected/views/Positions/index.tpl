{extends "protected/views/index.tpl"}

{block name="pagetitle"}<h1>Должности</h1>{/block}

{block name="content"}
    <div class="span7">
        <a href="{$_root}/positions/add">Добавить должность</a>
        <table class="table table-bordered">
            <colgroup>
                <col class="col-small">
            </colgroup>
            <thead>
                <th> Название </th>
                <th> Количество сотрудников </th>
            </thead>
            <tbody>
                {foreach from=$positions item=position}
                    <tr>
                        <td> {$position['name']} </td>
                        <td> {$position['total_position']}</td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
{/block}

{/extends}