<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
</style>
</head>
<body>
	<table class="table table-bordered">
		<%
			for(int i=0; i<1;i++){
				
		%>
		<tr>
			<td>
				<img width="120" height="140" alt="이미지가 없습니다." src="/img/book2.jpg">
			</td>
			<td><span>도서명 : <a href="#">내가 원하는 것을 나도 모를 때</a>	&nbsp;&nbsp;&#124;&nbsp;&nbsp;출판사 : 동양출판사&nbsp;&nbsp;&#124;&nbsp;&nbsp;발행연도 : 2020</span><br>
			<span>등록번호 : 15657-1564&nbsp;&nbsp;&#124;&nbsp;&nbsp;ISBN : 123456789123&nbsp;&nbsp;&#124;&nbsp;&nbsp;위치 : 675-4 가.5</span>
			<span>대출일 : 2020/07/20</sapn>
			<span>반납일</span>
			<br>
			<div></div>
			<div class="bg-light p-3 mt-5"><span>상태 : 대출불가(대출중)</span></div>
			</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>