<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<%@page import="bucketConnector.BucketManager"%>
<jsp:useBean id="bookMgr" class="database.BookMgr" />
<%
//String mem_id = (String)session.getAttribute("loginKey");
String mem_id = (String)session.getAttribute("loginKey");
if(mem_id == null){
	%>
	<script>
	alert("로그인이 필요한 작업입니다.");
	location.href="../Login.jsp";
	</script>
<%}
else{
String id_num = request.getParameter("bookid");
BookBean bookBean = bookMgr.getBook(id_num);
System.out.println("idnum : "+id_num +", bookbean : " +bookMgr.getBook(id_num));
%>
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
<link href="/css/allNeed.css" rel="stylesheet">
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
			<img src="<%=new BucketManager().base64DownLoader(bookBean.getImage())%>" alt="<%=bookBean.getId_num() %>" class="thumbnail">
		</div>

		<div class="diaryInfo">
			<form action="BookDiaryFormProc.jsp" method="post">
				<input type="text" name="name" value="<%=bookBean.getName() %>" disabled>
				<input type="text" name="author" value="<%=bookBean.getAuthor() %>" disabled> 
				<input type="number" name="page" placeholder="읽은 쪽">
				<div class="sentence">
					<input type="text" name="sentence" placeholder="인상깊었던 구절">
				</div>
				<label for="experience">느낀점 및 나의 생각</label>
				<textarea id="experience" name="content"></textarea>
				<input type="hidden" name="mem_id" value=<%=mem_id %> />
				<input type="hidden" name="id_num" value=<%=bookBean.getId_num() %> />
				<button type="submit">등록</button>
			</form>
		</div>
	</div>
	</section>
</body>
</html>
<%}%>