<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userBean" class="db.UserMgr"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		session.removeAttribute("email");
		session.removeAttribute("login");
		response.sendRedirect("../main/Index.jsp");
	%>
</body>
</html>