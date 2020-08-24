<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="reportMgr" class="database.ReportMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	ReportBean reportBean = reportMgr.getReport("2");
%>
<table class="type03" style="margin-left:auto; margin-right:auto;">
    <tr>
        <th scope="row">번호</th>
        <td><%=reportBean.getReport_id() %></td>
    </tr>
     <tr>
        <th scope="row">회원아이디</th>
        <td><%=reportBean.getMem_id()%></td>
    </tr>
     <tr>
        <th scope="row">책아이디</th>
        <td><%=reportBean.getBook_id() %></td>
    </tr>
    <tr>
        <th scope="row">제목</th>
        <td><%=reportBean.getName() %></td>
    </tr>
     <tr>
        <th scope="row">내용</th>
        <td><%=reportBean.getContent()%></td>
    </tr>
     <tr>
        <th scope="row">날짜</th>
        <td><%=reportBean.getReport_date()%></td>
    </tr>
    <tr>
        <th scope="row">공개여부</th>
        <td><%=reportBean.getLocked()%></td>
    </tr>
</table>
</body>
</html>