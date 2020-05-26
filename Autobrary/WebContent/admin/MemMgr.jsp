<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="memMgr" class="database.MemMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">
<script language="JavaScript" src="script.js"></script>
<script type="text/javascript">
 $(function(){
     $("#tablesort").dataTable();
 });
 </script>
</head>
<body>
<%@ include file="Top.jsp" %> 
<br><br>
 <%Vector vResult= memMgr.getMemberList();%>
 <div style="width:94%;text-align:center;">
 <table align="center" id="tablesort">
 	<thead>
 		<th class="th1">아이디</th>
 		<th class="th1">이름</th>
 		<th class="th1">생년월일</th>
 		<th class="th1">전화번호</th>
 		<th class="th1">가입날짜</th>
 		<th class="th1">대출정보</th>
 		<th class="th1">관리</th>
 	</thead>
 	<tbody>
 	<%
 	for(int i = 0; i<vResult.size(); i++) {
 		MemBean memBean = (MemBean)vResult.get(i);
 	%>
 		<tr>
 			<td class="th2"><%=memBean.getMem_id()%></td>
 			<td class="th2"><%=memBean.getMem_name()%></td>
 			<td class="th2"><%=memBean.getMem_birth()%></td>
 			<td class="th2"><%=memBean.getMem_phone()%></td>
			<td class="th2"><%=memBean.getMem_date()%></td>
 			<td class="th2"><%=memBean.getLoan_status()%></td>
 			<td class="th2" style="align:center">
    		  <a class="btn" href="javascript:SendMem('<%=memBean.getMem_id()%>')">상세정보</a>
     		 </td>
   	  </tr>
	 <%}%>
 </tbody>
 </table>
 </div>
<%@ include file="Bottom.jsp" %>
<form name="sendMem" method="post" action="Memdetail.jsp">
<input type=hidden name="mem_id">
</form>
</body>
</html>