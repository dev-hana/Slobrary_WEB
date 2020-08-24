<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="noticeMgr" class="database.NoticeMgr" />
<jsp:useBean id="admin" class="database.AdminSet" />
<%
	String category = "안내사항";
	String pageNames = "공지사항, 도서관 일정";
	String pageUrls = "NoticeBoard.jsp, CalendarPage.jsp";
	String currentPage = "공지사항";
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("notice_id");
	NoticeBean noticeBean = noticeMgr.getNotice(id);
	AdminBean adminBean = admin.getName(noticeBean.getAdmin_id());
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
	border-bottom: 1px solid #D5D5D5;
	min-height: 300px;
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
	<div class="row mt-5 justify-content-md-center pb-5 mb-3">
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
		
		<div class="title bg-light pl-3 pt-3 pb-2">
			<!-- 제목 -->
			<h5><%=noticeBean.getName() %></h5>
		</div>
		<div class="notice_info pl-3 pt-2 pb-2">
			<!-- 작성자-->
			<span><strong class="mr-3">작성자</strong><%=adminBean.getName()%></span>
			<!-- 작성일 -->
			<span><strong class="mr-3">작성일</strong><%=noticeBean.getDate().substring(0, 10) %></span>
		</div>
		<!-- 내용 -->
		<div class="notice_content p-3">
			<%=noticeBean.getContent() %>
		</div>
		<div class="p-2">
			<button type="button" onclick="history.back();" class="btn btn-outline-secondary mt-2 pr-4 pl-4">목록</button>
		</div>
	</div>
	</div>
</body>
</html>