<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="memMgr" class="database.MemMgr"/>


<!DOCTYPE html>
<html>
<head>
<style>
.btn {background-color:#042759;font-weight:bold;color:#FFFFFF;border: none;border-radius:5px;}
</style>
<meta charset="UTF-8">
<script language="JavaScript" src="script.js"></script>
<title>회원탈퇴</title>
<%
String rfid = request.getParameter("rfid");
MemBean memBean = memMgr.getMemberr(rfid);

%>
</head>
<body>
<%@ include file="Top.jsp" %> 
<br><br>
<form name="reform" method="post" action="DeleteProc.jsp">
<div style="text-align:center;">
<div style="text-align:center; border:1px solid gray;display:inline-block; 
padding:10px; align:center;">
	<h3><%=memBean.getMem_name() %>님을 탈퇴시키겠습니까?</h3>
</div>
<br><br>
<input class="btn" type="submit" value="네"></input>
<input type="hidden" name="rfid" value="<%=rfid %>">
</div>
</form>

<%@ include file="Bottom.jsp" %>
</body>
</html>