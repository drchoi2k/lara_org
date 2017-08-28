<!DOCTYPE html>
<html>
<head>
	<title>Pagination</title>
	<style type="text/css">
	.pagination li{
			display: inline;
			float: left;
			padding: 10px;
			background: #ddd;	}
	</style>
</head>
<body>
<H1>PAGINATION lARAVEL</H1>
	<ul>
		@foreach($users as $key => $u)
			<li>{{ $u -> name}}</li>
		@endforeach
	</ul>
	<hr>
	{{ $users -> render() }}
</body>
</html>