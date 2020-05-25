<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="ntMgr" class="database.NoticeMgr" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체공지</title>
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
<%@ include file="NoticeTop.jsp" %>
<%
String id = (String)session.getAttribute("adminKey");
%>
<br><br>

<%Vector vResult = ntMgr.getMyList(id); %>
 <div style="width:94%;text-align:center;">
 <table align="center" id="tablesort">
 	<thead>
 		<th class="th1">번호</th>
 		<th class="th1">관리자아이디</th>
 		<th class="th1">제목</th>
 		<th class="th1">날짜</th>
 		<th class="th1">관리</th>
 	</thead>
 	<tbody>
 	<%
 	for(int i = 0; i<vResult.size(); i++) {
 		NoticeBean ntBean = (NoticeBean)vResult.get(i);
 	%>
 	
 		<tr>
 			<td class="th2"><%=ntBean.getNum()%></td>
 			<td class="th2"><%=ntBean.getAdmin_id()%></td>
 			<td class="th2"><%=ntBean.getName()%></td>
 			<td class="th2"><%=ntBean.getDate()%></td>
 			<td class="th2" style="align:center">
    		  <a class="btn" href="javascript:SendBook('<%=ntBean.getNum()%>')">관리</a>
      		</td>
    	 </tr>
     
 	<%}%>
 	</tbody>
 </table>
 </div>

<%@ include file="Bottom.jsp" %>
<form name="sendBook" method="post" action="NoticeMgr.jsp">
<input type=hidden name="id_num">
</form>
</body>
</html>