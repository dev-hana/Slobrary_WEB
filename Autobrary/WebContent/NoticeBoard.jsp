<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="noticeMgr" class="database.NoticeMgr" />
<jsp:useBean id="admin" class="database.AdminSet" />	
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
<link href="/css/pagination.css" rel="stylesheet">
<link rel="stylesheet" href="/css/noticeBoard.css?v=1">
</head>
<body>
	<header>
		<jsp:include page="Top.jsp" flush="false" />
	</header>
	<div class="container-fluid mb-5">
		<div class="row mt-4 pt-4 justify-content-md-center">
			<div class="col-xl-3 mr-n5" id="menuid">
				<jsp:include page="/SideMenuBar.jsp" flush="false">
					<jsp:param name="category" value="<%=category%>" />
					<jsp:param name="pageNames" value="<%=pageNames%>" />
					<jsp:param name="pageUrls" value="<%=pageUrls%>" />
					<jsp:param name="currentPage" value="<%=currentPage%>" />
				</jsp:include>
			</div>
			<section class="main-content col-xl-8 mt-3" id="content">
				<h1 class="mb-1"><%=currentPage%></h1>
				<div class="table_div">
				<table class="table table-striped table-hover table-notice-board" id="noticeTable">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<%
							Vector vNotice = noticeMgr.getNoticeList();
							for(int i=0;i<vNotice.size();i++){
								NoticeBean noticeBean = (NoticeBean)vNotice.get(i);
								AdminBean adminBean = admin.getName(noticeBean.getAdmin_id());
						%>
						<tr>
							<td><%=i+1 %></td>
							<td class="alink"><a href="NoticeDetail.jsp?notice_id=<%=noticeBean.getNum()%>"><%=noticeBean.getName() %></a></td>
							<td class="date"><%=noticeBean.getDate().substring(0, 10) %></td>
							<td><%=adminBean.getName()%></td>
						</tr>
						
						<%
							}
						%>
					</tbody>
				</table>
			</div>
			</section>
		</div>
	</div>
	<jsp:include page="/Footer.jsp" flush="false" />
	<!-- dataTable js -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
<script>
	$(document).ready( function () {
	$("#noticeTable").DataTable({
    	// 표시 건수기능 숨기기 select로 몇개씩 표출할지
    	lengthChange: false,
    	
    	// 검색 기능 숨기기
    	searching: true,
    	
    	// 정렬 기능 숨기기
    	ordering: false,
    	
    	// 정보 표시 숨기기
    	info: false,
    	oLanguage: {
    	      sZeroRecords: "일치하는 공지사항이 없습니다."
    	    },
    	//몇개씩 보여줄지
    	displayLength: 5,
    	language: {
            paginate: {
                previous: '‹',
                next:     '›'
            }
        }
    });
  });
    </script>
</body>
</html>