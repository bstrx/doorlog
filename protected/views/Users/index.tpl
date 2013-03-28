{extends "protected/views/index.tpl"}
    {block name="pagetitle"}<h1>Пользователи</h1>{/block}

    {block name="content"}

        <div class='span7'>
            <a href="{$_root}/users/add">Добавить пользователя</a>
            <table class="table table-bordered">
                <thead>
                    <th>Имя</th>
                    <th>Email</th>
                    <th>Отдел</th>
                    <th>Должность</th>
                </thead>
                <tbody>
                    {foreach from=$users item=user}
                        <tr>
                            <td> <a href="{$_root}/users/show?id={$user['id']}"> {$user['name']} </a></td>
                            <td> {$user['email']} </td>
                            <td> {$user['department']} </td>
                            <td> {$user['position']} </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
            {if $pagesCount !=1}
                {if $currentPage<=$pagesCount }
                <div class="pagination">
                <form>
                    <ul>
                    {for $i=1 to $pagesCount}
                    <li>
                        {if $i!=$currentPage}
                            <a href="{$_root}/users?page={$i}">{$i}</a>
                        {else}
                            <a id="checked" href="{$_root}/users?page={$i}">{$i}</a>
                        {/if}
                    </li>
                    {/for}
                    </ul>
                </form>
                </div>
                {else}
                    <div class="alert alert-error">
                    <p> Пользователей не обнаружено! </p>
                    </div>
                {/if}
           {/if}
        </div>
    {/block}

{/extends}