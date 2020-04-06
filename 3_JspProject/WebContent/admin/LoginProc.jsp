<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="admin" class="db.UserMgr" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		String email = request.getParameter("adminEmail");
		String passwd = request.getParameter("adminPassword");
		String state = request.getParameter("state");
		boolean login = admin.adminCheck(email,passwd);
		if(state==null || state.equals("")) {
			if(login){
				session.setAttribute("adminLogin","true");
				session.setAttribute("adminEmail",email);
	%>
				<script type="text/javascript">
					alert("로그인 되었습니다.");
					location.href="UserMgr.jsp";
				</script>
	<%
				
			}else{
	%>
			<script type="text/javascript">
				alert("아이디/비밀번호를 다시 확인해주세요.");
				location.href="AdminLogin.jsp";
			</script>
	<%
			}
		}else if (state.equals("login")) {
			response.sendRedirect("AdminLogin.jsp");
		}else if(state.equals("logout")) {
			session.removeAttribute("adminEmail");
			session.removeAttribute("adminLogin");
	%>
			<script type="text/javascript">
				alert("로그아웃 되었습니다.");
				location.href="AdminLogin.jsp";
			</script>
	<%
		}
	%>
</body>
</html>