<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="bookMgr" class="database.BookMgr" />
 <%
	String mem_id = (String)session.getAttribute("loginKey");
	if(mem_id==null) {
	%>
		   <script>
		   alert("로그인 후 사용 가능합니다.");
		   location.href="../Login.jsp";
		   </script>
	<%} else{
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망도서목록</title>
<!-- 아이콘 -->
<link rel="shortcut icon" href="../img/favicon.ico">

<!-- css -->
<link href="/css/wishList.css" rel="stylesheet" />

<!-- 자바 스크립트 -->
<script type="text/javascript" src="/js/formneeds.js"></script>

<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400&display=swap&subset=korean" rel="stylesheet">
    
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>
<body class="bg-light">
<jsp:include page="../Top.jsp" flush="false"/>

<!-- 희망도서 목록 -->
<div class="container-fluid">
	<div class="row justify-content-md-center mt-3">
		<div class="col-xl-8">
			<div>
				<div style="display: inline-block;">
					<span class="ml-2 mb-3"><h3>희망도서 신청 목록</h3></span>
				</div>
				<div style="display: inline-block; float: right;" class="mt-4 mr-2" >
					<button onClick="location.href='WishBook.jsp'" class="btn btn-outline-secondary">희망도서신청</button>
				</div>
				<hr>
			</div>
			
			<%Vector List = bookMgr.getWishList(mem_id); %>
			<div class="p-3">
			<table class="table table-hover">
				<thead class="thead-light">
						<th scope="col">번호</th>
      					<th scope="col">도서명</th>
      					<th scope="col">저자명</th>
      					<th scope="col">출판사</th>
      					<th scope="col">상태</th>
      					<th scope="col">신청날짜</th>
				</thead>
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
			</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%}%>