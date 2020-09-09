<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String mem_id = (String)session.getAttribute("loginKey");
	String rating = request.getParameter("rating");
	String bookid = request.getParameter("bookid");
	String content = request.getParameter("review");
		
	if(content == null){
		%>
		<script>
		alert("리뷰를 입력해 주십시오.");
		history.back();
		</script>
  <%
	}
%>
		<script>
		alert("도서를 선택하여 주십시오.");
		history.back();
		</script>

