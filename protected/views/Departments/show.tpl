{extends "protected/views/index.tpl"}

{block name="content"}
<div class="span7">
    <table class="table table-bordered">
        <th> Имя </th>
        <th> Должность </th>

        {foreach from=$department item=username}
            <tr>
                <td> {$username['name']} </td>
                <td> -todo- </td>
            </tr>
        {/foreach}
   </table>
{/block}

{/extends}