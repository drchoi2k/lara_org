<!DOCTYPE html>
<html>
	<head>
		<title>Test jquery</title>
		{!!Html::style('css/app.css')!!}
		{!!Html::script('js/app.js')!!}
	</head>
	<body>
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-heading">Test jquery</div>
				<div class="panel-body">
					{!!Form::open([''])!!}
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								{!!Form::label('name','Name') !!}
								{!!Form::text('name', null,['id'=>'name','class'=>'form-control']) !!}
							</div>
						</div>
					</div>
					<div class="row">
					<div class="col-md-5">
							<div class="form-group">
								{!!Form::label('email','Email') !!}
								{!!Form::email('email', null,['id'=>'email','class'=>'form-control']) !!}
							</div>
						</div>
					</div>
					<div class="row">
					<div class="col-md-3">
							<div class="form-group">
								{!!Form::label('password','Password') !!}
								{!!Form::password('password',['id'=>'password','class'=>'form-control']) !!}
							</div>
						</div>
					</div>
					<div class="row">
					<div class="col-md-3">
							<div class="form-group">
								{!!Form::select('role_id',$roles,null,['id'=>'role_id','class'=>'form-control']) !!}
							
							</div>
						</div>
					</div>

					{!!Form::close()!!}
				</div>
			</div>
		</div>
	</body>
</html>