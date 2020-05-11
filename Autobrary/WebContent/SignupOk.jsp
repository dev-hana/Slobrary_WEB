<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료 페이지</title>

<!-- 아이콘 -->
<link rel="shortcut icon" href="../img/favicon.ico">

<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400&display=swap&subset=korean" rel="stylesheet">
    
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<style>
* {
    font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<div class="container-fluid bg-light">
							<div class="row justify-content-md-center">
								<div class="col-sm-4 shadow-sm p-3 mb-5 bg-white p-5">
									<div class="title">
										<h4>회원가입 완료</h4><hr>
									</div>
									<div style="border:#BDBDBD solid 1px; text-align:center;" class="p-3">
											<p style="font-size:15px;" class="mt-4"><%= request.getParameter("id") %>님 회원가입을 성공적으로 완료했습니다.</p><br>
									</div>
								<div style="text-align:right;" class="mt-4">
                    				<button class="btn btn-outline-success mr-1" >로그인</button>
									<button class="btn btn-outline-info" >홈페이지</button>
								</div>
							</div>
						</div>
					</div>
</body>
</html>