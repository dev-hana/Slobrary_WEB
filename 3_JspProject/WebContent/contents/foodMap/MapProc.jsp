<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,mapAPI.Search,beans.SearchBean" %>
<jsp:useBean id="sBean" class="mapAPI.Search"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String ins = request.getParameter("input");
	Vector<SearchBean>in = sBean.searchf(ins);
%>
<div>
<%
	for(int i=0;i<in.size();i++){
		SearchBean myInfo = in.get(i);
%>
<div>
	<a href="MapReview.jsp?store_addr=<%=myInfo.getRad() %>"><%=myInfo.getTi() %></a><br>
	<%=myInfo.getCa() %><br>
	<%=myInfo.getTel() %><br>
	<%=myInfo.getAd() %><br>
	<%=myInfo.getRad() %><br>
	<hr><br>
</div>
<%
}
%>
</div>
</body>
</html>