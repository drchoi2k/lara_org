<!DOCTYPE html>
<html>
	<head>
		<title>XE db VIEW</title>
		<link href="css/aws.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<h1>DataBase 목 록</h1>
		<table class="list">
			@foreach($dbdata as $un)
			<tr>
				<td>{{ $un -> menu_item_srl }} </td>
				<td>{{ $un -> parent_srl }} </td>
				<td>{{ $un -> menu_srl }} </td>
				<td>{{ $un -> name }} </td>
				<td>{{ $un -> desc }} </td>
				<td>{{ $un -> url }} </td>
				<td>{{ $un -> listorder }} </td>
				










			</tr>
			@endforeach
		</table>
		<hr>
		<ul class="posi">{{ $dbdata -> render() }}</ul>
	</body>
</html>