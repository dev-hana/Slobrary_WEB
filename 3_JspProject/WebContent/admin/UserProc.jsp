<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, db.*, beans.*"%>
<jsp:useBean id="userMgr" class="db.UserMgr" />
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
	String email = request.getParameter("currentEmail");
	System.out.println(email);
	
	String flag = request.getParameter("flag");
	boolean result = false;
	if(flag.equals("update")){
    	result=userMgr.updateUser(request);
	}else if(flag.equals("delete")) {
		result=reviewMgr.deleteChildReview(email);
		result=userMgr.deleteUser(email);
	} 
	if(result){
%>
	  <script>
	    alert("처리하였습니다");
		location.href="UserMgr.jsp";
	  </script>
<%	}else{%>
	  <script>
	    alert("오류가 발생하였습니다.");
		location.href="UserMgr.jsp";
	  </script>
<%	}%>
</body>
</html>