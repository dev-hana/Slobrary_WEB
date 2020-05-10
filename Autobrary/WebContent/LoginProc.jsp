<%@page import="encryption.PBKDF2_Encryption"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id = "memMgr" class = "database.MemMgr" />

<%
	String mem_id = request.getParameter("mem_id");
	String passwd = request.getParameter("mem_pw");
	boolean loginCheck = memMgr.loginCheck(mem_id, passwd);
	
	if(loginCheck) {
		session.setAttribute("loginKey", mem_id);
	
%>
	<script>
   location.href="Index.jsp";
   </script>
   <%}else{%>

   <script>
   alert("입력한 정보가 정확하지 않습니다.");
   location.href="Login.jsp";
   </script>

<%}%>