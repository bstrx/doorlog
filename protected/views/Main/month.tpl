{*<div align=right>{$date|date_format:"%m-%Y"}</div>*}

<table class="table table-bordered">
    <colgroup>
        <col class="col-large">
    </colgroup>
    <tbody>
        <tr>
            <td> Всего </td>
            <td>
                {$month['total_sum']|formatDate}
            </td>
        </tr>
    </tbody>
</table>