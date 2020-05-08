<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 아이콘 -->
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<link href="/css/WishBook.css" rel="stylesheet" />
<link rel="shortcut icon" href="/img/favicon.ico">
 <meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script>
// Disable form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>


</head>
<body class="bg-light">
<jsp:include page="../Top.jsp" flush="false"/>
	<div class="container-fluid">
		<div class="row mt-5 justify-content-md-center">
			<div class="col-sm-4 shadow-sm p-3 mb-5 bg-white rounded">
				<div class="title">
					<i style="font-size: 25px;" class="fas fa-book"></i>
          		  <h4 style="display:inline-block; margin:15px; padding-bottom:2px; font-weight: 600;">희망도서 신청</h4>
      			 </div>
				<hr>
				
				<form class="needs-validation" method="post" action="WishBookProc.jsp" novalidate>
				
				<!-- 사용자 정보 숨김 (세션에 저장된 사용자 아이디 사용할 예정) -->
				<input name="mem_id" type="text" value="yangz" hidden>
				
				<!-- 도서신청 입력 -->
				<div class="table1">
					<table class="table table-borderless">
						<tr>
							<div class="input-group">
							<th scope="row">도서명</th>
							<td><input name="name" class="form-control" type="text" placeholder="도서명을 입력해주세요" required></input>
							<div class="invalid-feedback">항목을 기입해주세요.</div></td>
							</div>
						</tr>
						<tr>
							<th scope="row">저자</th>
							<td><input name="author" class="form-control" placeholder="저자를 입력해주세요" type="text" required></input>
							<div class="invalid-feedback">항목을 기입해주세요.</div></td>
						</tr>
						<tr>
							<th scope="row">출판사</th>
							<td><input name="publisher" class="form-control" type="text" placeholder="출판사을 입력해주세요" required></input>
							<div class="invalid-feedback">항목을 기입해주세요.</div></td>
						</tr>
					</table>
				</div>
						<!-- submit 버튼 -->	
						<div class="button">
						<button class="btn btn-outline-primary pl-4 pr-4 pl-5 pr-5" type="submit">확인</button>
					</div>
				</form>	
				
				</div>
			</div>
		</div>
	</div>
</body>
</html>