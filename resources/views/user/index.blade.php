<!DOCTYPE html>
<html>
	<head>
		<title>고객 명단</title>
	</head>
	<body>
		<!-- 선택명단 -->
		<h1>이름: {{ $singleUser -> name }}<br>메일: {{ $singleUser -> email }}</h1>


		<!-- 전체명단 -->
		<table>
			@foreach($users as $u)
			<tr>
				<td>{{ $u -> name }} </td>
			</tr>
			@endforeach
		</table>



	</body>
</html>