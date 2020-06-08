<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>SLO-도서검색</title>
 
<!-- 셀렉트 박스 화살표 -->
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css'>
<!-- css -->
<link rel="stylesheet" href="../css/SearchPage.css"> 
<link href="/css/index.css" rel="stylesheet">
</head>

<body class="bg-light">
	<!-- 상단메뉴 -->
	<header><jsp:include page="../Top.jsp" flush="false"/></header>

	<div class="container d-flex h-100">
    	<div class="row justify-content-center align-self-center">
    		 I'm vertically centered
    	</div>
	</div>


<div class="container-fluid">
<div class="row mt-3 pt-4 justify-content-md-center">
<form action="SearchResult.jsp" method="post" target="list">
<div style="text-align:center" class="mt-5">
  <div style="display: inline-block" class="sel sel--black-panther">
  <select name="keyoption" id="select-profession">
  	<option value="all">전체</option>
  	<option value="all">전체</option>
    <option value="title">도서명</option>
    <option value="author">저자</option>
    <option value="publisher">출판사</option>
  </select>
</div>
	
  <div style="display: inline-block" class="p-2 bg-white rounded rounded-pill shadow-sm mb-4 w-700">
     <div class="input-group">
         <input name="keyword" type="search" placeholder="도서 검색 (책 이름, 작가명, 출판사명)" aria-describedby="button-addon" class="form-control border-0 bg-white">
             <div class="input-group-append">
               <button id="button-addon" onclick="iframeshow()" type="submit" class="btn btn-link"><i class="fa fa-search"></i></button>
             </div>
         </div>
  </div>
</form>
</div>
<br><br>
<iframe id="the_iframe" onload="calcHeight();" name="list" title="도서검색결과" frameborder="0" scrolling="no" style="display:none; overflow-x:hidden; overflow:auto; width:100%;"></iframe>

</div>

 <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
 <script src="../js/SearchPage.js"></script>

</body>
</html>
