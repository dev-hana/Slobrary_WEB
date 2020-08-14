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
<script type="text/javascript">
//비밀번호 일치검사
$(function(){
$("#alert-success").hide(); 
$("#alert-danger").hide(); 
$("input").keyup(function(){ 
	var pwd1=$("#pwd1").val();
	var pwd2=$("#pwd2").val();
	if(pwd1 != "" || pwd2 != ""){ 
		if(pwd1 == pwd2){ 
		$("#alert-success").show();
		$("#alert-danger").hide(); 
		$("#submit-btn").removeAttr("disabled");
	}else{ $("#alert-success").hide(); 
	$("#alert-danger").show(); 
	$("#submit-btn").attr("disabled", "disabled"); 
	} } }); });

</script>
<script type="text/javascript" src="/js/formneeds.js"></script>
</head>
<body class="bg-light pb-4">
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
					2. 회원 탈퇴 시, 개인정보 보관기관의 의해 1년간 정보가 보존됩니다.<br>
					3. 탈퇴 후 같은 아이디로 재가입하실 수 없습니다.<br>
					4. 안전한 탈퇴를 위해서 비밀번호 확인 후 탈퇴가 진행됩니다.<br>
				</div>
			</div>
			<div>
				<form action="WithdrawProc.jsp" method="post" class="needs-validation" novalidate>
					<div class="form-check mb-2 mt-2 mr-2 float-right">
                        <label class="form-check-label">
                            <input class="form-check-input" type="checkbox" required>
                            	위 내용에 동의합니다.
                            <div class="invalid-feedback">탈퇴를 진행하시려면 체크하십시오.</div>
                        </label>
                    </div><br>
					<div class="form-group row mt-5">
						<div class="col">
							<label for="pwd1">비밀번호</label>
                        	<div class="input-group mb-2">
                           	 	<input type="password" class="form-control" name="pwd1" id="pwd1" required>
                        	</div>
                        </div>
                        <div class="col">
                       	 	<label for="pwd2">비밀번호 확인</label>
                      		<div class="input-group mb-2">
                            	<input type="password" class="form-control" name="pwd2" id="pwd2" required>
                        	</div>
                        </div>
                   	</div>
                   	<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
                    <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
                    
                   	<div class="float-right mt-5">
                   		<button id="submit-btn" onclick="history.back()" class="btn btn-outline-success pr-4 pl-4" type="button">취소</button>
                   		<button id="submit-btn" class="btn btn-outline-danger" type="submit">탈퇴하기</button>
                   	</div>
				</form>
			</div>
		</div>
	</div>
	</div>
	<br><br>
	
</body>
</html>