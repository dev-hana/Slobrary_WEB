<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
<link href="/css/pagination.css" rel="stylesheet">
<style>
.carousel-control-prev-icon {
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23BDBDBD' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E");
}

.carousel-control-next-icon {
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23BDBDBD' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E");
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

</style>
</head>
<body>
<div class="mt-1">
<%
	String type=request.getParameter("type");

	//리뷰리스트
	if(type.equals("review")){
		%>
		<table class="table table-borderless" id="logTable">
			<thead>
				<tr>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
			<%
				for(int i=0;i<8;i++){
			%>
				<tr>
					<td>
						<div class="p-3 border shadow-sm">
							<div class="review-title">
								<!-- 도서명 -->									<!-- 작성날짜 -->
								<span>아무도 나를 모를때</span><span class="ml-2 log-date">2020.09.09</span>
								<div class="modifybtn float-right">
									<button class="btn review-btn"><i class="fas fa-trash-alt"></i></button>
									<span class="ml-1">/</span>
									<button class="btn review-btn"><i class="fas fa-pencil-alt"></i></button>
								</div>
							</div>
							<hr>
							<div>
								<div class="review-star mt-n2">
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
								<div class="mt-2">
									<!-- 리뷰내용 -->
									독후감이란 독서 후 자신이 몰랐던 사실에 대해 느끼는 생각이나 내용에 대한 감상 등을 어떠한 형식으로든 구애받지 않고 자연스럽게 작성한 문서이다.
									독후감이란 독서 후 자신이 몰랐던 사실에 대해 느끼는 생각이나 내용에 대한 감상 등을 어떠한 형식으로든 구애받지 않고 자연스럽게 작성한 문서이다.
									독후감이란 독서 후 자신이 몰랐던 사실에 대해 느끼는 생각이나 내용에 대한 감상 등을 어떠한 형식으로든 구애받지 않고 자연스럽게 작성한 문서이다.
								</div>
							</div>
						</div>
					</td>
				</tr>
				<%} %>
			</tbody>
		</table>
		
		<%
	}else if(type.equals("diary")){
		%>
		<div class="p-3">
		<button type="button" class="btn btn-outline-secondary float-right col-xl-2 mb-3 btn-sm">일기쓰기</button>
		<%
		for(int i=0;i<5;i++){
	%>
		<table class="table table-bordered line mb-5">
			<tr>
				<td>
					<div>
						<span>나의 첫 독서 일기</span><span class="author ml-3">2020년 6월 23일</span>
						<div class="dropdown float-right">
					  		<button class="btn pl-2 pr-2" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    		<span style="color:#5D5D5D;"><i class="fas fa-ellipsis-v"></i></span>
					  		</button>
					  	<div class="dropdown-menu dropdown-menu-left" aria-labelledby="dropdownMenuButton">
					    	<a class="dropdown-item float-left" href="#">수정</a>
					    	<a class="dropdown-item float-left" href="#">삭제</a>
					  	</div>
					</div>
					
				</td>
			</tr>
			<tr>
				<td>
				<div id="imgCarousel<%=i %>" class="carousel slide" data-interval="false" data-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img class="d-block w-100" style="width:100%; height:50%; object-fit:contain;" src="/img/mem1.png" alt="First slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100" style="width:100%; height:50%; object-fit:contain;" src="/img/test.jpg" alt="Second slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100" style="width:100%; height:50%; object-fit:contain;" src="/img/ex2.jpg" alt="Third slide">
				    </div>
				  </div>
				  <a class="carousel-control-prev" href="#imgCarousel<%=i %>" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#imgCarousel<%=i %>" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
				<div class="p-3 mt-1 mb-1">
				일기는 날마다 그날그날 겪은 일이나 생각, 느낌 따위를 적는 개인의 기록을 가리킨다. 요즘은 다양한 방법으로 일기를 쓰는데, 그날 겪은 일 중에서 기억에 남는 일을 적기도 하지만, 특정한 테마를 갖고 일기를 작성하기도 한다. 독서일기장은 독서를 테마로 일기를 작성하는 것을 말하는데, 책을 읽고 느낀 점이나 생각한 바를 일기 형식을 빌어 작성하는 것이다. 평소에 쓰는 일기 쓰기 방식을 취하되, 내용이나 주제, 소재 등을 책에서 찾는 것이 다른 점이라 할 수 있다. 즉, 일반적인 일기가 자신의 감정을 표현하는 것이라면, 독서 일기는 책을 읽고 느낀 바나 생각한 바를 토대로 한다는 것이 다르다. 책의 주인공에게 편지를 쓰듯 일기를 쓰기도 하고, 줄거리를 요약한다거나 가장 인상 깊은 장면에 대해 쓰는 것도 독서일기장을 기록하는 방법이다.
				</div>
				</td>
			</tr>
		</table>
	<%
		}
		%>
		</div>
		<%
	}
%>
</div>
<!-- dataTable js -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript">
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