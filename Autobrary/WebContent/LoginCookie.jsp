<%@page import="encryption.PBKDF2_Encryption"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
	String mem_id = request.getParameter("mem_id");
	String passwd = request.getParameter("mem_pw");
	String remember = request.getParameter("remember");
	String chk = "";
	if(remember != null && remember.equals("true")){
		chk="checked";
		Cookie idcookie = new Cookie("mem_id", mem_id);
		Cookie chkcookie = new Cookie("chk", chk);
		response.addCookie(idcookie);
		response.addCookie(chkcookie);
	}else{
		Cookie idcookie = new Cookie("mem_id", mem_id);
		Cookie chkcookie = new Cookie("chk", chk);
		idcookie.setMaxAge(0);
		response.addCookie(idcookie);
		response.addCookie(chkcookie);
	}
%>
<jsp:forward page="LoginProc.jsp" />