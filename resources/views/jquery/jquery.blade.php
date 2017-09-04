<!DOCTYPE html>
<html>
	<head>
	<meta name="csrf-token" content="{{ csrf_token() }}">
		<title>Test jquery</title>
		{!!Html::style('css/app.css')!!}
		{!!Html::script('js/app.js')!!}
		<style type="text/css">
			tbody tr:first-child{
				background: #ddd;
				font-weight: : bold;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-heading">제 이 쿼 리</div>
				<div class="panel-body">
					{!!Form::open(['url'=>'postJquery', 'method'=>'POST', 'id'=>'frm-insert'])!!}
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
				<div class="table-responsive">
					
				</div>
			</div>
		</div>
		<script type="text/javascript">

		$(document).ready(function(){
			$.ajaxSetup({
			headers: {
					'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
					}
				});
			});

			$('#frm-insert').on('submit',function(e){
				e.preventDefault();
				var url = $(this).attr('action');
				var post = $(this).attr('method');
				var data = $(this).serialize();
				$.ajax({
					type : post,
					url  : url,
					data : data,
					success:function(data)
					{
					console.log(data);
						// alert(data.msg);
					}
				})
			});
			$(document).on('click','.btn-dell',function(e){
				var id = $(this).val();
				$.ajax({
					type : 'post',
					url  : "{{ url('deleteByAjax')}}",
					data : {id:id},
					dataType : 'json',
					success:function(data)
					{
						$('tbody tr.id'+id).remove();
					}
				})
			})
			//-----------------------------------------
			readByAjax();
			//-----------------------------------------
			function readByAjax()
			{
				$.ajax({
					type : 'get',
					url  :"{{ url('readByAjax')}}",
					dataType : 'html',
					success:function(data)
					{
						$('.table-responsive').html(data);
					}
				})
			}


			</script>
	</body>
</html>