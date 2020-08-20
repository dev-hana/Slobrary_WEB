<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<link href="/css/index.css" rel="stylesheet">
<link rel="stylesheet" href="/css/selectBox.css"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<title>SLO-도서검색</title>
<%
	String category = "자료검색";
	String pageNames = "도서검색, 신간도서, 베스트셀러";
	String pageUrls = "SearchPage.jsp, SearchPage.jsp?contentPage=BookList.jsp?type=new, SearchPage.jsp?contentPage=BookList.jsp?type=best";
	String currentPage = "자료검색";
	request.setCharacterEncoding("UTF-8");
	
	String contentPage=request.getParameter("contentPage");
	if(contentPage==null){
		contentPage="SearchList.jsp?keytype=all&keyword=";
	}
%>
</head>

<body>
	<header>
		<jsp:include page="/Top.jsp" flush="false" />
	</header>
	<div class="container-fluid mb-5">
		<div class="row mt-4 pt-4 justify-content-md-center">
		
			<div class="col-xl-3 mr-n4 overflow-auto">
				<jsp:include page="/SideMenuBar.jsp" flush="false">
				<jsp:param name="category" value="<%=category%>"/>
				<jsp:param name="pageNames" value="<%=pageNames%>"/>
				<jsp:param name="pageUrls" value="<%=pageUrls%>"/>
				<jsp:param name="currentPage" value="<%=currentPage%>"/>
				</jsp:include>
			</div>
			<div class="col-xl-8 mt-3 p-2">
			<%if(contentPage.contains("SearchList")){%>
				<div class="mb-4">
				<h3 class="pl-2 pb-1"><span style="color:#A593E0;"><i class="far fa-square"></i></span>&nbsp;&nbsp;도서검색</h3>
				</div>
			
			<div style="text-align:center; border: 1px solid #EAEAEA;" class="mt-2 mb-5 pt-3">
			<div id="search-form">
			
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
         				<input id="keyword" name="keyword" onkeypress="enter_search()" type="search" placeholder="도서 검색 (책 이름, 작가명, 출판사명)" aria-describedby="button-addon" class="form-control border-0 bg-white">
             			<div class="input-group-append">
               				<button id="button-addon" class="btn btn-link"><i class="fa fa-search"></i></button>
             			</div>
         			</div>
  				</div>
			</div>
			</div>
			<%}%>
				<div>
					<jsp:include page="<%=contentPage %>" flush="false" />
				</div>			
			</div>
		</div>
	</div>
	<jsp:include page="/Footer.jsp" flush="false" />
	<script>
	$(document).ready(function() {
		$('#button-addon').click(function() {
			var keytype =$("#select-profession option:selected").val();
			var keyword =$("#keyword").val();
			var link = "/contents/SearchPage.jsp?contentPage=SearchList.jsp?keytype="+keytype+"&keyword="+keyword;
			$(location).attr('href',link);

		});
		
	});
	 function enter_search() {
	        if ( window.event.keyCode == 13 ) {
	        	var keytype =$("#select-profession option:selected").val();
				var keyword =$("#keyword").val();
				var link = "/contents/SearchPage.jsp?contentPage=SearchList.jsp?keytype="+keytype+"&keyword="+keyword;
				$(location).attr('href',link);
	        }
	    }
	</script>
 <script src="/js/bookSearch.js"></script>
</body>
</html>
