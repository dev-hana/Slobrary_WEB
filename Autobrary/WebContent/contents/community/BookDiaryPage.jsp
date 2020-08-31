<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String category = "커뮤니티";
	String pageNames = "도서 별점, 독서일기, 독후감, 자유게시판";
	String pageUrls = "ReviewPage.jsp, BookDiaryPage.jsp, " + "BookReportPage.jsp, CommunityPage.jsp";
	String currentPage = "독서 일기";
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Slobrary - <%=currentPage%></title>
<%@ include file="/CND.jsp"%>
<link href="/css/allNeed.css" rel="stylesheet">
<link href="/css/bookDiaryPage.css" rel="stylesheet">
<link rel="stylesheet" href="/css/selectBox.css">
</head>
<body>
	<header>
		<jsp:include page="/Top.jsp" flush="false" />
	</header>
	<div class="container-fluid mb-5">
		<div class="row mt-4 pt-4 justify-content-md-center">
			<!-- sub nav -->
			<div class="col-xl-3 mr-n4" id="menuid">
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
				<div class="goWriteBookDiary">
					<div class="text">
						<h1>
							<a href="/contents/SearchPage.jsp">도서 찾기</a>
						</h1>
						<p>
							오늘의 독서는 즐거우셨나요?<br> 독서 일기를 잊지말고 작성하여<br> 나의 독서 경험을 다른
							사람들과 함께 공유해요.
						</p>
					</div>
					<img src="/img/img-for-design/laptop_girl.svg" alt="">
				</div>

				<select name="keytype" class="sort">
					<option value="latest">최근 등록 순</option>
					<option value="oldest">오래된 순</option>
				</select>
				
				<!-- diaries -->
				<div class="diaries">
					<jsp:include page="/contents/community/DiaryFrame.jsp"
						flush="false" />
				</div>

				<div class="pagination">
					<ol>
						<li><a href="#" aria-label="go to previous page"
							class="disabled">이전</a></li>
						<li class="current-page"><a href="#"
							aria-label="Current page. go to page 1">1</a></li>
						<li><a href="#" aria-label="go to page 2">2</a></li>
						<li><a href="#" aria-label="go to page 3">3</a></li>
						<li><a href="#" aria-label="go to page 4">4</a></li>
						<li><a href="#" aria-label="go to page 5">5</a></li>
						<li><a href="#" aria-label="go to page 6">6</a></li>
						<li><a href="#" aria-label="go to page 7">7</a></li>
						<li><a href="#" aria-label="go to page 8">8</a></li>
						<li><a href="#" aria-label="go to next page">다음</a></li>
					</ol>
				</div>
			</section>
</body>
</html>