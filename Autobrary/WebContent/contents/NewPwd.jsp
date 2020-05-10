<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id = (String)request.getParameter("mem_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- 아이콘 -->
<link rel="shortcut icon" href="../img/favicon.ico">

<!-- 자바 스크립트 --> 
<script type="text/javascript" src="/js/formneeds.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>

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
label {
	font-size:15px;
    margin-top: 10px;
}
.einfo{
	font-size:14px;
	color:#BDBDBD;
	text-align:right;
}

.btn-secondary.custom-btn {
	background-color: #E6E6E6;
	border-color: #E6E6E6;
	color: #000;
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
<title>비밀번호 재설정</title>
</head>
<body class="bg-light">
	<jsp:include page="../Top.jsp" flush="false"/>
	<div class="container-fluid">
		<div class="row justify-content-md-center mt-3">
			<div class="col-sm-4 shadow-sm p-3 mb-5 bg-white p-5">
				<div class="title">
					<h4>비밀번호 재설정</h4><hr>
				</div>
					<div>
					<form action="NewPwdProc.jsp" method="post" id="myForm" class="needs-validation" novalidate>
					<input type="hidden" name="mem_id" value=<%=mem_id %> >
						<div class="form-group">
						<label for="new_pwd">새 비밀번호</label>
                        <div class="input-group mb-2">
                            <input id="pwd1" type="password" class="form-control" placeholder="숫자, 대/소문자 포함 8글자 이상 입력해주세요." name="new_pwd" required>
                            
                        </div>
                        
						<label for="ok_pwd">새 비밀번호 확인</label>
                        <div class="input-group mb-3">
                            <input id="pwd2" type="password" class="form-control" name="ok_pwd" required>
                        </div>
                        <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
                        <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
                        
                        <div style="text-align:right;" class="mt-4 pt-3">
                        <button id="submit-btn" class="btn btn-secondary custom-btn btn-block pt-2 pb-2" type="submit">비밀번호 변경</button></div>
						</div>
					</form>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>