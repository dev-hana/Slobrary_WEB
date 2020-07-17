<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bookMgr" class="database.BookMgr" />

<%	
	request.setCharacterEncoding("utf-8");
	String status=request.getParameter("status");
	String wish_id=request.getParameter("wish_id");
	boolean result = false;

	result = bookMgr.updateWish(wish_id, status);
	
	if(result) {
%>
		<script>
		alert("수정하였습니다");
		location.href="WishMgr.jsp";
		</script>
<% }else{ %>
		<script>
		alert("오류가 발생하였습니다.");
		history.back();
		</script>
<%	}%>