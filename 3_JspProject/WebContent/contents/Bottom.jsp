<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<footer class="container-fluid text-center">
<a href="#" title="To Top">
<span class="glyphicon glyphicon-chevron-up"></span>
</a>
<div>동양미래대학교 컴퓨터소프트웨어학과 2학년 B반 3조<br>20180721 양지현 20181845 윤고은나래 20185092 유혜림</div>
<form method="post" action="<%=request.getContextPath()%>/admin/AdminLogin.jsp" >
	<input type="submit" class="btn" value="관리자 페이지">
</form>
</footer>
</body>
</html>