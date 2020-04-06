<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, db.*, beans.*"%>
<jsp:useBean id="reviewMgr" class="db.ReviewMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String flag = request.getParameter("flag");
	boolean result = false;
	if(flag.equals("update")){
    	result=reviewMgr.updateReview(request);
	}else if(flag.equals("delete")) {
		result=reviewMgr.deleteReview(no);
	} 
	if(result){
%>
	  <script>
	    alert("처리하였습니다");
		location.href="ReviewMgr.jsp";
	  </script>
<%	}else{%>
	  <script>
	    alert("오류가 발생하였습니다.");
		location.href="ReviewMgr.jsp";
	  </script>
<%	}%>
</body>
</html>