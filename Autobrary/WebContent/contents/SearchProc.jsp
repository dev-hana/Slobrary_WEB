<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<% request.setCharacterEncoding("UTF-8"); %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 4</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link href="../css/SearchProc.css" rel="stylesheet" />
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div align="middle">
          <ul class="list-group">
          <%
  		for(int i=0; i<6;i++){
  	%>
  	
  	<li class="list-group-item">
  	<table>
  		<tr>
  			<th rowspan="5" class="timg"><img src="../img/book2.jpg" alt="Paris" width="90" height="110"></th>
  		</tr>
  		<tr>
  			<td class="td1">도서명</td><td class="td2">날씨가 좋으면 찾아가겠어</td>
  		</tr>
  		<tr>
  			<td class="td1">저자</td><td class="td2">이도우</td>
  		</tr>
  		<tr>
  		<td class="td1">위치정보</td><td class="td2">문학 4-3</td>

  		</tr>
  		<tr>
  			<td class="td1">대출정보</td><td class="td2">대출가능</td><td><button class="btn" type="submit">상세보기</button></td><td><button class="btn">관심도서담기</button></td>
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