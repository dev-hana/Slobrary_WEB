<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.title{
	font-size: 18px;
	color:#8471D1;
}
.top{
	text-align: center;
}
.info{
	border: 1px solid #BDBDBD;
}
.red{
	color:#DF0101;
}
</style>
</head>
<body class="bg-light">
	<header>
		<jsp:include page="../Top.jsp" flush="false"/>
	</header>
	<div class="container-fluid">
	<div class="row mt-5 justify-content-md-center">
		<div class="col-xl-8 p-5 m-1 bg-white shadow-sm rounded">
			<div class="mb-3">
				<h4>회원 탈퇴</h4><hr>
			</div>
			<br>
			<div class="info pl-2 pr-2">
				<div class="top pt-3 pr-3 pl-3">
					<span class="title">회원탈퇴 신청 전 아래 사항을 반드시 확인하시기 바랍니다.</span><hr>
				</div>
				<div class="contents mt-4 pl-5 pb-4">
					1. 미반납 도서가 있는 회원의 경우 탈퇴를 할 수 없으므로 <sapn class="red">도서를 반납 후 탈퇴</sapn>를 해주시기 바랍니다.<br>
					2. 회원 탈퇴 즉시, 회원 정보는 모두 삭제되고 재가입시에도 복원되지 않습니다.<br>
					3. 안전한 탈퇴를 위해서 비밀번호 확인 후 탈퇴가 진행됩니다.<br>
				</div>
			</div>
			<div>
				<form>
				
				</form>
			</div>
		</div>
	</div>
	</div>
</body>
</html>