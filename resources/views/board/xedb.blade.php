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
				<td>{{ $un -> file_srl }} </td>
				<td>{{ $un -> upload_target_srl }} </td>
				<td>{{ $un -> upload_target_type }} </td>
				<td>{{ $un -> sid }} </td>
				<td>{{ $un -> module_srl}} </td>
				<td>{{ $un -> member_srl}} </td>
				<td>{{ $un -> download_count}} </td>
				<td>{{ $un -> direct_download}} </td>
				<td>{{ $un -> source_filename}} </td>
				<td>{{ $un -> uploaded_filename}} </td>
				<td>{{ $un -> file_size}} </td>
				<td>{{ $un -> comment}} </td>
				<td>{{ $un -> isvalid}} </td>
				<td>{{ $un -> cover_image}} </td>










			</tr>
			@endforeach
		</table>
		<hr>
		<ul class="posi">{{ $dbdata -> render() }}</ul>
	</body>
</html>