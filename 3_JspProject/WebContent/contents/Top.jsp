<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    
<link rel="stylesheet" href="<%=request.getContextPath()%>/contents/Top.css?after">
</head>
<body>
<%
	String check = (String) session.getAttribute("login");
	
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
                	<a class="navbar-brand" href="<%=request.getContextPath()%>/contents/main/Index.jsp">fork</a>
                </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="<%=request.getContextPath()%>/contents/foodMap/Map.jsp">맛집지도</a></li>
                    <li><a href="<%=request.getContextPath()%>/contents/hashTag/HashTagSearch.jsp">해시태그 검색</a></li>
                    <% if (check == null) {%>
                    	<li><a href="<%=request.getContextPath()%>/contents/login/Login.jsp">리뷰작성</a></li>
                    	<li><a href="<%=request.getContextPath()%>/contents/login/Login.jsp">로그인</a></li>
                    <% } else { %>
                    	<li><a href="<%=request.getContextPath()%>/contents/review/ReviewWrite.jsp">리뷰작성</a></li>
                  		<li><a href="<%=request.getContextPath()%>/contents/myPage/MyPage.jsp">마이페이지</a></li>
                  		<li><a href="<%=request.getContextPath()%>/contents/login/LogoutProc.jsp">로그아웃</a></li>
                  	<% } %>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>