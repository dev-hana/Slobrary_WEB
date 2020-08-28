<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="memMgr" class="database.MemMgr" />
<%
	request.setCharacterEncoding("utf-8");
	String mem_id = (String)session.getAttribute("loginKey");
	String address = request.getParameter("mem_address");
	String img = request.getParameter("mem_img");

	boolean flag = memMgr.memberUpdateMy(mem_id, address, img);

	
%>

<%
if(flag){
%>
		<script>
		alert("성공적으로 수정하였습니다");
		<%session.setAttribute("loginKey", mem_id);%>
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