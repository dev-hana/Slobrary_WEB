<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.BookBean"%>
<jsp:useBean id="search" class="database.BookMgr"/>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<% request.setCharacterEncoding("UTF-8"); %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BookSearchProc</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link href="../css/SearchProc.css" rel="stylesheet" />
  </head>
  <body>
  <%
  	String category = (String) request.getParameter("category");
  	String keyword = (String) request.getParameter("keyword");
  	String keyoption = (String) request.getParameter("keyoption");
  	String area = (String) request.getParameter("area");
  	String division = (String) request.getParameter("division");
  	
  	System.out.println(division);
  	
  	BookBean bookInfo = new BookBean();
  	Vector bookList = search.searchBookList(keyoption, keyword, category, area, division); 	
  	
  %>
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div align="middle">
          <ul class="list-group">
          <%
  		for(int i=0; i<bookList.size();i++){
  			bookInfo = (BookBean) bookList.get(i);
  	%>
  	
  	<li class="list-group-item">
  	<table>
  		<tr>
  			<th rowspan="5" class="timg"><img src="../img/book2.jpg" alt="책표지" width="90" height="110"></th>
  		</tr>
  		<tr>
  			<td class="td1" nowrap>도서명</td><td class="td2" colspan="5"><%= bookInfo.getName() %></td>
  		</tr>
  		<tr>
  			<td class="td1" nowrap>저자</td><td class="td2" colspan="5"><%= bookInfo.getAuthor() %></td>
  		</tr>
  		<tr>
  		<td class="td1" nowrap>위치정보</td><td class="td2"><%= bookInfo.getSign() %></td>

  		</tr>
  		<tr>
  			<td class="td1" nowrap>대출정보</td><td class="td2"><%= bookInfo.getStatus() %></td><td></td><td><button class="btn" type="submit">상세보기</button></td><td><button class="btn">관심도서담기</button></td>
  		</tr>
  	</table>
  	</li>
  	<%} %>
  	</div>
        </div>
      </div>
    </div>
  </body>
</html>