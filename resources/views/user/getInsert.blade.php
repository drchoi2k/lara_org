	<!DOCTYPE html>
	<html>
	<head>
		<title>Insert</title>
		<style type="text/css">
			html, body{
				width: 600px;
				margin: 0 auto;
			}
			.container{
				background: #ddd;
				box-shadow: 0 0 10px gray;
			}
		</style>
	</head>
	<body>
		<div class="container">
		<form>
			<table>
				<tr>
					<td>Name</td>
					<td>
					<input type="text" name="name" id="name">
					</td>
				</tr>
				<tr>
				<td>Email</td>
				<td>
				<input type="email" name="email" id="email" >
				</td>
				</tr>
				<tr>
					<td>Role</td>
					<td>
						<select name="role_id" id="role_id">
							@foreach($roles as $role)
								<option value="{{ $role->id }}">{{ $role->name }}</option>
							@endforeach
							</select>
					</td>
				</tr>
			</table>
		</form>
			
		</div>		
	</body>
	</html>