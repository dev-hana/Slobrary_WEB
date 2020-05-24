<%@page import="encryption.PBKDF2_Encryption"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
	String mem_id = request.getParameter("mem_id");
	String passwd = request.getParameter("mem_pw");
	String remember = request.getParameter("remember");
	if(remember != null && remember.equals("true")){
		Cookie idcookie = new Cookie("mem_id", mem_id);
		response.addCookie(idcookie);
	}else{
		Cookie idcookie = new Cookie("mem_id", mem_id);
		idcookie.setMaxAge(0);
		response.addCookie(idcookie);
	}
%>
<jsp:forward page="LoginProc.jsp" />