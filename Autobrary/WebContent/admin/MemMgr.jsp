<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="memMgr" class="database.MemMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<script language="JavaScript" src="script.js"></script>
<style type="text/css">
    .th1{text-align:center; border:1px solid gray;background-color:#EAEAEA; width="72" height="45"; padding: 15px;}
    .th2 {border:1px solid gray; text-align:center; width="72" height="45"; padding: 15px;}
    .btn {background-color:#042759;font-weight:bold;color:#FFFFFF;border: none;border-radius:5px;}
    .id {background-color:#FFFFFF; border:0; outline:0;}
    </style>
</head>
<body>
<%@ include file="Top.jsp" %> 
<br><br>
<%@ include file="MemTop.jsp" %>
 <%Vector vResult= memMgr.getMemberList();%>
 <div style="width:94%;text-align:center;">
 <table align="center">
 	<th class="th1">아이디</th>
 	<th class="th1">이름</th>
 	<th class="th1">생년월일</th>
 	<th class="th1">전화번호</th>
 	<th class="th1">가입날짜</th>
 	<th class="th1">대출정보</th>
 	<th class="th1">관리</th>
 	
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
 </table>
 </div>
<%@ include file="Bottom.jsp" %>
<form name="sendMem" method="post" action="Memdetail.jsp">
<input type=hidden name="mem_id">
</form>
</body>
</html>