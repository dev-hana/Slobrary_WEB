<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독서 일기 작성</title>
<%@ include file="/CND.jsp"%>
<link href="/css/allNeed.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap"
	rel="stylesheet">
<link href="../css/allNeed.css" rel="stylesheet">
<link href="/css/bookDiaryForm.css" rel="stylesheet">
</head>
<body>
	<header>
		<jsp:include page="/Top.jsp" flush="false" />
	</header>
	<section class="main-content">
	<h1 class="title">
		<i class="fas fa-feather"></i>독서 일기 작성
	</h1>
	<div class="form">
		<div class="imageBox">
			<img src="/img/ex2.jpg" alt="" class="thumbnail">
		</div>

		<div class="diaryInfo">
			<form action="" method="post">
				<input type="text" name="book-title" value="도서제목" disabled>
				<input type="text" name="book-title" value="저자" disabled> <input
					type="number" name="page" placeholder="읽은 쪽">
				<div class="sentence">
					<input type="text" name="sentence" placeholder="인상깊었던 구절">
				</div>
				<label for="experience">느낀점 및 나의 생각</label>
				<textarea id="experience" name="experience"></textarea>
				<button type="submit">등록</button>
			</form>
		</div>
	</div>
	</section>
</body>
</html>