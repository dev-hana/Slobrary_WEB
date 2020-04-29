<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="/css/MyInfo.css" rel="stylesheet" />
<link rel="shortcut icon" href="../img/favicon.ico">
 <meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<title>마이페이지 수정</title>
<script type="text/javascript" src="jpery.min.js" charset="utf-8"></script>
<script type="text/javascript">
	function LoadImg(value){
		
		if(value.files && value.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$('#profile').attr('src',e.target.result);
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
</script>
</head>

<body class="bg-light">
	<jsp:include page="../Top.jsp" flush="false"/>
	<div class="back">
	<div class="container-fluid">
		<div class="row mt-5 justify-content-md-center">
			<div class="col-sm-4 shadow-sm p-3 mb-5 bg-white rounded">
			<form method="post" action="MyInfoProc.jsp">
				<!-- 프로필 이미지 -->
				<div>
					<div class="row1">
						<img id="profile" style="width:100px; height:100px;" class="rounded-circle shadow-sm" src="../img/profile.jpg">
						<br>
						<div>
						<input class="btn" type="file" id="imgAttach" name="imgAttach" onchange="LoadImg(this);">
						</div>
					</div>
					<hr>
				</div>
				<!-- 정보  -->
				<div class="table1">
					<table class="table table-bordered">
						<tr>
							<th scope="row">이름</th>
							<td><input name="mem_name" class="form-control" type="text" value="양지"></input></td>
						</tr>
						<tr>
							<th scope="row">이메일</th>
							<td><input name="mem_mail" class="form-control" type="email" value="yangz@naver.com"></input></td>
						</tr>
						<tr>
							<th scope="row">전화번호</th>
							<td><input name="mem_phone" class="form-control" type="text" value="010-1234-5678"></input></td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td><input name="mem_address" class="form-control" type="text" value="서울시 구로구"></input></td>
						</tr>
						<tr>
							<th scope="row">가입일</th>
							<td>2020-04-22</td>
						</tr>
					</table>
				</div>
				<div class="btns">
					<button class="btn btn-outline-primary pl-4 pr-4" type="submit">확인</button>
					<button class="btn btn btn-outline-danger pl-4 pr-4">취소</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	</div>
</body>
</html>