<!DOCTYPE html>
<html>
	<head>
		<title>회 원 목 록</title>
		<link href="css/aws.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<h1>회 원 목 록</h1>
		<table class="list">
			@foreach($users as $un)
			<tr>
				<td>{{ $un -> role_id }} </td>
				<td>{{ $un -> name }} </td>
				<td>{{ $un -> email }} </td>
				<td>{{ $un -> created_at }}</td>
				<td>{{ $un -> updated_at }} </td>
			</tr>
			@endforeach
		</table>
		<hr>
		<ul class="posi">{{ $users -> render() }}</ul>
	</body>
</html>