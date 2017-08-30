<!DOCTYPE html>
<html>
	<head>
		<title>Pagination</title>
		<style type="text/css">
		.pagination li{
				display: inline;
				float: left;
				padding: 10px;
					background: #ddd;
			}
		table tr > td, tr> th{
			border: 1px solid #ddd
			padding 2px;
		}
		</style>
	</head>
	<body>
		<H1>PAGINATION lARAVEL</H1>
		<h4><a href="{{ url('getInsert') }}">NEW User</a></h4>
		<table>
			<tr>
				<th>N<sup>o</sup></th>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Created</th>
				<th>Updated</th>
			</tr>
			@foreach($users as $key => $u)
			<tr>
				<td>{{ $key + $users->firstItem() }}</td>
				<td>{{ $u->id }}</td>
				<td>{{ $u->name }} </td>
				<td>{{ $u->email }} </td>
				<td>{{ $u->create_at }} </td>
				<td>{{ $u->update_at }} </td>
				<td><a href="{{ url('getEdit',array($u-id)) }}">Edit</a></td>
				<td><a href="#">Delete</a></td>
			</tr>
			@endforeach
		</table>
		<<h1>{{ $users ->total() }} </h1>
		<hr>
		{{ $users -> links() }}
	</body>
</html>