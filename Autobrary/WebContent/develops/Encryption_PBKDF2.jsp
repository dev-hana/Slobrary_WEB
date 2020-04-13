<%@page import="encryption.PBKDF2_Encryption"%>
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
if(request.getParameter("data")!= null){
	%>
	<%=PBKDF2_Encryption.createHash(request.getParameter("data"))%>
	<%
}
%>
</body>
</html>