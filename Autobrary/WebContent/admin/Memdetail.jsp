<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="memMgr" class="database.MemMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script language="JavaScript" src="script.js"></script>
<%
	String mem_id = request.getParameter("mem_id");
	MemBean regBean= memMgr.getMember(mem_id);
%>
<title>상세정보</title>
</head>
<body>
	<h3><%=mem_id %></h3>
</body>
</html>