<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- dataTable pagination -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
<!-- 아이콘 -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- css -->
<link rel="stylesheet" href="/css/selectBox.css"> 
<link href="/css/index.css" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function(){
    $("#button-addon").click(function(){
        $(".nblist").hide();
    });
});
</script>
</head>
<body>
	<div class="mb-4">
				<h3 class="pl-2 pb-1"><span style="color:#A593E0;"><i class="far fa-square"></i></span>&nbsp;&nbsp;도서검색</h3>
			</div>
			<div style="text-align:center; border: 1px solid #EAEAEA;" class="mt-2 mb-5 pt-3">
			<form id="search-form" action="SearchList.jsp" method="post" target="list">
			  <div style="display: inline-block;" class="sel sel--black-panther">
 				 <select name="keytype" id="select-profession">
  					<option value="all">전체</option>
  					<option value="all">전체</option>
    				<option value="title">도서명</option>
    				<option value="author">저자</option>
    				<option value="publisher">출판사</option>
  				</select>
				</div>
				<div style="display: inline-block; border: 1px solid #EAEAEA;" class="col-xl-7 p-2 bg-white rounded rounded-pill shadow-sm mb-4">
     				<div class="input-group">
         				<input name="keyword" type="search" placeholder="도서 검색 (책 이름, 작가명, 출판사명)" aria-describedby="button-addon" class="form-control border-0 bg-white">
             			<div class="input-group-append">
               				<button id="button-addon" onclick="iframeshow()" type="submit" class="btn btn-link"><i class="fa fa-search"></i></button>
             			</div>
         			</div>
  				</div>
			</form>
			</div>
			<div class="nblist">
				<jsp:include page="/contents/Booklist.jsp" flush="false"/>
			</div>
			<div>
				<iframe id="the_iframe" onload="calcHeight();" name="list" title="도서검색결과" frameborder="0" scrolling="no" style="display:none; overflow-x:hidden; overflow:auto; width:100%;"></iframe>
			</div>
 <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
 <script src="/js/bookSearch.js"></script>
</body>
</html>