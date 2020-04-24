<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/WishBook.css" rel="stylesheet" />
<link rel="shortcut icon" href="../img/favicon.ico">
 <meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>
<body class="bg-light">
<jsp:include page="../Top.jsp" flush="false"/>
	<div class="container-fluid">
		<div class="row mt-5 justify-content-md-center">
			<div class="col-sm-4 shadow-sm p-3 mb-5 bg-white rounded">
				<div class="title">
          		  <h4>희망도서 신청</h4>
      			  </div>
				<hr>
				<form>
				<!-- 도서신청 입력 -->
				<div class="table1">
					<table class="table table-bordered">
						<tr>
							<th scope="row">*도서명</th>
							<td><input class="form-control" type="text" required></input></td>
						</tr>
						<tr>
							<th scope="row">*저자</th>
							<td><input class="form-control" type="text" required></input></td>
						</tr>
						<tr>
							<th scope="row">*출판사</th>
							<td><input class="form-control" type="text" required></input></td>
						</tr>
						<tr>
							<th scope="row">출판연도</th>
							<td><input class="form-control" type="text"></input></td>
						</tr>
					</table>
					
					<!-- 필수항목 안내 -->
					<div class="txt1 pr-3">
						<span>* 필수입력 항목입니다.</span>
					</div>
					
				</div>
				
				
					
				<!-- submit 버튼 -->	
					<div class="button">
						<button class="btn btn-outline-primary pl-4 pr-4 pl-5 pr-5" type="submit">확인</button>
					</div>
				</form>	
			</div>
		</div>
	</div>
</body>
</html>