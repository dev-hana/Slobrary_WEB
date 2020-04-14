<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="../img/favicon.ico">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>
html, body {
	width: 100%; 
	height: 100%;
	font-family: 'Nanum Gothic Coding', monospace;
}
body{
	background-color:#f2f3fa;
	
}
.myInfo{
	width:300px;
	height:550px;
}
.row1{
	border-bottom: 1px solid #c8c8c8;
	padding-bottom: 10px;
}
.row2{
	text-align: center;
	padding-top: 30px;
	
	border-bottom: 1px solid #c8c8c8;
}
.row3{
	text-align: center;
	padding-top: 30px;
}
.img1{
	margin-bottom: 30px;
}
h5{
	color: #A593E0;
}
.list{
	margin-left: 330px;
	}
.contents{
	position: absolute;
	top:50%;
	left:50%;
	transform: translate(-50%,-50%)
}
a{
	color: #515152;
	text-decoration: none; 
}
a:hover {
	text-decoration: underline;
}
</style>   

    
<title>Insert title here</title>
</head>
<body style="bgcolor:#f2f3fa;">
	<div class="container">
	<div class="contents">
	<div style="float:left;">
	<div class="myInfo shadow-sm p-3 mb-5 bg-white rounded">
		<div class="row1">
			<div style="float:left;"><h5>내 정보</h5></div> <div><button class="btn btn-sm" style="margin-left: 140px;" type="sumbit">수정</button></div>
		</div>
		<div class="row2">
			<div class="img1">
			<img style="width:110px; height:110px;" class="rounded-circle" src="../img/profile.jpg">
			</div>
			<div style="text-align: left; margin-left: 10px; margin-bottom: 20px;">
				<span>양지현 님</span>
				<p>didwlgus@naver.com</p>
			</div>
		</div>
		<div class="row3">
			<ul class="list-group">
				<li class="list-group-item list-group-item-action"><a href="#">대출도서</a></li>
				<li class="list-group-item list-group-item-action"><a href="#">연체도서</a></li>
				<li class="list-group-item list-group-item-action"><a href="#">희망도서</a></li>
				<li class="list-group-item list-group-item-action"><a href="#">관심도서</a></li>
			</ul>
		</div>
	</div>
	</div>
	<div class="list">
		<jsp:include page="MyPage3.jsp" flush="false"/>
	</div>
	</div>
	</div>
</body>
</html>