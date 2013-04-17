{block name="javascript"}
    <script src="{$_root}/assets/js/userTimeOff.js"></script>
{/block}
<div>
    <h3> Добавить отгул </h3>

    <form method="POST" action='{$_root}/users/vacation'>
            <input type="hidden" id="id" name="id" value='{$id}'/>
            <label for="from"> Выберите начало периода: </label>
            <input type="text" id="from" name="from" />
            <label for="to"> Выберите окончание периода: </label>
            <input type="text" id="to" name="to" />

            <label for="timeoff_type"> Тип: </label>
            <select id="timeoff_type" name = "vtype">
                {foreach from=$statuses item=stat}
                    <option value = "{$stat['id']}"> {$stat['name']} </option>
                {/foreach}
            </select>
        <br>
        <input type="submit" value="Добавить" name="submit" id="add" class="btn btn-success">
    </form>
</div>
