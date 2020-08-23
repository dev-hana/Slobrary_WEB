<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String category = "커뮤니티";
	String pageNames = "도서 별점, 독서일기, 독후감, 자유게시판";
	String pageUrls = "ReviewPage.jsp, BookDiaryPage.jsp, " + "BookReportPage.jsp, CommunityPage.jsp";
	String currentPage = "독후감";
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Slobrary - <%=currentPage %></title>
<link href="css/index.css?v=5" rel="stylesheet">
<%@ include file="/CND.jsp"%>
<style>
	.body {
		display: flex;
	}
	
	.body .title {
		font-size: 2em;
		margin-bottom: 30px;
	}
	
	.body .title i{
		color: var(--main-color);
	}
</style>
	<style>
thead {
	background-color: var(- -main-color);
}

tr {
	transition: background-color 0.3s;
	-webkit-transition: background-color 0.3s;
	transition-timing-function: ease-in-out;
	-webkit-transition-timing-function: ease-in-out;
}

tr:hover {
	background-color: var(--main-color-light);
}
</style>
</head>
<body>
	<header>
		<jsp:include page="/Top.jsp" flush="false" />
	</header>
	
	<div class="body">
	<jsp:include page="/SideMenuBar.jsp" flush="false">
		<jsp:param name="category" value="<%=category%>" />
		<jsp:param name="pageNames" value="<%=pageNames%>" />
		<jsp:param name="pageUrls" value="<%=pageUrls%>" />
		<jsp:param name="currentPage" value="<%=currentPage%>" />
	</jsp:include>
	
	<h1 class="title">
		<i class="far fa-square"></i>
		<%=currentPage%>
	</h1>

	<table class="table contents mb-4" id="bookDiaryTable">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">도서명</th>
				<th scope="col">제목</th>
				<th scope="col">출판사</th>
				<th scope="col">상태</th>
				<th scope="col">신청날짜</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td><%=wishBean.getName() %></td>
				<td><%=wishBean.getAuthor() %></td>
				<td><%=wishBean.getPublisher() %></td>
				<td><%=wishBean.getStatus() %></td>
				<td><%=wishBean.getWish_date() %></td>
			</tr>
		</tbody>
	</table>
	
	
	</div>
	
	<jsp:include page="/Footer.jsp" flush="false" />
</body>
</html>