{extends "protected/views/index.tpl"}


{block name="content"}

            <div class="span6">
                <table class="table table-bordered">
                    <tr class="tbl-top"><td>Название отдела</td><td>Кол-во сотрудников</td><td>Начальник</td></tr>
                    <!--<tr><td>RU.pr</td><td></td><td></td></tr>-->
                    {foreach from=$departments item=department}
                    <tr><td>{$department['name']}</td><td>{$department['total_users']}</td><td>{$department['chief_name']}</td></tr>
                    {/foreach}
                    
                </table>
                <form method='post'>
                <input type="text" name="depName" id="dep_name" placeholder="Название отдела">
                <button type="submit" class="btn">Добавить</button>
                </form>
            </div>
{/block}
{/extends}