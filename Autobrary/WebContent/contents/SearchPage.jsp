<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>SLO-도서검색</title>
<%
	String category = "자료검색";
	String pageNames = "도서검색, 신간도서, 베스트셀러";
	String pageUrls = "SearchPage.jsp?contentPage=BookSearch.jsp, SearchPage.jsp?contetPage=Booklist.jsp?new, SearchPage.jsp?contentPage=Booklist.jsp?best";
	String currentPage = "자료검색";
	request.setCharacterEncoding("UTF-8");
	
	String contentPage=request.getParameter("contentPage");
	if(contentPage==null){
		contentPage="BookSearch.jsp";
	}
%>
</head>

<body>
	<header>
		<jsp:include page="/Top.jsp" flush="false" />
	</header>
	<div class="container-fluid mb-5">
		<div class="row mt-4 pt-4 justify-content-md-center">
			<div class="col-xl-3 overflow-auto">
				<jsp:include page="/SideMenuBar.jsp" flush="false">
				<jsp:param name="category" value="<%=category%>"/>
				<jsp:param name="pageNames" value="<%=pageNames%>"/>
				<jsp:param name="pageUrls" value="<%=pageUrls%>"/>
				<jsp:param name="currentPage" value="<%=currentPage%>"/>
				</jsp:include>
			</div>
			<div class="col-xl-8 mt-3 p-3" style="margin-left: -4rem;">
				<jsp:include page="<%=contentPage %>" flush="false" />
			</div>
		</div>
	</div>
	<jsp:include page="/Footer.jsp" flush="false" />
</body>

<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
</html>
