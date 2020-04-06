<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userBean" class="db.UserMgr"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		String email = request.getParameter("email");
		String passwd=request.getParameter("password");
		boolean login = userBean.loginCheck(email,passwd);
		
		if(login){
			session.setAttribute("login","true");
			session.setAttribute("email",email);
	%>
			<script type="text/javascript">
				alert("로그인 되었습니다.");
				location.href="../main/Index.jsp";
			</script>
	<% 
		}else{
	%>
			<script type="text/javascript">
				alert("이메일과 비밀번호를 다시 입력해주세요");
				location.href="Login.jsp";
			</script>
	<%
		}
	%>
</body>
</html>