<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%
		String type = request.getParameter("type");
		String korType;
		if(type.equals("best")){
			korType = "베스트셀러";
		}else{
			korType="신간도서";
		}
%>
<meta charset="UTF-8">
<title>SLO-<%=korType %></title> 
<link href="/css/bookList.css" rel="stylesheet">
<!-- 아이콘 -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	
	<div class="mb-4 pl-3">
		<h3><span style="color:#A593E0;"><i class="fas fa-bookmark"></i></span>&nbsp;&nbsp;<%=korType %></h3>
	</div>
	<div>
		<table class="table" id="bookTable">
			<thead style="display: none;">
				 <tr><th>이미지</th><th>정보</th></tr>
			</thead>
			
			<tbody>
				<%
					//검색결과 개수 만큼 반복
					for(int i = 0; i<24; i++){
				%>
				<tr>
					<td class="img pt-3">
						<!-- 도서 이미지 -->
						<img class="shadow-sm" width="110" height="140" alt="이미지가 없습니다." src="/img/ex1.jpg">
					</td>
					<td>
					<!--오른쪽 끝 도서명 표시 -->					<!-- 도서명 클릭시 상세보기 페이지이동 파라메타로 책구분할 id -->													
					<span class="title mr-2"><strong>[&nbsp;도서&nbsp;]</strong></span><span class="alink">
					<a href="/contents/BookDetailPage.jsp?bookid=1234">
					날씨가 좋으면 찾아가곘어요<%=korType %></a></span><br>
					<!-- 별점 -->
					<div style="font-size: 17px;">
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
					<span class="mr-2" style="color:BDBDBD; font-size:0.7px;"><i class="fas fa-square-full"></i></span><span class="ap">저자 : 이도우</span><br>
					<!-- 출판사 -->
					<span class="mr-2" style="color:BDBDBD; font-size:0.7px;"><i class="fas fa-square-full"></i></span><span class="ap">출판사 : 김동양</span>
					
					<div class="mt-2 pr-2">
					<div class="pt-2 float-right">
							<!-- 상세보기버튼 onclick 주소에 도서id -->
							<button class="btn btn-outline-secondary" onclick="location.href='/contents/BookDetailPage.jsp?bookid=1234'" type="button">상세보기</button>
					</div>
					<div class="pt-2 pr-2 float-right">
					<!-- 관심도서 등록 form -->
						<form method="post" action="WatchBookProc.jsp">
							<!-- 도서id -->
							<input type="hidden" name="book_id" value="1234">
							<input type="hidden" name="type" value="register">
							<button class="btn btn-outline-secondary" type="submit">관심도서등록</button>
						</form>
					</div>
					</div>
					<!-- 도서상태 -->
					<div class="bg-light p-3">상태 : <span>&nbsp;&nbsp;대출가능</span></div>
					</td>
				</tr>
				
				<%
					}
				%>
				</tbody>
		</table>
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
    	searching: false,
    	
    	// 정렬 기능 숨기기
    	ordering: false,
    	
    	// 정보 표시 숨기기
    	info: false,
    	
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