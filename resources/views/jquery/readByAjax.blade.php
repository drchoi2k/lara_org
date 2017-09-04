<table class="table">
	<thead>
		<tr>
			<th>ID</th>
			<th>이 름</th>
			<th>Email</th>
			<th>직 책</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		@foreach($users as $key => $u)
		<tr class="id{{$u->id}}">
			<td>{{ $u->id }}</td>
			<td>{{ $u->name }}</td>
			<td>{{ $u->email }}</td>
			<td>{{ $u->rolename }}</td>
			<td>
				<button value="{{$u->id}}" class="btn btn-primary btn-sm btn-edit">수 정</button>
				<button value="{{$u->id}}" class="btn btn-danger btn-sm btn-dell">삭 제</button>
			</td>
		</tr>
		@endforeach
	</tbody>
</table> 