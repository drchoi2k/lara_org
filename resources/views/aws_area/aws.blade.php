<!DOCTYPE html>
<html>
	<head>
		<title>AWS</title>
		<link href="css/aws.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div class="title">
			<a>여기는 아마존 서버입니다.</a>
			<hr>
			
			 <a><img src="images/aaa.png"></a>
		</div>
			<div class="list">
				@foreach($data as $key => $d)
				<li>{{$key}}. {{$d}} </li>
				@endforeach
				<a> {{count($data)}}</a> <!--  ARRAY숫자 -->
			</div>
	</body>
</html>