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

<!-- 자바 스크립트 -->
<script type="text/javascript" src="/js/formneeds.js"></script>

<%@ include file="/CND.jsp"%>
<style>
.myApplyList thead {
	background-color: var(--main-color);
}

.myApplyList tr {
	transition: background-color 0.3s;
	-webkit-transition: background-color 0.3s;
	transition-timing-function: ease-in-out;
	-webkit-transition-timing-function: ease-in-out;
}

.myApplyList tr:hover {
	background-color: var(--main-color-light);
}
</style>
</head>
<body class="bg-light">

<!-- 희망도서 목록 -->
				
			<div class="pl-3 pb-2 pt-3 pr-3">
        		<div style="float:left;"><h4>희망도서 신청 목록</h4></div> <div style="float:right;">
        		<button onClick="location.href='WishBook.jsp'" class="btn btn-outline-secondary float-right">희망도서신청</button></div>
        	</div><br><hr>
			
			<%Vector List = bookMgr.getWishList(mem_id, "all"); %>
			<div class="myApplyList p-3 mt-2">
			<table class="table contents" id="wishTable">
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
</body>
<!-- dataTable js -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>

<script>
$(document).ready( function () {
	$('#wishTable').DataTable({
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
</html>
<%}%>