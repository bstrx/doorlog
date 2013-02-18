{extends "protected/views/index.tpl"}
{block name="content"}
            <div class="span6">
                <table class="table table-bordered" style="">
                    <tr><td>ФИО</td><td>Гаврилюк Евгений Валентинович</td></tr>
                    <tr><td>Статус</td><td>В стакане</td></tr>
                    <tr class="error"><td>Отработано за неделю</td><td>40</td></tr>
                    <tr class="error"><td>Отработано за день</td><td>8</td></tr>
                    <tr class="error"><td>Отработано за месяц</td><td>160</td></tr>

                </table>
            </div>
            <div class="span6">
                <table class="table table-bordered">
                    <tr><td></td><td>День</td><td>Неделя</td><td>Месяц</td></tr>
                    <tr><td>Пришел</td><td></td><td></td><td></td></tr>
                    <tr ><td>Ушел</td><td></td><td></td><td></td></tr>
                    <tr ><td>Статус</td><td></td><td></td><td></td></tr>
                    <tr ><td>Отработано:</td><td></td><td></td><td></td></tr>
                </table>
            </div>
{/block}
{/extends}