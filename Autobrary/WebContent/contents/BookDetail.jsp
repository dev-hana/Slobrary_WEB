<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.book{
	font-size: 13px;
	color: #585858;
}
.table{
	text-align: center;
}
.author{
	font-size: 12px;
	color: #585858;
}
.bt{
	border-top: 2px solid #D8D8D8;
}
.detail{
	font-size:20px;
	font-weight: bold;
	color:#585858;
}
.list{
    border-radius: 0 !important;
}
.mem_id{
	color:#A4A4A4;
}
.date{
	color:#A4A4A4;
}
.reviews{
	text-align: left;
	font-size: 15px;
}
.none_rv{
	text-align: center;
	color: #8C8C8C;
}
</style>
<!-- dataTable pagination -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
 <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
</head>
<body>
			<div class="pl-3">
			<div class="pl-2">
				<span style="color:#A593E0; font-size:15px;" class="fa-stack mb-1"><i class="fas fa-info fa-stack-1x"></i><i class="far fa-circle fa-stack-2x"></i></span>
				<span class="detail">도서 상세보기</span>
				<div class="float-right pr-4"><button onclick="window.history.back()" class="btn btn-outline-secondary btn-sm pl-3 pr-3 mr-1 list">목록</button>
				<button class="btn btn-outline-info btn-sm pl-2 pr-2 list" onclick="location.href='SearchPage.jsp'">자료검색</button>
				</div>
			</div>
			</div>
			<div class="bg-white shadow-sm rounded p-5 m-4 border">
			<div class="mb-4">
				<div class="border p-2">
				<div class="m-2">
					<div class="bg-light p-2 pt-1 pb-1">
						<span class="border ml-1 mr-2 p-1 pr-2 pl-2 bg-white">도서명</span><span>내가 원하는 것을 나도 모를 때</span>
					</div>
				</div>
				
				<div class="mt-2 pr-2 pl-2" style="display: inline-block;">
					<table>
						<tr>
							<td rowspan="6" class="p-2 pl-3 pr-3 pb-2 mr-2"><img class="shadow-sm" width="130" height="170" alt="이미지가 없습니다." src="/img/ex2.jpg"></td>
							<td class="pr-4 pl-2">저자명</td>
							<td>이도우</td>
						</tr>
						<tr>
							<td class="pr-4 pl-2">출판사</td>
							<td>동양출판사</td>
						</tr>
						<tr>
							<td class="pr-4 pl-2">대분류</td>
							<td>문학</td>
						</tr>
						<tr>
							<td class="pr-4 pl-2">분류기호</td>
							<td>813.6</td>
						</tr>
						<tr>
							<td class="pr-4 pl-2">ISBN</td>
							<td>1235468654165</td>
						</tr>
						<tr>
							<td class="pr-4 pl-2">평점</td>
							<td>
								<div>
								<%
							double astar=3.5;
							int fullStar = (int)Math.floor(astar/1.0); //꽉찬별 개수
							boolean halfStar=false;
							
							// 0.5 경우 반별
							if(astar-fullStar==0.5){
								halfStar=true;
							}
							
							for(int s=1;s<=5;s++){
								if(s<=fullStar){
								%>
									<span style="color:#fcd703;"><i class="fas fa-star"></i></span>
								<%
								}else if(s>fullStar && halfStar==true){
									%>
									<span style="color:#fcd703;"><i class="fas fa-star-half"></i></span>
									<span style="color:#B8B8B8; margin-left: -1.35rem;"><i class="fas fa-star-half fa-flip-horizontal"></i></span>
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
									<span class="ml-2"><%=astar %></span>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="mt-5 pt-5 pr-2" style="float:right;">
						<form class="mt-5 pt-1">
							<input type="hidden" name="watch_id" value="1">
							<button class="btn btn-outline-secondary" type="submit">관심도서등록</button>
						</form>
				</div>
				</div>
				</div>
				
				<div>
				<div class="mt-5 mb-3 pl-3">
					<h6>소장정보</h6>
				</div>
				<div class=" pl-2 pr-2">
					<table class="table table-hover">
						<thead>
							<th>대출상태</th>
							<th>청구기호</th>
							<th>등록번호</th>
							<th>반납예정일</th>
						</thead>
				<%
					for(int i=0; i<4 ;i++){
				%>
						<tr>
							<td>대출불가[대출중]</td>
							<td>813.7-이25ㄴ</td>
							<td>SA0121445163</td>
							<td>2020-06-17</td>
						</tr>
			 	<%
					}
			 	%>
					</table>
				</div>
				</div>
				
				<div class="mt-4">
				<div class="mt-5 mb-2 pl-3">
							<!-- 리뷰개수 -->
					<span>도서리뷰 (13)</span>
					<div class="float-right">
						<button class="btn btn-sm border">리뷰작성</button>
					</div>
				</div>
				<div>
					<%
						boolean rs = false;
					 	//리뷰가 있는 경우
						if(rs){
					%>				
					<table class="table" id="review">
					<thead style="display: none;">
						<th>리뷰</th>
					</thead>
					<tbody>
						<%
							for(int k=0;k<13;k++){
						%>
						<tr>
							<td>
								<!-- 별점 -->
								<div class="float-left">
									<%
										int star=4;
										for(int i=1;i<=5;i++){
											if(i<=star){
											%>
												<span style="color:#fcd703;"><i class="fas fa-star"></i></span>
											<%
											}else{
											%>
												<span style="color:#B8B8B8;"><i class="fas fa-star"></i></span>
											<%
											}
										}
									%>
									<!-- 사용자 아이디 -->									<!-- 리뷰등록일 -->
									<span class="mem_id ml-2 mr-2">yangz</span><span class="date">2020-05-11</span><%=k %>
									</div>
									<br>
									<!-- 리뷰내용 -->
									<div class="p-1 reviews">
										드라마틱한 갈등없이 무던히 이어져오는 이야기에 시간 가는 줄 모르고 읽었습니다.
										겨울의 분위기와 아늑한 책방의 분위기를 읽음과 동시에 꿈을 꾸는 것 같앗습니다.
									</div>									
							</td>
						</tr>
						<%} %>
						</tbody>
					</table>
					<%
						}else{
						%>
							<div class="none_rv bg-light pt-5 pb-5 border mt-3">
								<div class="mb-2">
									<span style="color:#BDBDBD;"><i class="far fa-sticky-note fa-3x"></i></span>
								</div>
									<span>등록된 리뷰가 없습니다</span>
							</div>
						<%
						}
					%>
					</div>
				</div>
			</div>

<!-- paging js -->
<script>
    $(document).ready( function () {
    $('#review').DataTable({
    	// 표시 건수기능 숨기기 select로 몇개씩 표출할지
    	lengthChange: false,
    	
    	// 검색 기능 숨기기
    	searching: false,
    	
    	// 정렬 기능 숨기기
    	ordering: false,
    	
    	// 정보 표시 숨기기
    	info: false,
    	
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