<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="memMgr" class="database.MemMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script language="JavaScript" src="script.js"></script>
<%
	String mem_id = request.getParameter("mem_id");
	MemBean memBean= memMgr.getMember(mem_id);
%>
<title>상세정보</title>
<style>
table.type03 {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
  margin : 20px 10px;
}
table.type03 th {
    width: 147px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;

}
table.type03 td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
.btn {background-color:#042759;font-weight:bold;color:#FFFFFF;border: none;border-radius:5px;}
</style>
</head>
<body>
<%@ include file="Top.jsp" %> 
<br><br>
<table class="type03" style="margin-left:auto; margin-right:auto;">
    <tr>
        <th scope="row">아이디</th>
        <td><%=mem_id %></td>
    </tr>
     <tr>
        <th scope="row">이름</th>
        <td><%=memBean.getMem_name()%></td>
    </tr>
     <tr>
        <th scope="row">성별</th>
        <td><%=memBean.getMem_gender() %></td>
    </tr>
     <tr>
        <th scope="row">생년월일</th>
        <td><%=memBean.getMem_birth()%></td>
    </tr>
     <tr>
        <th scope="row">핸드폰</th>
        <td><%=memBean.getMem_phone()%></td>
    </tr>
    <tr>
        <th scope="row">주소</th>
        <td><%=memBean.getMem_address() %></td>
    </tr>
     <tr>
        <th scope="row">이메일</th>
        <td><%=memBean.getMem_mail() %></td>
    </tr>
     <tr>
        <th scope="row">대출가능여부</th>
        <td><%=memBean.getLoan_status()%></td>
    </tr>
     <tr>
        <th scope="row">가입날짜</th>
        <td><%=memBean.getMem_date()%></td>
    </tr>
</table>
<div style="text-align:center;">
<a class="btn" href="javascript:SendMem('<%=memBean.getMem_id() %>')">수정</a>

</div>
<%@ include file="Bottom.jsp" %>
<form name="sendMem" method="post" action="UpdateMem.jsp">
	<input type=hidden name="mem_id">
</form>
</body>
</html>