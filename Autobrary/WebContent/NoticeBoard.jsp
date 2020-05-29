<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String category = "안내사항";
	String pageNames = "공지사항, 도서관 일정";
	String pageUrls = "NoticeBoard.jsp, CalendarPage.jsp";
	String currentPage = "공지사항";
	request.setCharacterEncoding("UTF-8");
	
%>
<!DOCTYPE html>
<html>
<head>
<title>Slobrary - <%=currentPage%></title>
<%@ include file="/CND.jsp"%>
<link rel="stylesheet" href="/css/noticeBoard.css">
</head>
<body>
	<header>
		<jsp:include page="Top.jsp" flush="false" />
	</header>
	<div style="margin: 50px 150px;">
		<div class="wrapper mt-5">
		
			<jsp:include page="/SideMenuBar.jsp" flush="false">
				<jsp:param name="category" value="<%=category%>"/>
				<jsp:param name="pageNames" value="<%=pageNames%>"/>
				<jsp:param name="pageUrls" value="<%=pageUrls%>"/>
				<jsp:param name="currentPage" value="<%=currentPage%>"/>
			</jsp:include>
			
			<div id="content">
				<h1 class="mb-4"><%=currentPage%></h1>
				<table class="table table-striped table-hover table-notice-board">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>오늘의 공지사항</td>
							<td>2020.04.17</td>
							<td>0</td>
						</tr>
						<tr onClick="">
							<td>2</td>
							<td>오늘의 공지사항</td>
							<td>2020.04.17</td>
							<td>0</td>
						</tr>
						<tr>
							<td>3</td>
							<td>오늘의 공지사항</td>
							<td>2020.04.17</td>
							<td>0</td>
						</tr>
						<tr>
							<td>3</td>
							<td>오늘의 공지사항</td>
							<td>2020.04.17</td>
							<td>0</td>
						</tr>
						<tr>
							<td>3</td>
							<td>오늘의 공지사항</td>
							<td>2020.04.17</td>
							<td>0</td>
						</tr>
						<tr>
							<td>3</td>
							<td>오늘의 공지사항</td>
							<td>2020.04.17</td>
							<td>0</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="mt-5" style="margin-left: 250px;">
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
					<li class="page-item active"><a class="page-link" href="#">1<span
							class="sr-only">(current)</span></a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">다음</a></li>
				</ul>
			</nav>
			<form class="form-inline justify-content-center">
				<select class="custom-select">
					<option value="all" selected>전체</option>
				</select> <input type="text" class="form-control">
				<button type="submit" class="btn btn-outline-secondary">검색</button>
			</form>
		</div>
	</div>

	<jsp:include page="/Footer.jsp" flush="false" />
</body>
</html>