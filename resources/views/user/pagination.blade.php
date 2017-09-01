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
				<th>Role</th>
				<th>Action</th>

			</tr>
			@foreach($users as $key => $u)
			<tr>
				<td>{{ $key + $users->firstItem() }}</td>
				<td>{{ $u->id }}</td>
				<td>{{ $u->name }} </td>
				<td>{{ $u->email }} </td>
				<td>{{ $u->rolename }} </td>
				<td>
					<a href="{{ url('getEdit', array($u -> id)) }}">수정</a>
					<!--web.php: get -->
					<a href="{{ url('postDelete',[$u->id]) }}" onclick="return confirm('삭제하겠습니까?')">삭제</a>

					<!--web.php:  post -->           
					<!-- <form action="{{ url('postDelete', [$u->id]) }}" method="POST" onclick="return confirm('확실합니까?)'">{!! csrf_field() !!}
						<input type="submit" name="Del">
					</form> -->
				</td>
			</tr>
			@endforeach
		</table>
		<h1>{{ $users ->total() }} </h1>
		<hr>
		{{ $users -> links() }}
	</body>
</html>
