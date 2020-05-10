<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memMgr" class="database.MemMgr" />

 <%
    String mem_id = (String)session.getAttribute("loginKey");
 
 	if(mem_id == null) {
 		%>
 		<ul class="navbar-nav navbar-right">
    		<li class="nav-item"> <a href="Login.jsp" class="nav-link">로그인</a></li>
   			<li class="nav-item"> <a href="Signup.jsp" class="nav-link ">회원가입</a></li>
		 </ul>
 		<%
 	}
 	
 	else {
  %>
<div></div>
 <%}%>