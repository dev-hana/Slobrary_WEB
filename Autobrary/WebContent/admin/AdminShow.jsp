<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="amMgr" class="database.AdminSet" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체관리자</title>
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

<%Vector vAdmin = amMgr.getAdminList(); %>
<div style="width:94%;text-align:center;">
 <table align="center" id="tablesort">
 	<thead>
 		<th class="th1">아이디</th>
 		<th class="th1">이름</th>
 		<th class="th1">핸드폰번호</th>
 		<th class="th1">직위</th>
 	</thead>
 	<tbody>
 	<%
 	for(int i = 0; i<vAdmin.size(); i++) {
 		AdminBean adminBean = (AdminBean)vAdmin.get(i);
 	%>
 	
 		<tr>
 			<td class="th2"><%=adminBean.getAdmin_id()%></td>
 			<td class="th2"><%=adminBean.getName()%></td>
 			<td class="th2"><%=adminBean.getPhone()%></td>
 			<td class="th2"><%=adminBean.getRank()%></td>
    	 </tr>
     
 	<%}%>
 	</tbody>
 </table>
 </div>
<%@ include file="Bottom.jsp" %>
</body>
</html>