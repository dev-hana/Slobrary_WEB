<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link href="/css/MyPageList.css?v=2" rel="stylesheet" />
</head>
<body>

	<%
		String type = request.getParameter("type");
	 	//type="interest";
		if(type.equals("loanbook")){
	%>
	<!-- 현재 대출중인 도서 -->
	<div class="pl-3 pb-2 pt-3">
		<h4>대출 도서</h4>
	</div>
	<table class="table">
		<%
			for(int i=0; i<3;i++){
				
		%>
		<tr>
			<td class="img pt-3">
				<img width="120" height="140" alt="이미지가 없습니다." src="/img/book2.jpg">
			</td>
			<td><span class="title">도서명 : <a class="linkA" href="#">내가 원하는 것을 나도 모를 때</a>	&nbsp;&nbsp;&#124;&nbsp;&nbsp;출판사 : 동양출판사&nbsp;&nbsp;&#124;&nbsp;&nbsp;발행연도 : 2020</span><br>
			<span>등록번호 : 15657-1564&nbsp;&nbsp;&#124;&nbsp;&nbsp;ISBN : 123456789123&nbsp;&nbsp;&#124;&nbsp;&nbsp;위치 : 675-4 가.5</span>
			<br><span class="loan">대출일&nbsp;</span><span>:&nbsp;2020/07/20</sapn>
			<br><span class="return">반납일&nbsp;</span><span>:&nbsp;2020/07/27</span>
			<br>
			<div class="bg-light p-3 mt-2">반납일까지&nbsp;<span class="loan">3일</span>&nbsp;남았습니다!</div>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}else if(type.equals("allrecord")){
	%>
		<!-- 모든 대출 기록 -->
		<div class="pl-3 pb-2 pt-3">
			<h4>이전 대출 기록</h4>
		</div>
				<table class="table">
				<%
					for(int i=0; i<3;i++){
				
				%>
					<tr>
						<td class="img pt-3">
							<img width="120" height="140" alt="이미지가 없습니다." src="/img/book2.jpg">
						</td>
						<td>
							<span class="title">도서명 : <a class="linkA" href="#">내가 원하는 것을 나도 모를 때</a>	&nbsp;&nbsp;&#124;&nbsp;&nbsp;출판사 : 동양출판사&nbsp;&nbsp;&#124;&nbsp;&nbsp;발행연도 : 2020</span><br>
							<span>등록번호 : 15657-1564&nbsp;&nbsp;&#124;&nbsp;&nbsp;ISBN : 123456789123&nbsp;&nbsp;&#124;&nbsp;&nbsp;위치 : 675-4 가.5</span>
							<br><span class="loan">대출일&nbsp;</span><span>:&nbsp;2020/07/20</sapn>
							<br><span class="loan">반납완료일&nbsp;</span><span>:&nbsp;2020/07/27</span>
							<br>
							<div class="bg-light p-3 mt-2">반납을 완료하였습니다!</div>
						</td>
					</tr>
			<%
				}
			%>
				</table>
	<%
		}else if(type.equals("interest")){
	%>
		<!-- 관심 도서 -->
		<div class="pl-3 pb-2 pt-3">
			<h4>관심 도서</h4>
		</div>
		<table class="table table">
		<%
			for(int i=0; i<3;i++){
				
		%>
		<tr>
			<td>
				<img width="120" height="140" alt="이미지가 없습니다." src="/img/book2.jpg">
			</td>
			<td><span>도서명 : <a class="linkA" href="#">내가 원하는 것을 나도 모를 때</a>	&nbsp;&nbsp;&#124;&nbsp;&nbsp;출판사 : 동양출판사&nbsp;&nbsp;&#124;&nbsp;&nbsp;발행연도 : 2020</span><br>
			<span>등록번호 : 15657-1564&nbsp;&nbsp;&#124;&nbsp;&nbsp;ISBN : 123456789123&nbsp;&nbsp;&#124;&nbsp;&nbsp;위치 : 675-4 가.5</span>
			<div class="mt-3 mb-2 pr-1" style="float:right;">
				<form>
					<!-- 관심도서 아이디 자리 -->
					<input type="hidden" name="watch_id" value="1">
					<button class="btn btn-outline-dark mb-5">관심도서삭제</button>
				</form>
			</div>
			<div class="bg-light p-3 mt-5"><span>상태 : 대출불가(대출중)</span></div>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}else if(type.equals("overdue")){
	%>
		<!-- 연체도서 -->
		<div class="pl-3 pb-2 pt-3">
			<h4>연체 도서</h4>
		</div>
				<table class="table">
				<%
					for(int i=0; i<3;i++){
				
				%>
					<tr>
						<td class="img pt-3">
							<img width="120" height="140" alt="이미지가 없습니다." src="/img/book2.jpg">
						</td>
						<td>
							<span class="title">도서명 : <a class="linkA" href="#">내가 원하는 것을 나도 모를 때</a>	&nbsp;&nbsp;&#124;&nbsp;&nbsp;출판사 : 동양출판사&nbsp;&nbsp;&#124;&nbsp;&nbsp;발행연도 : 2020</span><br>
							<span>등록번호 : 15657-1564&nbsp;&nbsp;&#124;&nbsp;&nbsp;ISBN : 123456789123&nbsp;&nbsp;&#124;&nbsp;&nbsp;위치 : 675-4 가.5</span>
							<br><span class="loan">대출일&nbsp;</span><span>:&nbsp;2020/07/20</sapn>
							<br><span class="return">반납일&nbsp;</span><span>:&nbsp;2020/07/27</span>
							<br>
							<div class="bg-light p-3 mt-2">반납일로부터&nbsp;&nbsp;<span class="overdate">3일</span>&nbsp;&nbsp;연체되었습니다.</div>
						</td>
					</tr>
			<%
				}
			%>
				</table>
	<%
		} 
	%>
</body>
</html>