<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="revBean" class="db.ReviewMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String flag = request.getParameter("flag");
		boolean result=false;
		if(flag.equals("delete")){
			result = revBean.deleteChild(request.getParameter("no"));
			result = revBean.deleteReview(request.getParameter("no"));
		}else if(flag.equals("update")){
			result = revBean.updateReview(request);
		}
		
		if(result==true){
			response.sendRedirect("MyPage.jsp");
		}
	%>
</body>
</html>