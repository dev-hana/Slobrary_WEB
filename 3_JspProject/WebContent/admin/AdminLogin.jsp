<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 로그인</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<% 
	if (session.getAttribute("adminLogin") != null && session.getAttribute("adminLogin").equals("true"))
		response.sendRedirect("ReviewMgr.jsp");
%>
<body data-spy="scroll" data-target=".navbar" data-offset="60">
	<%@ include file="Top.jsp"%>
	<div class="container-fluid">
		<br />
		<br />
		<br />
		<h1 style="text-align: center">Admin Login</h1>
		<br />
			<br /> <span style="text-align: center; display: block">Login
				Please</span>
			<hr />
			<div class="well" >
			<br>
			<form method="post" action="LoginProc.jsp">
			
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <input id="email"
						type="text" class="form-control" name="adminEmail" placeholder="Email">
				</div>
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-lock"></i></span> <input id="password"
						type="password" class="form-control" name="adminPassword"
						placeholder="Password">
				</div>
				<br><br>
				<p style="text-align: center">
					<input type="submit" value="Login" class="btn btn-info gbtn" /> </a><br>
				</p>
			</form>
		</div>
	</div>
</body>
</html>