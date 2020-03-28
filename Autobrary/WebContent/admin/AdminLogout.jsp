<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- 

	작성자: 장지은
	파일 이름: AdminLogout.jsp
	목적: 로그아웃을 처리하기 위한_jsp

 --%>
<%
	session.removeAttribute("adminKey");
%>
<script>
    alert("로그아웃 되었습니다.");
	location.href="AdminLogin.jsp";
</script>
