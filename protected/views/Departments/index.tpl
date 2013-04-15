{extends "protected/views/index.tpl"}

{block name="breadcrumbs"}
    <ul class="breadcrumb">
      <li><a href="{$_root}/"> Главная </a> <span class="divider">/</span></li>
      <li class="active"> Отделы </li>
    </ul>
{/block}

{block name="pagetitle"}<h1>Отделы</h1>{/block}

{block name="content"}
    <div class="span7">
        <table class="table table-bordered">
            <colgroup>
                <col class="col-large">
                <col class="col-small">
            </colgroup>
            <th> Название отдела </th>
            <th> Сотрудников </th>
            <th> Начальник </th>

            {foreach from=$departments item=department}
                <tr>
                    <td><a href="{$_root}/departments/edit?id={$department['id']}">{$department['name']}</a></td>
                    <td> {$department['total_users']} </td>
                    <td> {$department['chief_name']} </td>
                </tr>
            {/foreach}
        </table>
    </div>
    <div class="span4 additional">
        {include file='protected/views/Departments/add.tpl'}
    </div>
{/block}

{/extends}