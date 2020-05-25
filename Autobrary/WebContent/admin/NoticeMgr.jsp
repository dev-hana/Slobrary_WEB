<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="ntMgr" class="database.NoticeMgr" />
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<script language="JavaScript" src="script.js"></script>
<title>공지사항 관리</title>
</head>
<body>
<%@ include file="Top.jsp" %>
<%@ include file="Setside.jsp" %>
<%@ include file="NoticeTop.jsp" %>
<%
	String num = request.getParameter("id_num");
   NoticeBean ntBean = ntMgr.getNotice(num);
%>
<br><br>
<table class="type03" style="margin-left:auto; margin-right:auto;">
    <tr>
        <th scope="row">번호</th>
        <td><%=ntBean.getNum() %></td>
    </tr>
     <tr>
        <th scope="row">관리자아이디</th>
        <td><%=ntBean.getAdmin_id()%></td>
    </tr>
     <tr>
        <th scope="row">제목</th>
        <td><%=ntBean.getName() %></td>
    </tr>
     <tr>
        <th scope="row">내용</th>
        <td><%=ntBean.getContent()%></td>
    </tr>
     <tr>
        <th scope="row">날짜</th>
        <td><%=ntBean.getDate()%></td>
    </tr>
</table>
<div style="text-align:center;">
<a class="btn" href="javascript:SendBook('<%=ntBean.getNum() %>')">수정</a>

</div>
<%@ include file="Bottom.jsp" %>
<form name="sendBook" method="post" action="UpdateNotice.jsp">
	<input type=hidden name="id_num">
</form>
</body>
</html>