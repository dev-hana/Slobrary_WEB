<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="bucketConnector.BucketManager"%>
<%@ include file="/CND.jsp" %>
<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="bookMgr" class="database.BookMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SLO</title> 
<style type="text/css">
.newInfo{
 display: flex;
 justify-content: center;
 align-item: center;
 border: 2px solid #EAEAEA;
}
.newIcon img{
	width:190px;
	height: 160px;
}
.bestIcon img{
	width:300px;
	height: 200px;
}
.info hr{
	border-top: 1px dashed #bbb;
}
.info{
	align-self: center;
	width:70%;
}
.info h5{
	color:var(--main-color-dark);
	font-weight: bold;
}
.info p{
	color:#848484;
}

.bookCount{
	color:#DE4F4F;
}
.count h6{
color:#747474;
}
.dataTables_filter{
	color:white;
	float:right;
	 
  -ms-user-select: none; 
  -moz-user-select: -moz-none;
  -khtml-user-select: none;
  -webkit-user-select: none;
  user-select: none;
}
.count h6{
	position: relative;
	bottom:-58px;
}
.best hr{
	border-top: 1px dashed #bbb;
}
.best{
	align-self: center;
	width:60%;
}
.best h5{
	color:var(--main-color-dark);
	font-weight: bold;
}
.best p{
	color:#848484;
}
</style>
<link href="/css/bookList.css" rel="stylesheet">
<link href="/css/pagination.css" rel="stylesheet">
<!-- 아이콘 -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%
		String type =request.getParameter("type");
		String korType;
		
		if(type.equals("best")){
			korType = "베스트셀러";
		}else{
			korType="신간도서";
		}
	%>
	<div class="mb-4 pl-3">
		<h3><span style="color:#A593E0;"><i class="fas fa-bookmark"></i></span>&nbsp;&nbsp;<%=korType %></h3>
	</div>
	<div>
	<%
		//신간도서
		if(type.equals("new")){
	%>
	<div class="newInfo p-4 mt-5 mb-4">
		<div class="newIcon">
			<img src="/img/books.jpg"/> <!-- <a href="https://www.freevector.com/stack-of-books-clipart-vector-30222#">FreeVector.com</a> -->
		</div>
		<div class="info ml-4">
			<h5>신간도서</h5>
			<p>Slobrary의 입고된 신간도서로 새롭게 출간되는 도서리스트 입니다.<br>
			새로나온 책을 확인하실 수 있는 서비스 입니다.</p>
			<hr>
		</div>
	</div>
	<div class="count mb-2 pl-2">
									<!-- 신간도서 개수 -->
		<h6>총<span class="bookCount"> 24권</span>의 신간도서가 등록되어 있습니다.</h6>
	</div>
	<table class="table" id="bookTable">
			<thead style="display: none;">
				 <tr><th>이미지</th><th>정보</th></tr>
			</thead>
			
			<tbody>
				<%
					//검색결과 개수 만큼 반복
					Vector vNew = bookMgr.getNewList(10);
					for(int i = 0; i<vNew.size(); i++){
						BookBean bookBean = (BookBean)vNew.get(i);
				%>
				<tr>
					<td class="img pt-3">
						<!-- 도서 이미지 -->
						<img class="shadow-sm" width="110" height="140" alt="<%=bookBean.getId_num() %>" src="<%=new BucketManager().base64DownLoader(bookBean.getImage())%>">
					</td>
					<td>																	
					<span class="title mr-2"><strong>[&nbsp;도서&nbsp;]</strong></span><span class="alink">
					<!-- 도서명 클릭시 상세보기 페이지이동 파라메타로 책구분할 id -->    <!--도서명 표시 -->
					<a href="/contents/BookDetailPage.jsp?bookid=<%=bookBean.getId_num()%>"><%=bookBean.getName() %></a></span><br>
					<!-- 별점 -->
					<div style="font-size: 17px;">
								<%
									RatingBean ratingBean = bookMgr.getBookrating(bookBean.getId_num());
								
									double star=Double.parseDouble(ratingBean.getRating());
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
											<span style="color:#B8B8B8; margin-left: -1.5rem;"><i class="fas fa-star-half fa-flip-horizontal"></i></span>
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
								<!-- 별점 숫자 표기 -->
								<span class="point ml-2"><%=star %></span>
							</div>
					<!-- 저자 -->
					<div>
					<span class="mr-2" style="color:BDBDBD; font-size:0.7px;"><i class="fas fa-square-full"></i></span><span class="ap">저자 : <%=bookBean.getAuthor() %></span><br>
					<!-- 출판사 -->
					<span class="mr-2" style="color:BDBDBD; font-size:0.7px;"><i class="fas fa-square-full"></i></span><span class="ap">출판사 : <%=bookBean.getPublisher() %></span>
					</div>
					<div id="btnbstatus">
					<div class="mt-2 pr-2" id="btnboxs">
					<div class="pt-2 float-right">
							<!-- 상세보기버튼 onclick 주소에 도서id -->
							<button class="btn btn-outline-secondary" onclick="location.href='/contents/BookDetailPage.jsp?bookid=<%=bookBean.getId_num() %>'" type="button">상세보기</button>
					</div>
					<div class="pt-2 pr-2 float-right">
					<!-- 관심도서 등록 form -->
						<form method="post" action="WatchBookProc.jsp">
							<!-- 도서id -->
							<input type="hidden" name="book_id" value="<%=bookBean.getId_num()%>">
							<input type="hidden" name="type" value="register">
							<button class="btn btn-outline-secondary" type="submit">관심도서등록</button>
						</form>
					</div>
					</div>
					<!-- 도서상태 -->
					<div class="bg-light p-3">상태 : <span>&nbsp;&nbsp;<%=bookBean.getStatus() %></span></div>
					</div>
					</td>
				</tr>
				
				<%
					}
				%>
				</tbody>
		</table>
	<%}else{Vector vResult = bookMgr.getBestList(0);
	%>
	<div class="newInfo p-4 mt-5 mb-4">
		<div class="bestIcon pr-3">
			<img src="/img/best.jpg"/> <!-- <a href='https://www.freepik.com/vectors/technology'>Technology vector created by pch.vector - www.freepik.com</a> -->
		</div>
		<div class="best ml-4">
			<h5>베스트셀러</h5>
			<p>Slobrary의 종합 베스트셀러<br>
			대출하고 있는 도서중 대출건수가 많은 도서를 보여 드립니다.</p>
			<hr>
		</div>
	</div>
	<div class="count mb-2 pl-2">
		<h6>종합 TOP100</h6>
	</div>
	<table class="table" id="bookTable">
			<thead style="display: none;">
				 <tr><th>이미지</th><th>정보</th></tr>
			</thead>
			
			<tbody>
				<%
					//검색결과 개수 만큼 반복
					for(int i = 0; i<vResult.size(); i++){
						BestBean bestBean = (BestBean)vResult.get(i);
						BookBean bookBean = bookMgr.getBook(bestBean.getId_num());
				%>
				<tr>
					<td class="img pt-3">
						<!-- 도서 이미지 -->
						<img class="shadow-sm" width="110" height="140" alt="<%=bestBean.getId_num() %>" src="<%=new BucketManager().base64DownLoader(bookBean.getImage())%>">
					</td>
					<td>																	
					<span class="title mr-2"><strong>[&nbsp;도서&nbsp;]</strong></span><span class="alink">
					<!-- 도서명 클릭시 상세보기 페이지이동 파라메타로 책구분할 id -->    <!--도서명 표시 -->
					<a href="/contents/BookDetailPage.jsp?bookid=<%=bookBean.getId_num()%>"><%=bookBean.getName() %></a></span><br>
					<!-- 별점 -->
					<div style="font-size: 17px;">
								<%
									RatingBean ratingBean = bookMgr.getBookrating(bookBean.getId_num());
								
									double star=Double.parseDouble(ratingBean.getRating());
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
											<span style="color:#B8B8B8; margin-left: -1.5rem;"><i class="fas fa-star-half fa-flip-horizontal"></i></span>
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
								<!-- 별점 숫자 표기 -->
								<span class="point ml-2"><%=star %></span>
							</div>
					<!-- 저자 -->
					<div>
					<span class="mr-2" style="color:BDBDBD; font-size:0.7px;"><i class="fas fa-square-full"></i></span><span class="ap">저자 : <%=bookBean.getAuthor() %></span><br>
					<!-- 출판사 -->
					<span class="mr-2" style="color:BDBDBD; font-size:0.7px;"><i class="fas fa-square-full"></i></span><span class="ap">출판사 : <%=bookBean.getPublisher() %></span>
					</div>
					<div id="btnbstatus">
					<div class="mt-2 pr-2" id="btnboxs">
					<div class="pt-2 float-right">
							<!-- 상세보기버튼 onclick 주소에 도서id -->
							<button class="btn btn-outline-secondary" onclick="location.href='/contents/BookDetailPage.jsp?bookid=<%=bookBean.getId_num() %>" type="button">상세보기</button>
					</div>
					<div class="pt-2 pr-2 float-right">
					<!-- 관심도서 등록 form -->
						<form method="post" action="WatchBookProc.jsp">
							<!-- 도서id -->
							<input type="hidden" name="book_id" value="<%=bookBean.getId_num()%>">
							<input type="hidden" name="type" value="register">
							<button class="btn btn-outline-secondary" type="submit">관심도서등록</button>
						</form>
					</div>
					</div>
					<!-- 도서상태 -->
					<div id="bstatus" class="bg-light p-3">상태 : <span>&nbsp;&nbsp;<%=bookBean.getStatus() %></span></div>
					</div>
					</td>
				</tr>
				
				<%
					}
				%>
				</tbody>
		</table>
	<%}%>
	</div>
<!-- dataTable js -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
<script type='text/javascript'>  
	var $jq = jQuery.noConflict(true);  
</script>
	<script>
	$jq(document).ready( function () {
	$jq("#bookTable").DataTable({
    	// 표시 건수기능 숨기기 select로 몇개씩 표출할지
    	lengthChange: false,
    	
    	// 검색 기능 숨기기
    	searching: true,
    	
    	// 정렬 기능 숨기기
    	ordering: false,
    	
    	// 정보 표시 숨기기
    	info: false,
    	oLanguage: {
    	      sZeroRecords: "일치하는 도서가 없습니다!"
    	    },
    	//몇개씩 보여줄지
    	displayLength: 10,
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