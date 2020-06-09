<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, database.*" %>
<jsp:useBean id="adMgr" class="database.AdminSet" />
    <%
    	request.setCharacterEncoding("UTF-8");
    	String id = request.getParameter("id");
    	String pwd = request.getParameter("pwd");
    	String name = request.getParameter("name");
    	String phone = request.getParameter("phone");
    	String rank = request.getParameter("rank");
    	boolean flag = adMgr.insertAdminRequ(id, pwd, name, phone, rank);
    %>
<%
if(flag){
%>
		<script>
		alert("성공적으로 신청하였습니다");
		location.href="Index.jsp";
		</script>
<%
	}else{
%>
		<script>
		alert("신청도중 에러가 발생하였습니다.");
		history.back();
		</script>

<%
	  }
%>
    