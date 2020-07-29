<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.mypage a:hover{
	color: #424242;
	text-decoration: none;
}
.mypage a:link { color: #424242; text-decoration: none;}
.mypage a:visited { color: #424242; text-decoration: none;}
.subMenu{
	text-align: center;
}
</style>
</head>
<body>

	<nav>
		<div class="subMenu">
		<ul class="list-group mypage">
			<li class="list-group-item list-group-item-action"><a href="MyPage.jsp?CONTENTPAGE=MyPageList.jsp?type=loanbook">내 서재</a></li>
			<li class="list-group-item list-group-item-action"><a href="MyPage.jsp?CONTENTPAGE=MyPageList.jsp?type=overdue">연체도서</a></li>
			<li class="list-group-item list-group-item-action"><a href="MyPage.jsp?CONTENTPAGE=WishList.jsp">희망도서</a></li>
			<li class="list-group-item list-group-item-action"><a href="MyPage.jsp?CONTENTPAGE=MyPageList.jsp?type=interest">관심도서</a></li>
			<li class="list-group-item list-group-item-action"><a href="MyPage.jsp?CONTENTPAGE=LogList.jsp?type=review">나의 기록</a></li>
		</ul>
		</div>
	</nav>
</body>
</html>