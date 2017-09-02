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
			.alert-danger{
				color: red;
				margin: 0 0 0 25px;
			}

		</style>
	</head>
	<body>
		<div class="container">
			<h1> New User Insert </h1>
			<!-- @if ($errors->any())
				<div class="alert-danger">
					<ul>
						@foreach ($errors->all() as $error)
						<li>{{ $error }}</li>
						@endforeach
					</ul>
				</div>
				@endif -->
			
			
			<hr>
			
			{!! Form::open() !!}

			{!! Form::close() !!}

			<form action="{{ url('postInsert') }}" method="POST">
				{{ csrf_field() }}
				<table>
					<tr>
						<td>이 름</td>
						<td>
							<input type="text" name="name" id="name" value="{{ old('name') }}">
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<input type="email" name="email" id="email">
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<input type="password" name="password" id="password">
						</td>
					</tr>
					<tr>
						<td>직 책</td>
						<td>
							<select name="role_id" id="role_id">
								<option value=""> </option>
								@foreach($roles as $role)
								<option value="{{ $role->id }}">{{ $role->name }}</option>
								@endforeach
							</select>
						</td>
					</tr>
				</table>
				<td>
					<hr>
					<input type="submit" name="submit">
				</td>
				<hr>
			</form>
			
		</div>
	</body>
</html>