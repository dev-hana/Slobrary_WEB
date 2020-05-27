<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>MASTER</title>

</head>
<body>
<%@ include file="Top.jsp" %><br><br>
<%@ include file="Setside.jsp" %>
<%@ include file="AdminTop.jsp" %>
<%
	String id = (String)session.getAttribute("admin_id");
	boolean flag = adSet.masterCheck(id);
	if(!flag){
		%>
		<script>
		alert("권한이 부족하여 접근할 수 없습니다.");
		history.back();
		</script>
<%}
	Vector vResult = adSet.getRequList(); 
	%>
 <div style="width:94%;text-align:center;">
<table align="center" id="tablesort">
 	<thead>
 		<th class="th1">아이디</th>
 		<th class="th1">이름</th>
 		<th class="th1">전화번호</th>
 		<th class="th1">신청날짜</th>
 		<th class="th1">관리</th>
 	</thead>
 	<tbody>
 	<%
 	for(int i = 0; i<vResult.size(); i++) {
 		ArequestBean arBean = (ArequestBean)vResult.get(i);
 	%>
 	
 		<tr>
 			<td class="th2"><%=arBean.getId() %></td>
 			<td class="th2"><%=arBean.getName()%></td>
 			<td class="th2"><%=arBean.getPhone()%></td>
 			<td class="th2"><%=arBean.getDate()%></td>
 			<td class="th2" style="align:center">
    		  <a class="btn" href="javascript:SendBook('<%=arBean.getId()%>')">상세정보</a>
      		</td>
    	 </tr>
 	<%}%>
 	</tbody>
 </table>
 </div>
 
<%@ include file="Bottom.jsp" %>

<form name="sendBook" method="post" action="ArequestDetail.jsp">
<input type=hidden name="id_num">
</form>
</body>
</html>