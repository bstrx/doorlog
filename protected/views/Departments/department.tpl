{extends "protected/views/index.tpl"}

{block name="content"}
<div class="span6">
   <table class="table table-bordered">
     <tr class="tbl-top"><td>Фамилия и имя</td><td></td><td></td></tr>
     {foreach from=$department item=username}
     <tr><td>{$username['name']}</td><td></td><td></td></tr>
     {/foreach}
     <tr><td></td><td></td><td></td></tr>
   </table>
{/block}
{/extends}