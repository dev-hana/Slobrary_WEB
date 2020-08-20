<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String rating = request.getParameter("rating");
	String bookid = request.getParameter("bookid");
	String review = request.getParameter("review");
	
	System.out.println(rating);
	System.out.println(bookid);
	System.out.println(review);
	
%>
<script type="text/javascript">
alert("리뷰가 등록되었습니다.\\n나의 리뷰에서 등록된 리뷰를 확인할 수 있습니다.");
history.back();
</script>
</body>
</html>