<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="bookMgr" class="database.BookMgr" />
 <%
	String mem_id = (String)session.getAttribute("loginKey");
	if(mem_id==null) {
	%>
		   <script>
		   alert("로그인 후 사용 가능합니다.");
		   location.href="../Login.jsp";
		   </script>
	<%} else{
		Vector vResult = bookMgr.getWishList(mem_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망도서목록</title>
</head>
<body>
<jsp:include page="../Top.jsp" flush="false"/>

<!-- 희망도서 리스트 디자인 해주세요 -->



</body>
</html>
<%}%>