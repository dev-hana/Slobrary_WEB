<%@page import="bucketConnector.BucketManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="bookMgr" class="database.BookMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script language="JavaScript" src="script.js"></script>
<%
	String wish_id = request.getParameter("id_num");
	WishBean wishBean = bookMgr.getWish(wish_id);
%>
<title>상세정보-도서</title>
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
<form name="redForm" method="post" action="WishMgr.jsp" enctype="multipart/form-data">
<table class="type03" style="margin-left:auto; margin-right:auto;">
    <tr>
        <th scope="row">신청번호</th>
        <td><%=wish_id %></td>
    </tr>
     <tr>
        <th scope="row">신청 회원</th>
        <td><%=wishBean.getMem_id()%></td>
    </tr>
     <tr>
        <th scope="row">도서 이름</th>
        <td><%=wishBean.getName() %></td>
    </tr>
     <tr>
        <th scope="row">저자</th>
        <td><%=wishBean.getAuthor()%></td>
    </tr>
     <tr>
        <th scope="row">출판사</th>
        <td><%=wishBean.getPublisher()%></td>
    </tr>
    <tr>
        <th scope="row">신청날짜</th>
        <td><%=wishBean.getWish_date()%></td>
    </tr>
    <tr>
        <th scope="row">신청현황</th>
        <td>
        	<%=wishBean.getStatus() %>
        </td>
    </tr>
</table>

<div style="text-align:center;">
<input type="submit" class="btn" value="확인">
</div>
</form>


<br><br>
<form method="post" action="UpdateWishStatus.jsp">
<table class="type03" style="margin-left:auto; margin-right:auto;">
    <tr>
    <th>신청 현황 변경</th>
        <td>
        	<select name="status" id="status">
        		<option value="신청중">신청중</option>
        		<option value="접수평가">접수평가</option>
        		<option value="구입">구입</option>
        		<option value="등록완료">등록완료</option>
        		<option value="인계완료">인계완료</option>
        	</select>
        </td>
    </tr>
</table>
<div style="text-align:center;">
<input type="submit" class="btn" value="현황 수정">
<input type="hidden" name="wish_id" value="<%=wish_id %>">
</div>
</form>

<%@ include file="Bottom.jsp" %>
</body>
</html>