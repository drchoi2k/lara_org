 <div class="modal fade" id="popup-update" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">

        <div class="panel-body">
          {!!Form::open(['url'=>'#', 'method'=>'POST', 'id'=>'frm-update'])!!}
          <div class="row">
            <div class="col-md-3">
              <div class="form-group">
                {!!Form::label('name','Name')!!}
                {!!Form::text('name', null,['id'=>'name','class'=>'form-control'])!!}
              </div>
            </div>
            <div class="col-md-5">
              <div class="form-group">
                {!!Form::label('email','Email')!!}
                {!!Form::email('email', null,['id'=>'email','class'=>'form-control'])!!}
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group">
                {!!Form::label('password','Password')!!}
                {!!Form::password('password',['id'=>'password','class'=>'form-control'])!!}
              </div>
            </div>
            <div class="col-md-2">
              <div class="form-group">
                {!!Form::label('role','Role')!!}
                {!!Form::select('role_id',$roles,null,['id'=>'role_id','class'=>'form-control role-id'])!!}
              </div>
            </div>
          </div>
          
          <div class="row">
          <div class="col-md-5">
          <hr>
          {!!Form::submit('Save',['class'=>'btn btn-primary'])!!}
          </div>
          </div>
        {!!Form::close()!!}
        </div>


        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>