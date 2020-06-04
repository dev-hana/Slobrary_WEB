<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="bookMgr" class="database.BookMgr" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베스트샐러</title>
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

<%Vector vResult = bookMgr.getBestList(); %>
<div style="width:94%;text-align:center;">
 <table align="center" id="tablesort">
 	<thead>
 		<th class="th1">번호</th>
 		<th class="th1">책번호</th>
 		<th class="th1">등록 관리자</th>
 		<th class="th1">등록 날짜</th>
 		<th class="th1">도서 상세보기</th>
 	</thead>
 	<tbody>
 	<%
 	for(int i = 0; i<vResult.size(); i++) {
 		BestBean bestBean = (BestBean)vResult.get(i);
 	%>
 	
 		<tr>
 			<td class="th2"><%=bestBean.getBest_id()%></td>
 			<td class="th2"><%=bestBean.getId_num()%></td>
 			<td class="th2"><%=bestBean.getAdmin_id()%></td>
 			<td class="th2"><%=bestBean.getAdd_date()%></td>
 			<td class="th2" style="align:center">
    		  <a class="btn" href="javascript:SendBook('<%=bestBean.getId_num()%>')">도서</a>
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