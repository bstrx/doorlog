{block name="modal"}
    <div id="myModal" class="modal hide fade">
        <div class="modal-header">
          <button type="button" class="close"></button>
          <h3 id="myModalLabel">Подтверждение удаления</h3>
        </div>
        <div class="modal-body">
          <p>Вы действительно хотите удалить?</p>
        </div>
        <div class="modal-footer">
          <button class="btn btn-danger" type="submit" form="delete">Удалить</button>
          <button class="btn" data-dismiss="modal" aria-hidden="true">Отмена</button>
        </div>
    </div>

    <div id="notice" class="modal hide fade">
        <div class="modal-header">
          <button type="button" class="close"></button>
          <h3 id="myModalLabel">Ошибка</h3>
        </div>
        <div class="modal-body">
          <p>Отдел удалить невозможно, пока в отделе есть пользователи.</p>
        </div>
        <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Ok</button>
        </div>
    </div>
{/block}