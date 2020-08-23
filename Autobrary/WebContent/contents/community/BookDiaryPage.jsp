<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
thead {
	background-color: var(--main-color);
}

tr {
	transition: background-color 0.3s;
	-webkit-transition: background-color 0.3s;
	transition-timing-function: ease-in-out;
	-webkit-transition-timing-function: ease-in-out;
}

tr:hover {
	background-color: var(--main-color-light);
}
</style>
</head>
<body>
<table class="table contents mb-4" id="wishTable">
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
</body>
</html>