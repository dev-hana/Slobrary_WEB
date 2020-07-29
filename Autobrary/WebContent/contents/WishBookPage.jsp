<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<%
	String mem_id = (String)session.getAttribute("loginKey");
	if(mem_id==null) {
	%>
		   <script>
		   alert("로그인 후 사용 가능합니다.");
		   location.href="../Login.jsp";
		   </script>
	<%
	} else{
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망도서</title>
</head>
<body>
	<jsp:include page="../Top.jsp" flush="false"/>
	<div class="row mt-5 mb-5 justify-content-md-center">
	<div class="col-xl-8 bg-white shadow-sm rounded pl-4 pr-4 pt-3 pb-3">
		<jsp:include page="/contents/WishList.jsp" flush="false"/>
	</div>
	</div>
	<jsp:include page="../Footer.jsp" flush="false"/>
</body>
</html>
<%}%>

