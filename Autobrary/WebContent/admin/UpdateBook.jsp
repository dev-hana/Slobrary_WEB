<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="bookMgr" class="database.BookMgr" />
<jsp:useBean id="bucketManager" class="bucketConnector.BucketManager" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script language="JavaScript" src="script.js"></script>
<%
	String id_num = request.getParameter("id_num");
	BookBean bookBean = bookMgr.getBook(id_num);
%>
<title>도서수정</title>
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
<%@ include file="Bookside.jsp" %>
<br><br>
<form name="redForm" method="post" action="UpdateBProc.jsp" enctype="multipart/form-data">
<table class="type03" style="margin-left:auto; margin-right:auto;">
    <tr>
        <th scope="row">등록번호</th>
        <td><%=bookBean.getId_num() %></td>
    </tr>
     <tr>
        <th scope="row">자료유형</th>
        <td><input type="text" name="type" value="<%=bookBean.getType()%>"></td>
    </tr>
     <tr>
        <th scope="row">도서 이름</th>
        <td><input type="text" name ="name" value="<%=bookBean.getName() %>"></td>
    </tr>
     <tr>
        <th scope="row">저자</th>
        <td><input type="text" name="author" value="<%=bookBean.getAuthor()%>"></td>
    </tr>
     <tr>
        <th scope="row">출판사</th>
        <td><input type="text" name="publisher" value="<%=bookBean.getPublisher()%>"></td>
    </tr>
    <tr>
        <th scope="row">발행사항</th>
        <td><input type="text" name="issue" value="<%=bookBean.getIssue() %>"></td>
    </tr>
    <tr>
        <th scope="row">형태사항</th>
        <td><input type="text" name="form" value="<%=bookBean.getForm() %>"></td>
    </tr>
     <tr>
        <th scope="row">ISBN</th>
        <td><input type="text" name="isbn" value="<%=bookBean.getIsbn() %>"></td>
    </tr>
     <tr>
        <th scope="row">분류기호</th>
        <td><input type="text" name="class_id" value="<%=bookBean.getClass_id()%>"></td>
    </tr>
     <tr>
        <th scope="row">언어</th>
        <td><input type="text" name="language" value="<%=bookBean.getLanguage()%>"></td>
    </tr>
     <tr>
        <th scope="row">소장처</th>
        <td><input type="text" name="collector" value="<%=bookBean.getCollector()%>"></td>
    </tr>
     <tr>
        <th scope="row">청구기호</th>
        <td><input type="text" name="sign" value="<%=bookBean.getSign()%>"></td>
    </tr>
     <tr>
        <th scope="row">도서상태</th>
        <td><input type="text" name="status" value="<%=bookBean.getStatus()%>"></td>
    </tr>
     <tr>
        <th scope="row">추가날짜</th>
        <td><%=bookBean.getDate() %></td>
    </tr>
     <tr>
        <th scope="row">이미지</th>
        <td><img src="<%=bucketManager.base64DownLoader(bookBean.getImage())%>">
        <input type="file" name="image">
        </td>
    </tr>
    <tr>
    	<th scope="row">삭제</th>
    	<td><a class="btn" href="javascript:DelBook('<%=bookBean.getId_num() %>')">삭제</a></td>
</table>
<div style="text-align:center;">
<input type="submit" class="btn" value="수정완료">
</div>
<input type="hidden" name="id_num" value="<%=id_num %>">
</form>
<form name="delBook" method="post" action="DeleteBProc.jsp">
<input type=hidden name="id_num">
</form>

</div>
<%@ include file="Bottom.jsp" %>

</form>
</body>
</html>