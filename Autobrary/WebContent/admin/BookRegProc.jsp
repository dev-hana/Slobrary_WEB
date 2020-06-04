<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bookMgr" class="database.BookMgr" />
<%
	boolean result = false;

	result = bookMgr.BookUpdate(request);
	
	if(result) {
%>
		<script>
		alert("등록하였습니다");
		location.href="BookMgr.jsp";
		</script>
<% }else{ %>
		<script>
		alert("오류가 발생하였습니다.");
		location.href="BookReg.jsp";
		</script>
<%	}%>