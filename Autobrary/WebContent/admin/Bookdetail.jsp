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
	String id_num = request.getParameter("id_num");
	BookBean bookBean = bookMgr.getBook(id_num);
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
<table class="type03" style="margin-left:auto; margin-right:auto;">
    <tr>
        <th scope="row">등록번호</th>
        <td><%=id_num %></td>
    </tr>
     <tr>
        <th scope="row">자료유형</th>
        <td><%=bookBean.getType()%></td>
    </tr>
     <tr>
        <th scope="row">도서 이름</th>
        <td><%=bookBean.getName() %></td>
    </tr>
     <tr>
        <th scope="row">저자</th>
        <td><%=bookBean.getAuthor()%></td>
    </tr>
     <tr>
        <th scope="row">출판사</th>
        <td><%=bookBean.getPublisher()%></td>
    </tr>
    <tr>
        <th scope="row">발행사항</th>
        <td><%=bookBean.getIssue() %></td>
    </tr>
     <tr>
        <th scope="row">ISBN</th>
        <td><%=bookBean.getIsbn() %></td>
    </tr>
     <tr>
        <th scope="row">분류기호</th>
        <td><%=bookBean.getClass_id()%></td>
    </tr>
     <tr>
        <th scope="row">언어</th>
        <td><%=bookBean.getLanguage()%></td>
    </tr>
     <tr>
        <th scope="row">소장처</th>
        <td><%=bookBean.getCollector()%></td>
    </tr>
     <tr>
        <th scope="row">청구기호</th>
        <td><%=bookBean.getSign()%></td>
    </tr>
     <tr>
        <th scope="row">도서상태</th>
        <td><%=bookBean.getStatus()%></td>
    </tr>
     <tr>
        <th scope="row">이미지</th>
        <td><img src="/data/<%=bookBean.getImage()%>"></td>
    </tr>
</table>
<div style="text-align:center;">
<a class="btn" href="javascript:SendBook('<%=bookBean.getId_num() %>')">수정</a>

</div>
<%@ include file="Bottom.jsp" %>
<form name="sendBook" method="post" action="UpdateBook.jsp">
	<input type=hidden name="id_num">
</form>
</body>
</html>