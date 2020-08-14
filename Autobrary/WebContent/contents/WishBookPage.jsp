<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="bookMgr" class="database.BookMgr" />

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Slobrary - 희망도서</title>
	<%@ include file="/CND.jsp"%>
	<link href="/css/wishBookPage.css" rel="stylesheet">
</head>

<body>
	</form>
	<header>
		<jsp:include page="/Top.jsp" flush="false" />
	</header>
	<div class="applyForWishBook">
		<h1>
			<a href="/contents/WishBook.jsp">희망 도서 신청</a>
		</h1>
		<p>
			<small>
				현재 SLOBRARY에서는 <b>0</b>권의 책을 읽을 수 있어요!
			</small>
			<br>
			내가 읽고 싶은 책, 다른 사람들에게 추천하고 싶은 책,<br>
			SLOBRARY에 없다면?
			<span class="sr-only">
				희망도서를 신청하세요!
			</span>
		</p>
		<img src="/img/wishBookPage/main-welcome.png" alt="">
	</div>

	<div class="myApplyList">
		<h1>나의 신청 내역</h1>
		<%
		String mem_id = (String)session.getAttribute("loginKey");
		if(mem_id==null) {
	%>
		<div class="contents ">
			<p>로그인 후 이용해주세요</p>
			<a href="/Login.jsp">로그인</a>
		</div>
		<%} else{
		Vector List = bookMgr.getWishList(mem_id); %>
		<table class="table contents">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">도서명</th>
					<th scope="col">저자명</th>
					<th scope="col">출판사</th>
					<th scope="col">상태</th>
					<th scope="col">신청날짜</th>
				</tr>
			</thead>
			<tbody>
				<%
			for(int i = 0; i<List.size(); i++) {
				WishBean wishBean = (WishBean)List.get(i);
		%>
				<tr>
					<th scope="row"><%=i + 1 %></th>
					<td><%=wishBean.getName() %></td>
					<td><%=wishBean.getAuthor() %></td>
					<td><%=wishBean.getPublisher() %></td>
					<td><%=wishBean.getStatus() %></td>
					<td><%=wishBean.getWish_date() %></td>
				</tr>
				<%}%>
   			</tbody>
		</table>
	<% } %>
	</div>

	<div class="howToApply">
		<h1>희망도서 신청 안내 사항</h1>
		<div class="contents">
			<div>
				<b>신청 자격</b>
				<pre>
				도서관 회원증을 발급받고, 홈페이지 회원 가입을 모두 완료한 회원만 신청이 가능합니다.
			</pre>
			</div>

			<div>
				<b>희망도서 신청 메뉴</b>
				<pre>
				국내 신간정보를 검색하면서 희망도서 신청이 가능합니다.
				희망도서 직접입력시 서명, 저자, 발행처, ISBN(국제표준도서번호), 발행년도 등을 정확하게 입력하시기 바랍니다.
				도서정보가 부정확할 경우 구입이 지연 또는 구입불가 처리될 수도 있습니다.(도서정보는 인터넷 서점 등에서 검색 후 입력 가능)
			</pre>
			</div>

			<div>
				<b>희망도서 신청권수</b>
				<pre>
				1인당 월 3권, 1년에 15권으로 제한
			</pre>
			</div>

			<div>
				<b>희망도서 진행 절차</b>
				<pre>
				신청한 도서가 선정절차를 거쳐 구입되어 이용되기까지는 2~3주 간의 기간이 소요됩니다.
				희망도서가 자료실에서 이용가능한 상태가 되면, 신청자가 먼저 보실수 있도록 "도서 예약"을 신청해드립니다.
				내부 사정으로 인해 신청이 거절되거나 보류 처리될 수 있으니 이점 양해 부탁드립니다.
			</pre>
			</div>

			<div>
				<b>선정 제외 도서</b>
				<pre>
				문제집, 수험서, 중고등 참고서
				판타지, 로맨스소설, 무협지
				웹툰, 라이트노벨 등 각종 만화류
				연감, 백서, 보고서 등 참고도서류
				영리목적·정치목적 자료
				미풍양속이나 정서 등에 문제를 유발할 수 있는 유해자료, 19세 이상 선정적인 도서
				정기간행물과 전자자료(전자책,DVD 등 비도서) ※ 필요하다고 판단되는 경우에는 별도 비도서 구입 지침에 따름)
				외국도서, 특정분야 전문도서
				고가도서(5만원 이상), 외국도서, 3권을 초과하는 시리즈 또는 전집도서, 기타 다른 기준을 적용하기 어려운 도서
				스프링 제본 또는 낱장자료(리플릿), 입체도서, 악보, 색칠공부, 필사 등 책 크기가 너무 작거나 소리가 나는 도서 등 이용과 관리가 어려운 형태 자료
				소장자료나 구입중 또는 정리중 도서, 신청 또는 주문중복도서
				서지불명도서나 미간행도서, 비매품, 품절이나 절판 도서
				유사도서가 많이 소장되어 있는 경우
				신판이 발간되었음에도 구판을 신청한 경우
				개인 및 출판사의 영리를 목적으로 하는 자료로 판단되는 경우
				※ 희망도서 선정에서 제외된 도서 중 필요하다고 판단되는 경우에는 정기구입 자료선정위원회에서 심의를 통해 구입
			</pre>
			</div>
		</div>
	</div>
</body>

</html>
