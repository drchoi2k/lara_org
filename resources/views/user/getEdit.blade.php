<!DOCTYPE html>
<html>
	<head>
		<title>Insert</title>
		<style type="text/css">
			html, body{
				width: 600px;
				margin: 0 auto;
				padding: 10px;
			}
			.container{
				background: #ddd;
				box-shadow: 0 0 10px gray;
			}
			h1 {
				margin: 15px 0 0 39px;
			}
			.btn{
				border: 1px solid;
				background: #888;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<h1> New User Edit </h1>
			<hr>
			<!-- <form action="{{ url('postUpdate', array($user->id)) }}" method="POST"> -->
			{!! Form::model($user,['url'=>['postUpdate',$user->id],'method'=>'POST'])!!}
			{{ csrf_field() }}
			<table>
				<tr>
					<td>Name</td>
					<td>
						<!-- <input type="text" name="name" id="name" value="{{ $user->name }}"> -->
						{!! Form::text('name',null,['id'=>'name'])!!}
					</td>
				</tr>
				<tr>
					<td>Email</td>
					<td>
						<!-- <input type="email" name="email" id="email" value="{{ $user->email }}"> -->
						{!!Form::email('email',null,['id'=>'email'])!!}
					</td>
				</tr>
				<tr>
					<td>Password</td>
					<td>
						<!-- <input type="password" name="password" id="password"> -->
						{!! Form::password('password',['placeholder'=>'password','id'=>'password'])!!}
					</td>
				</tr>
				<tr>
					<td>Role</td>
					<td>
						{!!Form::select('role_id',$roles, null)!!}
						<!-- <select name="role_id" id="role_id">
								<option value=""> </option>
								@foreach($roles as $role)
								<option value="{{ $role->id }}">{{ $role->name }}</option>
								@endforeach
						</select> -->
					</td>
				</tr>
			</table>
			<hr>
			{!! Form::submit('저  장', array('class'=>'btn btn-save'))!!}
			{!! Form::close()!!}
			
		</div>
	</body>
</html>