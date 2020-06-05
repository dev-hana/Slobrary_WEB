<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="memMgr" class="database.MemMgr" />
<%
	request.setCharacterEncoding("utf-8");
	String mem_id = request.getParameter("mem_id");
	String address = request.getParameter("mem_address");
	String img = request.getParameter("mem_img");
<<<<<<< HEAD
	boolean flag = memMgr.memberUpdateMy(mem_id, address);
=======
	boolean flag = memMgr.memberUpdateMy(mem_id, address, img);
>>>>>>> 636827c1c7ccfb819b6b4700579b77742f76c40f
	
%>

<%
if(flag){
%>		session.setAttribute("loginKey", mem_id);
		<script>
		alert("성공적으로 수정하였습니다");
		location.href="MyPage.jsp";
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