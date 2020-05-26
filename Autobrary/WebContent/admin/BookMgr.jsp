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
<%@ include file="Bookside.jsp" %>
<br><br>


<%Vector vResult = bookMgr.getBookList(); %>
 <div style="width:94%;text-align:center;">
 <table align="center" id="tablesort">
 	<thead>
 		<th class="th1">등록번호</th>
 		<th class="th1">책이름</th>
 		<th class="th1">저자</th>
 		<th class="th1">출판사</th>
 		<th class="th1">ISBN</th>
 		<th class="th1">분류기호</th>
 		<th class="th1">소장처</th>
 		<th class="th1">도서상태</th>
 		<th class="th1">관리</th>
 	</thead>
 	<tbody>
 	<%
 	for(int i = 0; i<vResult.size(); i++) {
 		BookBean bookBean = (BookBean)vResult.get(i);
 	%>
 	
 		<tr>
 			<td class="th2"><%=bookBean.getId_num()%></td>
 			<td class="th2"><%=bookBean.getName()%></td>
 			<td class="th2"><%=bookBean.getAuthor()%></td>
 			<td class="th2"><%=bookBean.getPublisher()%></td>
 			<td class="th2"><%=bookBean.getIsbn()%></td>
 			<td class="th2"><%=bookBean.getClass_id()%></td>
			<td class="th2"><%=bookBean.getCollector()%></td>
 			<td class="th2"><%=bookBean.getStatus()%></td>
 			<td class="th2" style="align:center">
    		  <a class="btn" href="javascript:SendBook('<%=bookBean.getId_num()%>')">상세정보</a>
      		</td>
    	 </tr>
     
 	<%}%>
 	</tbody>
 </table>
 </div>

<%@ include file="Bottom.jsp" %>

<form name="sendBook" method="post" action="Bookdetail.jsp">
<input type=hidden name="id_num">
</form>
</body>
</html>