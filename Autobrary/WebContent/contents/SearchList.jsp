<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.img{
	text-align: center;
}
</style>
</head>
<body>
 <div class="row bg-light justify-content-md-center">
  <div class="col-xl-7 bg-white shadow-sm rounded p-3">
  	<div class="mt-3 mb-3">
  		<h4>검색결과</h4>
  	</div>
	<table class="table">
		<%
			for(int i=0; i<5;i++){
				
		%>
		<tr>
			<td class="img pt-3">
				<img width="110" height="140" alt="이미지가 없습니다." src="/img/book2.jpg">
			</td>
			<td><span class="title">도서명 : <a href="#">내가 원하는 것을 나도 모를 때</a>	&nbsp;&nbsp;&#124;&nbsp;&nbsp;저자 : 이도우&nbsp;&nbsp;&#124;&nbsp;&nbsp;출판사 : 동양출판사</span>
			
			<div class="p-3">
			<div style="float:right;" class="mt-5">
					<form>
					<input type="hidden" name="watch_id" value="1">
					<button class="btn btn-outline-secondary" type="submit">상세보기</button>
				</form>
			</div>
			<div class="pr-2 mt-5" style="float:right;">
				<form>
					<input type="hidden" name="watch_id" value="1">
					<button class="btn btn-outline-secondary" type="submit">관심도서등록</button>
				</form>
			</div>
			</div>
			<div class="bg-light p-3 mt-4">상태: <span>&nbsp;&nbsp;대출가능</span></div>
			</td>
		</tr>
		
		<%
			}
		%>
	</table>
	</div>
</div>
</body>
</html>