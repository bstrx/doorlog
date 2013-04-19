{extends "protected/views/index.tpl"}

<title>{block name="title"}Должности{/block}</title>

{block name="breadcrumbs"}
    <ul class="breadcrumb">
      <li><a href="{$_root}/"> Главная </a> <span class="divider">/</span></li>
      <li class="active"> Должности </li>
    </ul>
{/block}

{block name="pagetitle"}<h1>Должности</h1>{/block}

{block name="content"}
    <div class="span7">
        <table class="table table-bordered">
            <colgroup>
                <col class="col-large">
                <col class="col-small">
            </colgroup>
            <thead>
                <th> Название </th>
                <th> Сотрудников </th>
            </thead>
            <tbody>
                {foreach from=$positions item=position}
                    <tr>
                        <td> <a href="{$_root}/positions/edit?id={$position['id']}"> {$position['name']} </a></td>
                        <td> {$position['total_position']}</td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
    <div class="span4 additional">
        {include file='protected/views/Positions/add.tpl'}
    </div>
{/block}

{/extends}