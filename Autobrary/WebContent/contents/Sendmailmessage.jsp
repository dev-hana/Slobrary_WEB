<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id = (String)request.getParameter("mem_id");
%>
<!DOCTYPE html>
<html>
<head>
<style>

h1 {
  text-align: center;
  text-transform: uppercase;
  color: #4CAF50;
}
 .btn {
 background-color:#4CAF50;
 font-weight:bold;
 color:#FFFFFF;
 border: none;
 border-radius:5px;
 text-align: center;}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="text-align:center;">
<h1>인증번호를 전송하였습니다.</h1>
<form name="checknum" method="post" action="Checknum.jsp">
<input type="hidden" name="mem_id" value=<%=mem_id %>>
<button class="btn" type="submit">확인</button>
</form>
</div>
<br>
</body>
</html>