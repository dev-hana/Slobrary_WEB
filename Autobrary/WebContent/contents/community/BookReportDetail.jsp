<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="reportMgr" class="database.ReportMgr" />
<%@ include file="/CND.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/boardDetail.css" rel="stylesheet">
</head>
<body>
<%
	ReportBean reportBean = reportMgr.getReport("2");
%>
	<jsp:include page="/Top.jsp" flush="false" />
	<div class="row mt-5 justify-content-md-center pb-5 mb-3">
	<div class="mWidth col-xl-9">
		<div class="pl-2 mb-4">
			<h3 class="mb-1">독후감</h3>
		</div>
		<div class="title bg-light pl-3 pr-3 pt-3 pb-2">
			<!-- 제목 -->
			<h5><%=reportBean.getName() %></h5>
		</div>
		<div class="content_info pl-3 pr-3 pt-2 pb-2">
			<span><strong class="mr-3">도서</strong>날씨가 좋으면 찾아가겠어요</span>
			<!-- 작성자-->
			<span><strong class="mr-3">작성자</strong><%=reportBean.getMem_id()%></span>
			<!-- 작성일 -->
			<span><strong class="mr-3">작성일</strong><%=reportBean.getReport_date()%></span>
		</div>
		<!-- 내용 -->
		<div class="content_content p-3">
			<%=reportBean.getContent()%>
		</div>
		<div class="p-2">
			<button type="button" onclick="history.back();" class="btn btn-outline-secondary mt-2 pr-4 pl-4">목록</button>
			<!-- 글작성자의 경우 수정버튼 보임 -->
			<button type="button" class="btn btn-outline-secondary mt-2 pr-4 pl-4 mr-2">수정</button>
		</div>
		
		<!-- 댓글 작성 -->
		<form>
		<div class="comment-write bg-light border shadow-sm p-5 mt-5 mb-4">
				<input type="hidden" name="report_id" value="<%=reportBean.getReport_id() %>" >
				<input type="hidden" name="mem_id" value="yangz">
				<textarea rows="5" class="form-control"></textarea>
				<button type="submit" class="btn btn-secondary">댓글입력</button>
		</div>
		</form>
		
		
		<div class="comments mt-3 pt-4">
		<span class="pl-3 pb-1"><h5>댓글</h5></span>
			<table class="table">
				<thead>
					<tr>
						<th>프로필 이미지</th>
						<th>댓글</th>
					</tr>
				</thead>
				<tbody>
				<%
						for(int i=0;i<4;i++){		
					%>
				<tr>
					<td class="userInfo p-3">
						<div class="p-4 img-wrap shadow-sm">
							<img src="/img/default/userImg/boy1.png">
						</div>
					</td>
					<td>
						<div class="p-3">
							<span class="user_id mr-4">yangz</span><span class="comment-date">2020.08.24</span>
							<p class="mt-2 comment">
								저도 어쩌구저쩌구어쩌구저쩌구 부분 A님과 동일한 생각을 하고 읽었네요!<br>
								감정선 부분에서 전 이러쿵저러쿵 생각했는데 A님처럼 어쩌구저쩌구어쩌구로 해석될 수 있군요.
							</p>
						</div>
					</td>
				</tr>
				<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
	</div><br><br><br><br>
	<jsp:include page="/Footer.jsp" flush="false" />
</body>
</html>