<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="memMgr" class="database.MemMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	boolean result = memMgr.confirmId(id);
	// 현재 14번째 줄에서 The method confirmId(String) is undefined for the type MemMgr 오류 -> 수정 예정 (작성자:윤고은나래)
	
	if (result) {
%>
	<p>이미 사용중인 ID입니다.</p>
<% 
	} else{
%>
	<p>입력하신 <%=id %>는 사용하실 수 있는 ID입니다.</p>
<%		
	}
%>
</body>
</html>