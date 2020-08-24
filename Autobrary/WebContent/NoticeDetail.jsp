<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
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
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.title{
	border-top: 1.5px solid var(--main-color);
	color:#393939;
}
.notice_info{
	display: flex;
	border-top: 1px solid #D5D5D5;
	border-bottom: 1px solid #D5D5D5;
}
.notice_info span{
	width:35%;
}
.notice_content{
	border-bottom: 1px solid #8C8C8C;
}
.menu1{
	margin-right: -5em;
}
.btn-outline-secondary{
	float:right;
	border-radius: 0 !important;
	border-color: var(--main-color) !important;
	color : var(--main-color) !important;
}
.btn-outline-secondary:hover{
	background-color: var(--main-color) !important;
	color : white !important;
}
.btn-outline-secondary:active{
	border-color: var(--main-color-light) !important;
}
.btn-outline-secondary:focus {
  box-shadow: none !important;
  outline: none !important; 
}
</style>
</head>
<body>
	<jsp:include page="Top.jsp" flush="false" />
	<div class="row mt-5 justify-content-md-center pb-4">
	<div class="col-xl-3 menu1">
				<jsp:include page="/SideMenuBar.jsp" flush="false">
				<jsp:param name="category" value="<%=category%>"/>
				<jsp:param name="pageNames" value="<%=pageNames%>"/>
				<jsp:param name="pageUrls" value="<%=pageUrls%>"/>
				<jsp:param name="currentPage" value="<%=currentPage%>"/>
			</jsp:include>
	</div>
	<div class="col-xl-7">
		<div class="pl-2 mb-4">
			<h2 class="mb-1">공지사항</h2>
		</div>
		
		<div class="title bg-light p-3">
			<!-- 제목 -->
			<h4>안드로이드봇과 함께하는 슬기로운 코딩생활</h4>
		</div>
		<div class="notice_info pl-3 pt-2 pb-2">
			<!-- 작성자-->
			<span><strong class="mr-3">작성자</strong>양지현</span>
			<!-- 작성일 -->
			<span><strong class="mr-3">작성일</strong>2020.08.24</span>
		</div>
		<!-- 내용 -->
		<div class="notice_content p-3">
			코로나19 확산 방지를 위한 여수시립도서관 임시휴관으로,<br>
			8.29.(토)부터 운영 예정이었던 드론체험 프로그램을 중단하게 되었습니다.<br>
			불편을 드려 죄송합니다.<br><br><br>
			
		</div>
		<div class="p-2">
			<button type="button" onclick="history.back();" class="btn btn-outline-secondary mt-2 pr-4 pl-4">목록</button>
		</div>
	</div>
	</div>
</body>
</html>