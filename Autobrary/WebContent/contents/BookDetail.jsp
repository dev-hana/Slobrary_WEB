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

</style>
</head>
<body class="bg-light">
	<jsp:include page="../Top.jsp" flush="false"/>
	<div class="container">
		<div class="row mt-4 justify-content-md-center">
			<div class="col-xl-8 bg-white shadow-sm rounded p-5 m-4">
			<div class="mb-4">
				<div class="border p-2 rounded">
				<div class="m-2">
					<div class="bg-light p-2 pt-1 pb-1">
						<span class="border ml-1 mr-2 p-1 pr-2 pl-2 bg-white">도서명</span><span>내가 원하는 것을 나도 모를 때</span>
					</div>
				</div>
				
				<div class="mt-2 pr-2 pl-2" style="display: inline-block;">
					<table>
						<tr>
							<td rowspan="6" class="p-2 pl-3 pr-3 pb-2 mr-2"><img width="130" height="170" alt="이미지가 없습니다." src="/img/book2.jpg"></td>
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
							<td class="pr-4 pl-2">소분류</td>
							<td>문학2</td>
						</tr>
						<tr>
							<td class="pr-4 pl-2">분류기호</td>
							<td>813.6</td>
						</tr>
						<tr>
							<td class="pr-4 pl-2">ISBN</td>
							<td>1235468654165</td>
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
				
				<div class="mt-2">
				<div class="mt-5 mb-3 pl-3">
					<span>
						<h6>이 책과 저자가 같은(동명인) 도서</h6>
					</span>
				</div>
				<div class="pl-2 pr-2"">
					<table class="table table-borderless pl-2 pr-2 bt ">
						<tr>
							<td class="pt-4">
								<img width="115" height="160" alt="이미지가 없습니다." src="/img/book2.jpg">
							</td>
							<td class="pt-4">
								<img width="115" height="160" alt="이미지가 없습니다." src="/img/book2.jpg">
							</td>
							<td class="pt-4">
								<img width="115" height="160" alt="이미지가 없습니다." src="/img/book2.jpg">
							</td>
							<td class="pt-4">
								<img width="115" height="160" alt="이미지가 없습니다." src="/img/book2.jpg">
							</td>
						</tr>
						<tr>
							<td>
								<span class="book">내가 원하는 것을...</span><br><span class="author">이도우</span>
							</td>
							<td>
								<span class="book">내가 원하는 것을...</span><br><span class="author">이도우</span>
							</td>
							<td>
								<span class="book">내가 원하는 것을...</span><br><span class="author">이도우</span>
							</td>
							<td>
								<span class="book">내가 원하는 것을...</span><br><span class="author">이도우</span>
							</td>
						</tr>
					</table>
					<hr>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>