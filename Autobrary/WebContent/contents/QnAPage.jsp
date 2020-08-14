<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Slobrary - 자주묻는질문</title>
<%@ include file="/CND.jsp"%>
<!-- css -->
<link href="/css/QnAPage.css" rel="stylesheet">
<%
	String type = request.getParameter("type");
 	String contentPage = "/contents/QnAList.jsp?type";
	if(type==null){
		contentPage = contentPage+"all";
	}else{
		contentPage = contentPage+type;
	}
%>
</head>
<body>
	<jsp:include page="/Top.jsp" flush="false"/>
	<div class="row justify-content-md-center mt-5">
		<div class="col-xl-9">	
			<div class="faq">
				<h2>자주묻는질문</h2>
			</div>
			<div class="pr-4 pl-4 mt-4 mb-4">
			<!-- 카테고리 -->
			<div class="navbar-category">
				<nav>
					<a class="active" href="/contents/QnAPage.jsp?type=all">전체</a>
					<a href="/contents/QnAPage.jsp?type=member">회원문의</a>
					<a href="/contents/QnAPage.jsp?type=book">자료이용</a>
					<a href="/contents/QnAPage.jsp?type=etc">기타</a>
				</nav>
			</div>
			<div>
			</div>
			</div>
			<div class="list pr-4 pl-4 mt-4">
				<jsp:include page="<%=contentPage %>" flush="false"/>
			</div>
		</div>
	</div>
	<br><br><br>
</body>
</html>