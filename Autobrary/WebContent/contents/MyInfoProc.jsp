<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="memMgr" class="database.MemMgr" />
<%
	request.setCharacterEncoding("utf-8");
	String mem_id = request.getParameter("mem_id");
	String address = request.getParameter("mem_address");
	boolean flag = memMgr.memberUpdateMy(mem_id, address);
	
%>
<%
if(flag){
%>
		<script>
		alert("성공적으로 수정하였습니다");
		history.go(-2);
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