<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String mem_id = request.getParameter("mem_id");
		String name = request.getParameter("name");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		
		
	%>
</body>
</html>