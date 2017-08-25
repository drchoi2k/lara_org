<!DOCTYPE html>
<html>
	<head>
		<title>고객 명단</title>
	</head>
	<body>
		<h1>이름: {{ $singleUser -> name }}<br>메일: {{ $singleUser -> email }}</h1>
	</body>
</html>