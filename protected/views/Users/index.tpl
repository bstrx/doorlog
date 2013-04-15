{extends "protected/views/index.tpl"}
    {block name="pagetitle"}<h1>Пользователи</h1>{/block}

    {block name="breadcrumbs"}
        <ul class="breadcrumb">
          <li><a href="{$_root}/"> Главная </a> <span class="divider">/</span></li>
          <li class="active"> Пользователи </li>
        </ul>
    {/block}

    {block name="content"}
        <div class='span10'>
            {if 'users_add'|checkPermission}
                <a href="{$_root}/users/manage">Добавить пользователя</a>
            {/if}
            <table class="table table-bordered">
                <thead>
                    <th>№</th>
                    <th>Имя</th>
                    <th>Email</th>
                    <th>Отдел</th>
                    <th>Должность</th>
                </thead>
                <tbody>
                    {$num=10*$currentPage-9}
                    {foreach from=$users item=user}
                        <tr>
                            <td>{$num}</td>
                            <td> <a href="{$_root}/users/show?id={$user['id']}"> {$user['name']} </a></td>
                            <td> {$user['email']} </td>
                            <td> {$user['department']} </td>
                            <td> {$user['position']} </td>
                        </tr>
                        {$num=$num+1}
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
                        {if $i==$currentPage}
                            <a id="checked" href="{$_root}/users?page={$i}">{$i}</a>
                        {else}
                            <a href="{$_root}/users?page={$i}">{$i}</a>
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