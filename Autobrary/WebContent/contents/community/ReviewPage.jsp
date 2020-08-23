<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String category = "커뮤니티";
	String pageNames = "도서 별점, 독서일기, 독후감, 자유게시판";
	String pageUrls = "ReviewPage.jsp, BookDiaryPage.jsp, " + "BookReportPage.jsp, CommunityPage.jsp";
	String currentPage = "도서 별점";
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Slobrary - <%=currentPage%></title>
<%@ include file="/CND.jsp"%>
<link href="/css/allNeed.css" rel="stylesheet">
<link href="/css/reviewPage.css" rel="stylesheet">
<link rel="stylesheet" href="/css/selectBox.css">
</head>
<body>
	<header>
		<jsp:include page="/Top.jsp" flush="false" />
	</header>
	<div class="container-fluid mb-5">
		<div class="row mt-4 pt-4 justify-content-md-center">
			<!-- sub nav -->
			<div class="col-xl-3 mr-n4 overflow-auto">
				<jsp:include page="/SideMenuBar.jsp" flush="false">
					<jsp:param name="category" value="<%=category%>" />
					<jsp:param name="pageNames" value="<%=pageNames%>" />
					<jsp:param name="pageUrls" value="<%=pageUrls%>" />
					<jsp:param name="currentPage" value="<%=currentPage%>" />
				</jsp:include>
			</div>

			<section class="main-content col-xl-8 mt-3 p-2">
				<!-- title -->
				<h1 class="main-title">
					<i class="far fa-square"></i>
					<%=currentPage%>
				</h1>

				<!-- search bar -->
				<div style="text-align: center; border: 1px solid #EAEAEA;"
					class="mt-2 mb-5 pt-3">
					<div id="search-form">

						<div style="display: inline-block;" class="sel sel--black-panther">
							<select name="keytype" id="select-profession">
								<option value="all">전체</option>
								<option value="all">전체</option>
								<option value="title">도서명</option>
								<option value="author">저자</option>
								<option value="publisher">출판사</option>
							</select>
						</div>

						<div style="display: inline-block; border: 1px solid #EAEAEA;"
							class="col-xl-7 p-2 bg-white rounded rounded-pill shadow-sm mb-4">
							<div class="input-group">
								<input id="keyword" name="keyword" onkeypress="enter_search()"
									type="search" placeholder="도서 검색 (책 이름, 작가명, 출판사명)"
									aria-describedby="button-addon"
									class="form-control border-0 bg-white">
								<div class="input-group-append">
									<button id="button-addon" class="btn btn-link">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- reviews -->
				<div class="reviews">
					<jsp:include page="/contents/community/ReviewFrame.jsp"
						flush="false" />
				</div>

			</section>
		</div>
	</div>
	<jsp:include page="/Footer.jsp" flush="false" />
	<script src="/js/bookSearch.js"></script>
</body>
</html>