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

<title>비밀번호 찾기</title>
</head>
<body class="bg-light">
<jsp:include page="../Top.jsp" flush="false"/>
	<div class="container-fluid">
		<div class="row justify-content-md-center mt-3">
			<div class="col-sm-4 shadow-sm p-3 mb-5 bg-white p-5">
				<div class="title">
					<h4>비밀번호 찾기</h4><hr>
				</div>
					<div>
					<div class="form-group">
					<form action="FindPwdProc.jsp" method="post" class="needs-validation" novalidate>
					
				
						<input type="hidden" name="pwd_type" value="인증번호">
						<label for="mem_id">아이디</label>
                        <div class="input-group mb-2">
                            <input type="text" class="form-control" placeholder="아이디를 입력해주세요" name="mem_id" required>
                        </div>
                        
						<label for="mem_name">이름</label>
                        <div class="input-group mb-2">
                            <input type="text" class="form-control" placeholder="이름을 입력해주세요" name="name" required>

                        </div>
                        
							<label for="birth">생년월일</label>
							<div class="input-group mb-2">
                        	<input type="text" class="form-control" placeholder="생년월일을 입력해수세요. 예)19001212" id="birth" name="birth" required>
                        	</div>
						<label for="mem_mail">이메일</label>
                        <div class="input-group">
                            <input type="email" class="form-control" placeholder="abc@slobrary.com" name="email" required>
                            <button type="submit" class="btn btn-secondary">인증번호 발송</button>
                        </div>
                        <p class="einfo">회원가입시 사용한 이메일을 입력해주세요.</p>
					
						<label for="number">인증번호</label>
						</form>
						<form action="FindPwdProc.jsp" method="post" class="needs-validation" novalidate>
                        <div class="input-group">
                        <input type="text" class="form-control" placeholder="인증번호를 입력해주세요" name="number" required>
                        </div>
						<input type="hidden" name="pwd_type" value="비밀번호찾기">
                        <div style="text-align:right;" class="mt-3">
                        <button id="submit-btn" class="btn btn-secondary custom-btn btn-block pt-2 pb-2" type="submit">다음</button>
                        </div>
                        </form>
						</div>
				</div>
			
			</div>
		</div>
	</div>
</body>
</html>