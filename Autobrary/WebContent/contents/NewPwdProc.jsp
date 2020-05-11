<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="memMgr" class="database.MemMgr" />

<%

	String mem_id = request.getParameter("mem_id"); 
	String new_pwd = request.getParameter("new_pwd");
	boolean flag = memMgr.updatepwd(mem_id, new_pwd);
%>

<%
if(flag){
	session.removeAttribute("id");
	session.setMaxInactiveInterval(30*60);
%>
		<script>
		alert("성공적으로 수정하였습니다");
		location.href="../Login.jsp";
		</script>
<%
	}else{
%>
		<script>
		alert("수정도중 에러가 발생하였습니다.");
		history.back();
		</script>

<%
	  }
%>