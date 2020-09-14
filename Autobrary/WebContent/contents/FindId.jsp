<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- 아이콘 -->
<link rel="shortcut icon" href="../img/favicon.ico">

<!-- 자바 스크립트 -->
<script type="text/javascript" src="/js/formneeds.js"></script>

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
<title>아이디 찾기</title>
</head>
<body class="bg-light">
	<jsp:include page="/Top.jsp" flush="false"/>
	<div class="container-fluid">
		<div class="row justify-content-md-center mt-5">
			<div class="col-xl-4 shadow-sm p-3 mb-5 bg-white p-5">
				<div class="title">
					<h4>아이디 찾기</h4><hr>
				</div>
					<div>
					<form action="FindIdProc.jsp" method="post" class="needs-validation" novalidate>
						<div class="form-group">
						<label for="name">이름</label>
                        <div class="input-group mb-2">
                            <input type="text" class="form-control" placeholder="이름을 입력해주세요" name="name" required>
                            
                        </div>
                        
							<label for="birth">생년월일</label>
							<div class="input-group mb-2">
                        	<input type="text" class="form-control" placeholder="생년월일을 입력해주세요.  예)19001212" id="birth" name="birth" required>
                        	</div>
						<label for="mem_mail">이메일</label>
                        <div class="input-group">
                            <input type="email" class="form-control" placeholder="abc@slobrary.com" name="email" required> 
                        </div>
                        <p class="einfo">회원가입시 사용한 이메일을 입력해주세요.</p>   
                        <div style="text-align:right;" class="pt-3">
                        <button id="submit-btn" class="btn btn-secondary custom-btn btn-block pt-2 pb-2" type="submit">아이디 찾기</button></div>
						</div>
					</form>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>