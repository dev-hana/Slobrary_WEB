<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String contentPage= request.getParameter("contentPage");
	if(contentPage==null){
		contentPage="LogList.jsp?type=review";
	}else{
		System.out.println(contentPage);
		
	}
%>
</head>
<body>
<div class="col-xl-7">
	<div>
		<jsp:include page="/contents/LogMenu.jsp" flush="false"/>
	</div>
	<div class="p-3">
		<jsp:include page="<%=contentPage %>" flush="false"/>
	</div>
</div>
</body>
</html>