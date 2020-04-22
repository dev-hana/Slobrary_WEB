<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="memMgr" class="database.MemMgr" />

<%
	String mem_id = request.getParameter("mem_id");
	boolean flag = memMgr.deleteMember(mem_id);
%>

<%
if(flag){
%>
		<script>
		alert("성공적으로 탈퇴하였습니다");
		location.href="Index.jsp";
		</script>
<%
	}else{
%>
		<script>
		alert("탈퇴도중 에러가 발생하였습니다.");
		history.back();
		</script>

<%
	  }
%>
