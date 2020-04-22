<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="../img/favicon.ico">
 <meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<style>
body{
		font-family: 'Nanum Gothic Coding', monospace;
		background-color: #f7f9ff;
	}
.txt1{
	text-align: right;
	font-size: 15px;
	color: #6E6E6E;
}
</style>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-6 shadow-sm p-3 mb-5 bg-white rounded">
				<span>희망도서 시청</span>
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
				</div>
				
				<!-- 필수항목 안내 -->
					<div class="txt1 pr-3">
						<span>* 필수입력 항목입니다.</span>
					</div>
					
				<!-- submit 버튼 -->	
					<div>
						<button class="btn pl-5 pr-5" type="submit">확인</button>
					</div>
				</form>	
			</div>
		</div>
	</div>
</body>
</html>