<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="../img/favicon.ico">
<link href="/css/MyPage.css" rel="stylesheet" />
 <meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>
<body class="bg-light">
	<jsp:include page="../Top.jsp" flush="false"/>
	<div class="container-fluid">
		<div class="row mt-5 justify-content-md-center">
			<div class="col-sm-3 mr-3">
				<div class="shadow-sm p-3 mb-5 bg-white rounded">
				<div class="row1">
					<div style="float:left;"><h5>내 정보</h5></div> <div><button class="btn btn-light btn-sm" style="margin-left: 165px;" type="sumbit">수정</button></div>
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
					<ul class="list-group mypage">
						<li class="list-group-item list-group-item-action"><a href="#">대출도서</a></li>
						<li class="list-group-item list-group-item-action"><a href="#">연체도서</a></li>
						<li class="list-group-item list-group-item-action"><a href="#">희망도서</a></li>
					<li class="list-group-item list-group-item-action"><a href="#">관심도서</a></li>
				</ul>
				</div>
			</div>
			</div>
			<div class="col-sm-4">
				<jsp:include page="MyPageList.jsp" flush="false"/>
			</div>
		</div>	
	</div>
</body>
</html>