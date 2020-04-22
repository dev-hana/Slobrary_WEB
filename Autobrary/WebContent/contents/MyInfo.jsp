<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="../img/favicon.ico">
 <meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
.row1{
	text-align: center;
	padding-top: 25px;
	padding-bottom: 25px;
}
.table1{
	padding-top: 10px;
	padding-bottom: 10px;
}
body{
		font-family: 'Nanum Gothic Coding', monospace;
		background-color: #f7f9ff;
	}
img{
	margin-bottom: 10px;
}
.btns{
	text-align: center;
	padding-bottom: 10px;
}

</style>
</head>
<body>
	<div class="back">
	<div class="container-fluid">
		<div class="row justify-content-md-center">
			<div class="col-sm-4 shadow-sm p-3 mb-5 bg-white rounded">
				<!-- 프로필 이미지 -->
				<div>
					<div class="row1">
						<img style="width:120px; height:120px;" class="rounded-circle shadow-sm" src="../img/profile.jpg">
						<br><span>프로필 사진</span>
					</div>
					<hr>
				</div>
				<!-- 정보  -->
				<div class="table1">
					<table class="table table-bordered">
						<tr>
							<th scope="row">이름</th>
							<td><input class="form-control" type="text" value="양지"></input></td>
						</tr>
						<tr>
							<th scope="row">이메일</th>
							<td><input class="form-control" type="text" value="yangz@naver.com"></input></td>
						</tr>
						<tr>
							<th scope="row">전화번호</th>
							<td><input class="form-control" type="text" value="010-1234-5678"></input></td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td><input class="form-control" type="text" value="서울시 구로구"></input></td>
						</tr>
						<tr>
							<th scope="row">가입일</th>
							<td>2020-04-22</td>
						</tr>
					</table>
				</div>
				<div class="btns">
					<button class="btn btn-outline-primary pl-4 pr-4" type="submit">확인</button>
					<button class="btn btn btn-outline-danger pl-4 pr-4" type="submit">취소</button>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>