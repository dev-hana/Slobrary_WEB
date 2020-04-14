<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="../img/favicon.ico">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Insert title here</title>
<style>
	body,html {
 	 height: 100%;
	}
	body{
		font-family: 'Nanum Gothic Coding', monospace;
	}
	span{
		font-size: 100px;
	}
	.contents{
		text-align: center;
	}
</style>
</head>
<body>
	<div class="container d-flex h-100">
	<div class="contents row align-self-center w-100">
	<div class="col-6 mx-auto">
		<span>404</span>
		<p>찾을수 없는 페이지 입니다.<br>요청하신 페이지가 사라졌거나, 잘못된 경로를 이용하셨어요 :(</p>
		<button class="btn btn-outline-dark" onclick="location='../html/index.html'">HOME</button>
	</div>
	</div>
	</div>
</body>
</html>