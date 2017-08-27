<!DOCTYPE html>
<html>
<head>
	<title>Union</title>
</head>
<body>
	<table>
	@foreach($union as $un)
		<tr>
			<td>{{ $un -> name }} </td>
		</tr>
	@endforeach
	</table>
</body>
</html>