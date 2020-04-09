<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="bookMgr" class="database.BookMgr" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관리</title>
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
<div style="text-align: center; display:inline;">
<form name="search">
	<select name="searchBook" style="font-size:20px; text-align:center;">
		<option value="all">전체</option>
		<option value="name">도서이름</option>
		<option value="author">저자이름</option>
		<option value="publisher">출판사</option>
		<option value="id">등록번호</option>
	</select>
	
	<input type="text" name="result" style="width:500px;">
	<input style="background:#042759; color:#FFFFFF; border: none; font-size:20px; text-align:center;" 
	type="submit" value="search">
</form>
</div>
<br><br>

<%Vector vResult = bookMgr.getBookList(); %>
 <div style="width:94%;text-align:center;">
 <table align="center">
 	<th class="th1">등록번호</th>
 	<th class="th1">책이름</th>
 	<th class="th1">저자</th>
 	<th class="th1">출판사</th>
 	<th class="th1">ISBN</th>
 	<th class="th1">분류기호</th>
 	<th class="th1">소장처</th>
 	<th class="th1">도서상태</th>
 	<th class="th1">관리</th>
 	
 	<%
 	for(int i = 0; i<vResult.size(); i++) {
 		BookBean bookBean = (BookBean)vResult.get(i);
 	%>
 	<tr>
 	<td class="th2"><%=bookBean.getId_num()%></td>
 	<td class="th2"><%=bookBean.getName()%></td>
 	<td class="th2"><%=bookBean.getAuthor()%></td>
 	<td class="th2"><%=bookBean.getPublisher()%></td>
 	<td class="th2"><%=bookBean.getIsbn()%></td>
 	<td class="th2"><%=bookBean.getClass_id()%></td>
	<td class="th2"><%=bookBean.getCollector()%></td>
 	<td class="th2"><%=bookBean.getStatus()%></td>
 	<td class="th2" style="align:center">
      <a class="btn" href="javascript:SendBook('<%=bookBean.getId_num()%>')">상세정보</a>
      </td>
     </tr>
 <%}%>
 </table>
 </div>
<%@ include file="Bottom.jsp" %>

<form name="sendBook" method="post" action="Bookdetail.jsp">
<input type=hidden name="id_num">
</form>
</body>
</html>