<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="adMgr" class="database.AdminSet" />

<% 
	String id = request.getParameter("id");
	boolean flag = adMgr.IdCheck(id);

%>

<html>
<head>
<title>ID중복체크</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<br>
	<center>
		<b><%=id %></b>
		<%
			if(flag) {
				out.println("는 사용 가능 합니다.<p>");
				%><script>
				opener.document.getElementById("id").value = mem_id;
				</script>
				<a href="javascript:this.close();">사용하기</a>
				<%
			}else {
				out.println("는 이미 존재하는 ID입니다.<p>");
				%><script>
				opener.document.getElementById("id").value = "";
				</script>
				<a href="javascript:this.close();">닫기</a>
			<%}%>
	</center>
</body>
</html>
