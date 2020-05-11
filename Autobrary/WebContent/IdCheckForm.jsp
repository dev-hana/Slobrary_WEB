<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="col-sm-4 shadow-sm p-3 mb-5 bg-white p-4">
		<div class="title">
			<h4>아이디 중복확인</h4><hr>
		</div>
		
		<form id="checkForm" class="needs-validation" novalidate>
			<div class="input-group">
           		<input type="text" class="form-control" id="userID" name="mem_id" required>
          	 	<button type="submit" class="btn btn-secondary">중복확인</button>
          	 </div>
				</form>
				<div id="msg"></div><br>
				<div class="mt-3" style="text-align:right;">
					<input style="display: inline-block;" id="useBtn" class="btn btn-outline-primary pl-4 pr-4" type="button" value="사용하기" onclick="sendCheckValue()">
					<input style="display: inline-block;" id="cancelBtn" class="btn btn btn-outline-danger pl-4 pr-4" type="button" value="취소" onclick="window.close()">
				</div>
	</div>

</body>
</html>