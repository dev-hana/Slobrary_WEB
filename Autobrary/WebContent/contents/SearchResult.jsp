<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <% request.setCharacterEncoding("UTF-8"); %>
    <title>Search Result</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <style>
      p { margin:20px 0px; }
    </style>
  </head>
  <body>
  <% 		
	String contentPage = request.getParameter("CONTENTPAGE");
	if(contentPage==null){
		contentPage="SearchResult.jsp?CONTENTPAGE=SearchProc.jsp&division=all";
	}
%>
	<!-- 분류 메뉴 -->
    <div class="container">
      <div class="row">
        <div class="col">
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link text-muted active" data-toggle="tab" href="SearchResult.jsp?CONTENTPAGE=SearchProc.jsp&division=all">전체</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-muted" data-toggle="tab" href="SearchResult.jsp?CONTENTPAGE=SearchProc.jsp&division=book">단행본</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-muted" data-toggle="tab" href="SearchResult.jsp?CONTENTPAGE=SearchProc.jsp&division=year">연간속행물</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-muted" data-toggle="tab" href="SearchResult.jsp?CONTENTPAGE=SearchProc.jsp&division=nonbook">비도서</a>
              </li>
            </ul>
        </div>
      </div>
    </div>
    
    <!-- 메뉴 선택시 출력화면 -->
    <div id="contentPage">
    	<jsp:include page="<%=contentPage%>" flush="false"/>
    </div>
    
  </body>
</html>