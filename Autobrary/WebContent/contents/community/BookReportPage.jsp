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
<title>Slobrary - <%=currentPage%></title>
<link href="/css/allNeed.css" rel="stylesheet">
<link href="/css/bookReportPage.css" rel="stylesheet">
<%@ include file="/CND.jsp"%>
</head>
<body>
	<header>
		<jsp:include page="/Top.jsp" flush="false" />
	</header>
	<div class="container-fluid mb-5">
		<div class="row mt-4 pt-4 justify-content-md-center">
			<!-- sub nav -->
			<div class="col-xl-3 mr-n4">
				<jsp:include page="/SideMenuBar.jsp" flush="false">
					<jsp:param name="category" value="<%=category%>" />
					<jsp:param name="pageNames" value="<%=pageNames%>" />
					<jsp:param name="pageUrls" value="<%=pageUrls%>" />
					<jsp:param name="currentPage" value="<%=currentPage%>" />
				</jsp:include>
			</div>

			<section class="main-content col-xl-8 mt-3">
				<!-- title -->
				<h1 class="main-title">
					<i class="far fa-square"></i>
					<%=currentPage%>
				</h1>

				<table class="table contents mb-4" id="bookDiaryTable">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">도서명</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						</tr>
					</tbody>
				</table>

			</section>
		</div>
	</div>

	<jsp:include page="/Footer.jsp" flush="false" />
</body>
</html>