<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="bookMgr" class="database.BookMgr" />

<%
	String id_num = request.getParameter("id_num");
	boolean flag = bookMgr.deleteBook(id_num);

%>

<%
if(flag){
%>
		<script>
		alert("성공적으로 삭제하였습니다");
		location.href="BookMgr.jsp";
		</script>
<%
	}else{
%>
		<script>
		alert("삭제도중 에러가 발생하였습니다.");
		history.back();
		</script>

<%
	  }
%>
