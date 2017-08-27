<!DOCTYPE html>
<html>
<head>
	<title>Union</title>
	<link href="css/aws.css" rel="stylesheet" type="text/css">
</head>
<body>
	<table class="list">
	@foreach($users as $un)
		<tr>
			<td>{{ $un -> role_id }} </td>
			<td>&nbsp;&nbsp;</td>
			<td>{{ $un -> name }} </td>
			<td>&nbsp;&nbsp;</td>
			<td>{{ $un -> email }} </td>
			<td>&nbsp;&nbsp;</td>
			<td>{{ $un -> created_at }}</td>
			<td>&nbsp;&nbsp;</td>
			<td>{{ $un -> updated_at }} </td>
		</tr>
	@endforeach
	</table>
</body>
</html>