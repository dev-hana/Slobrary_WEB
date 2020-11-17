<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<%@ page import="java.util.*,java.util.regex.*, database.*" %>
<%@page import="bucketConnector.BucketManager"%>
<jsp:useBean id="reportMgr" class="database.ReportMgr" />
<jsp:useBean id="boardMgr" class="database.BoardMgr" />
<jsp:useBean id="bookMgr" class="database.BookMgr" />
<jsp:useBean id="reviewMgr" class="database.ReviewMgr" />
<jsp:useBean id="diaryMgr" class="database.DiaryMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
<link href="/css/pagination.css" rel="stylesheet">
<style>
/* 독후감 ,게시글 캐러셀 css  */
.carousel-control-prev-icon {
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23A593E0' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E") !important;
}

.carousel-control-next-icon {
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23A593E0' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E") !important;
}
.carousel-item{
	text-align:center;
}
.carousel-inner > .item > img {
  height: 40%;
  margin: 0 auto;
}
.community-contents iframe{
	width: 100% !important;
}
.line{
	border-bottom: 6px solid rgba(165,147,224,0.3) !important;
}
#logTable thead{
	display: none;
}
.review-star{
	font-size: 22px;
}
.review-btn i{
	font-size: 18px;
	color: #A6A6A6;
}
.review-btn{
	padding:5px !important;
}
.modifybtn{
	color: #A6A6A6;
}
.log-date{
	color: #A6A6A6;
	font-size: 13px;
}
.diary-write{
	display: flex;
	justify-content: flex-end;
}
.diary-content{
	display: flex;
}
.diary-sentence{
	text-align: center;
}
.diary-book{
	justify-content: center;
	align-item: center;
}
.quote{
	color: var(--main-color-dark);
}
.fieldset-style {
	border: 3px solid var(--main-color);
	border-radius: 15px;
	width: auto;
}
.fieldset-legend{
	color:var(--main-color);
	width: auto;
    margin-left: auto;
    margin-right: auto;
}
.notify-rtext i{
	font-size: 20px;;
	color:var(--main-color-light);
}
.notify-rtext span{
	font-weight: bold;
	color:var(--main-color-dark);
}
.diary-null .btn-outline-primary{
	border-radius: 20px !important;
	border-color: var(--main-color) !important;
	color : var(--main-color) !important;
}
.diary-null .btn-outline-primary:hover{
	background-color: var(--main-color) !important;
	color : white !important;
}
.diary-null .btn-outline-primary:active{
	border-color: var(--main-color) !important;
}
.diary-null .btn-outline-primary:focus {
  box-shadow: none !important;
  outline: none !important; 
}
.notify-rtext{
	font-size: 18px;
	font-weight: bold;
	color:#5D5D5D;
}
.commutity-text{
	border-top: 
}
/* link css */
.alink a:hover{
	color: black;
	text-decoration: underline;
}
.alink a:link { color: black;}
.alink a:visited { color: black; text-decoration: none;}
</style>
</head>
<body>
<div class="mt-1">
<%
	String mem_id = (String)session.getAttribute("loginKey");
	String type=request.getParameter("type");

	//리뷰리스트
	if(type.equals("review")){
		boolean review = true;
		//리뷰가 존재하는 경우 리스트 출력
		if(review != false){
		%>
		<table class="table table-borderless" id="logTable">
			<thead>
				<tr>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
			<%
				Vector Vreview = reviewMgr.getReviewList(mem_id);
				for(int i=0;i<Vreview.size();i++){
					ReviewBean reviewBean = (ReviewBean)Vreview.get(i);
					BookBean bookBean = bookMgr.getBook(reviewBean.getBook_id());
			%>
				<tr>
					<td>
						<div class="p-3 border shadow-sm">
							<div class="review-title">
								<!-- 도서명 -->									<!-- 작성날짜 -->
								<span>[<%=i+1 %>] <%=bookBean.getName() %></span><span class="ml-2 log-date"><%=reviewBean.getRv_date()%></span>
								<div class="modifybtn float-right">
									<button class="btn review-btn"><i class="fas fa-trash-alt"></i></button>
									<span class="ml-1">/</span>
									<button class="btn review-btn" onclick="modal_view('<%=i+"제목" %>','<%=i+"내용" %>','<%=i %>','<%=i %>')" data-toggle="modal" data-target="#reviewModal"><i class="fas fa-pencil-alt"></i></button>
								</div>
							</div>
							<hr>
							<div>
								<div class="review-star pl-2 mt-n2">
									<!-- 별점 -->
									<%
									double star=3.5;
									int fullStar = (int)Math.floor(star/1.0); //꽉찬별 개수
									boolean halfStar=false;
									
									// 0.5 경우 반별
									if(star-fullStar==0.5){
										halfStar=true;
									}
									
									for(int s=1;s<=5;s++){
										if(s<=fullStar){
										%>
											<span style="color:var(--main-color);"><i class="fas fa-star"></i></span>
										<%
										}else if(s>fullStar && halfStar==true){
											%>
											<span style="color:var(--main-color);"><i class="fas fa-star-half"></i></span>
											<span style="color:#B8B8B8; margin-left: -1.85rem;"><i class="fas fa-star-half fa-flip-horizontal"></i></span>
											<%
											if(s==5){
												break;
											}
											halfStar=false;
										}else{
										%>
											<span style="color:#B8B8B8;"><i class="fas fa-star"></i></span>
										<%
										}
									}
								%>
								</div>
								<div class="mt-2 p-2">
									<!-- 리뷰내용 -->
									<%=reviewBean.getContent()%>
									<%=reviewBean.getRating()%>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<%} %>
			</tbody>
		</table>
		<%
			}else{
		%>
			<!-- 리뷰가 없는 경우 -->
			<div class="review-null p-5 justify-content-center">
				<fieldset class="fieldset-style p-2 m-2">
				   <legend  class="fieldset-legend w-auto pl-3 pr-3"><i class="fas fa-quote-left"></i></legend>
				   <div class="notify-rtext text-center p-4 mb-3">
				   	 <i class="fas fa-star m-1"></i> 별점 리뷰가 없습니다<br>
				    <span>Slobrary</span>의 도서를 대출하고 리뷰를 남겨주세요!
				   </div>
				</fieldset>
			</div>
		<%
		}
	}else if(type.equals("diary")){
		
		boolean diary = true;
		//도서 일기가 있는 경우
		if(diary!=false){
	%>
		<!-- 일기 -->
		<div class="diary-write pr-3 mt-3">
		 <button type="button" class="btn btn-outline-secondary col-xl-2 mb-1 btn-sm">일기쓰기</button>
		</div>
		
		<table class="table table-borderless" id="logTable">
			<thead>
				<tr>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
			<%
				Vector vDiary = diaryMgr.getDiaryList(mem_id, "all");
				for(int i = 0; i < vDiary.size(); i++){
					DiaryBean diaryBean = (DiaryBean)vDiary.get(i);
					BookBean bookBean = bookMgr.getBook(diaryBean.getBook_id());
			%>
				<tr>
					<td>
						<div class="p-3 border shadow-sm">
							<div class="review-title">
								<!-- 도서명 -->									<!-- 작성날짜 -->
								<span><%=bookBean.getName()%></span><span class="ml-2 log-date"><%=diaryBean.getDiary_date().substring(0, 10)%></span>
								<div class="modifybtn float-right">
									<button class="btn review-btn"><i class="fas fa-trash-alt"></i></button>
									<span class="ml-1">/</span>							<!-- 타이틀 --><!-- 타이틀 -->
									<button class="btn review-btn" onclick="modal_view('<%=i %>','<%=i %>')" data-toggle="modal" data-target="#reviewModal"><i class="fas fa-pencil-alt"></i></button>
								</div>
							</div>
							<hr>
							<div class="diary-content">
								<div class="diary-book p-2 p-3">
									<img class="shadow-sm" width="110" height="140" src="<%=new BucketManager().base64DownLoader(bookBean.getImage())%>" alt="이미지가 없습니다">
								</div>
								<div class="diary-text p-1">
									<!-- 인상 깊은 구절 -->
									<div class="diary-sentence">
										<span class="quote"><i class="fas fa-quote-left"></i></span><span class="sentence"><%=diaryBean.getSentence()%></span><span class="quote"><i class="fas fa-quote-right"></i></span>
									</div>
									<div class="mt-3 p-2">
										<!-- 리뷰내용 -->
										<%=diaryBean.getContent()%>
									</div>
								</div>
							</div>
							
						</div>
					</td>
				</tr>
				<%} %>
			</tbody>
		</table>
	<%
			}else{
				//도서 일기가 없는 경우
			%>
				<div class="diary-null p-5 justify-content-center">
				<fieldset class="fieldset-style p-2 m-2">
				   <legend  class="fieldset-legend w-auto pl-3 pr-3"><i class="fas fa-quote-left"></i></legend>
				   <div class="notify-rtext text-center p-4 mb-2">
				   	 아직 독서 일기를 작성하지 않으셨습니다<br>
				   	독서하며 떠올린 생각, 감정들을 일기로 남기고<br>
				   	모두와 공유해보세요!<br>
				   	<button class="btn btn-outline-primary mt-3 pl-4 pr-4">일기 쓰기</button>
				   </div>
				</fieldset>
			</div>
			<%
			}
		}else if(type.equals("report")){
			boolean report = true;
			if(report){
			%>
				<div class="p-2 mt-3">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>도서명</th>
						</tr>
					</thead>
					<tbody>
					<%
					Vector Vreport = reportMgr.getReportList(null, "all");
					for(int i=0;i<Vreport.size();i++){
						ReportBean reportBean = (ReportBean)Vreport.get(i);		
						BookBean bookBean = bookMgr.getBook(reportBean.getBook_id());
					%>
						<tr>
							<td><%=i+1%></td>
							<td class="alink"><a href="/community/GoDetailProc.jsp?report_id=<%=reportBean.getReport_id()%>"><%=reportBean.getName() %></a></td>
							<td><%=bookBean.getName()%></td>
						</tr>
					<%}%>
					</tbody>
				</table>
				</div>
			<%
			}
		}else if(type.equals("community")){
			boolean community = true;
			if(community){
				%>
				<div class="p-2 mt-3">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
						</tr>
					</thead>
					<tbody>
					<%
					Vector Vboard = boardMgr.getBoardList(null, "all");
						for(int i=0;i<Vboard.size();i++){
							BoardBean boardBean = (BoardBean)Vboard.get(i);
					%>
						<tr>
							<td><%=i+1%></td>
							<td class="alink"><a href="/community/GoDetailProc.jsp?board_id=<%=boardBean.getBoard_id()%>"><%=boardBean.getTitle() %></a></td>
						</tr>
					<%}%>
					</tbody>
				</table>
				</div>
			<%
			}
		}
	%>
<jsp:include page="/contents/ReviewModal.jsp" flush="false" />
</div>		
<!-- dataTable js -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript">

function modal_view(title,content,star, loan_id) {
	$("#modalTitle").text(title + "-리뷰");
	$("#review-content").text(content);
	$("#halfstarsInput").val(star);
	$("#l_id").val(loan_id);
	
}

$(document).ready(function() {
	//이전 대출 목록 페이지네이션
	$('#logTable').DataTable({
		// 표시 건수기능 숨기기 select로 몇개씩 표출할지
		lengthChange : false,

		// 검색 기능 숨기기
		searching : false,

		// 정렬 기능 숨기기
		ordering : false,

		// 정보 표시 숨기기
		info : false,

		//dataTable 초기화 에러시 추가
		bDestroy : true,

		//몇개씩 보여줄지
		displayLength : 5,
		language : {
			paginate : {
				previous : '‹',
				next : '›'
			}
		}
	});
});
</script>
</body>
</html>
