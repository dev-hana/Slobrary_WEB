<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String rating = request.getParameter("rating");
	String bookid = request.getParameter("bookid");
	String review = request.getParameter("review");
	
	System.out.println(rating);
	System.out.println(bookid);
	System.out.println(review);
	
	if(review == null){
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

