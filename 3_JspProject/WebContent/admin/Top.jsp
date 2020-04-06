<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String check = (String) session.getAttribute("adminLogin");
%>
<!-- 메뉴바 -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <% if(check == null) { %>
                	<a class="navbar-brand" href="AdminLogin.jsp">fork</a>
                <% }else { %>
                	<a class="navbar-brand" href="UserMgr.jsp">fork</a>
                <% } %>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="UserMgr.jsp">회원관리</a></li>
                    <li><a href="ReviewMgr.jsp">리뷰관리</a></li>
                    <% if(check == null){ %>
                    	<li><a href="LoginProc.jsp?state=login">로그인</a></li>
                    	<li>            </li>
                    <% } else{ %>
                    	<li><a href="LoginProc.jsp?state=logout">로그아웃</a></li>
                    	<li><a><%=session.getAttribute("adminEmail")%>님 접속중</a></li>
                    <%} %>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>