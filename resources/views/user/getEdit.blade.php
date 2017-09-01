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
		</style>
	</head>
	<body>
		<div class="container">
			<h1> New User Edit </h1>
			<hr>
			<form action="{{ url('postUpdate', array($user->id)) }}" method="POST">
				{{ csrf_field() }}
				<table>
					<tr>
						<td>Name</td>
						<td>
							<input type="text" name="name" id="name" value="{{ $user->name }}">
						</td>
					</tr>
					<tr>
						<td>Email</td>
						<td>
							<input type="email" name="email" id="email" value="{{ $user->email }}">
						</td>
					</tr>
					<tr>
						<td>Password</td>
						<td>
							<input type="password" name="password" id="password">
						</td>
					</tr>
					<tr>
						<td>Role</td>
						<td>
							<select name="role_id" id="role_id">
								@foreach($roles as $role)
								<option value="{{ $role->id }}" {{ $user->role_id == $role->id ? 'selected': null}}>{{ $role->name }}</option>
								@endforeach
							</select>
						</td>
					</tr>
				</table>
				<td>
					<hr>
					<input type="submit" name="submit">
				</td>
			</form>
		</div>
	</body>
</html>