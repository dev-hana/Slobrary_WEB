<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userBean" class="db.UserMgr" />
<jsp:useBean id="suBean" class="beans.SignUpBean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		if(userBean.setProfile(request)==true){
	%>
			<script type="text/javascript">
			alert("회원가입이 정상적으로 처리되었습니다.");
			</script>
	<%
			response.sendRedirect("Login.jsp");
		}else{
	%>
			<script type="text/javascript">
				alert("프로필 등록중 문제가 발생하였습니다.");
			</script>
	<%
		}
	%>
</body>
</html>