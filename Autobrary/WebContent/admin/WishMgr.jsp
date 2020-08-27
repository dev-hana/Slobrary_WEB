<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="bookMgr" class="database.BookMgr" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관리</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">
 <link rel="shortcut icon" href="/img/favicon.ico">
<script language="JavaScript" src="script.js"></script>
<script type="text/javascript">
 $(function(){
     $("#tablesort").dataTable();
 });
 </script>
</head>
<body>
<%@ include file="Top.jsp" %> 
<%@ include file="Setside.jsp" %>
<br><br>


<%Vector vResult = bookMgr.getWishList(null, "all"); %>
 <div style="width:94%;text-align:center;">
 <table align="center" id="tablesort">
 	<thead>
 		<th class="th1">희망번호</th>
 		<th class="th1">회원아이디</th>
 		<th class="th1">도서이름</th>
 		<th class="th1">작가</th>
 		<th class="th1">출판사</th>
 		<th class="th1">신청날짜</th>
 		<th class="th1">신청상태</th>
 		<th class="th1">관리</th>
 	</thead>
 	<tbody>
 	<%
 	for(int i = 0; i<vResult.size(); i++) {
 		WishBean wishBean = (WishBean)vResult.get(i);
 	%>
 	
 		<tr>
 			<td class="th2"><%=wishBean.getWish_id()%></td>
 			<td class="th2"><%=wishBean.getMem_id()%></td>
 			<td class="th2"><%=wishBean.getName()%></td>
 			<td class="th2"><%=wishBean.getAuthor()%></td>
 			<td class="th2"><%=wishBean.getPublisher()%></td>
 			<td class="th2"><%=wishBean.getWish_date()%></td>
			<td class="th2"><%=wishBean.getStatus()%></td>
 			<td class="th2" style="align:center">
    		  <a class="btn" href="javascript:SendBook('<%=wishBean.getWish_id() %>')">상세정보</a>
      		</td>
    	 </tr>
     
 	<%}%>
 	</tbody>
 </table>
 </div>


<%@ include file="Bottom.jsp" %>

<form name="sendBook" method="post" action="Wishdetail.jsp">
<input type=hidden name="id_num">
</form>
</body>
</html>