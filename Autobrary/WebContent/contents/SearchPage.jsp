<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">

<!-- dataTable pagination -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
 <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>

<title>SLO-도서검색</title>
<%
	String category = "자료검색";
	String pageNames = "도서검색, 신간도서, 베스트셀러";
	String pageUrls = "SearchPage.jsp?contentPage=BookSearch.jsp, SearchPage.jsp?contetPage=Booklist.jsp?new, SearchPage.jsp?contentPage=Booklist.jsp?best";
	String currentPage = "자료검색";
	request.setCharacterEncoding("UTF-8");
	
	String contentPage=request.getParameter("contentPage");
	if(contentPage==null){
		contentPage="BookSearch.jsp";
	}
%>
</head>

<body>
	<header>
		<jsp:include page="/Top.jsp" flush="false" />
	</header>
	<div class="container-fluid mb-5">
		<div class="row mt-4 pt-4 justify-content-md-center">
			<div class="col-xl-3 overflow-auto">
				<jsp:include page="/SideMenuBar.jsp" flush="false">
				<jsp:param name="category" value="<%=category%>"/>
				<jsp:param name="pageNames" value="<%=pageNames%>"/>
				<jsp:param name="pageUrls" value="<%=pageUrls%>"/>
				<jsp:param name="currentPage" value="<%=currentPage%>"/>
				</jsp:include>
			</div>
			<div class="col-xl-8 mt-3 p-3" style="margin-left: -4rem;">
				<jsp:include page="<%=contentPage %>" flush="false" />
			</div>
		</div>
	</div>
	<jsp:include page="/Footer.jsp" flush="false" />
		<!-- 페이지 include 시 dataTable jquery 적용 안되는 문제로 추가-->
		<script type='text/javascript'>  
		 var $jq = jQuery.noConflict(true);  
		</script>
		<script>
		$jq(document).ready( function () {
			$jq('#review').DataTable({
		    	// 표시 건수기능 숨기기 select로 몇개씩 표출할지
		    	lengthChange: false,
		    	
		    	// 검색 기능 숨기기
		    	searching: false,
		    	
		    	// 정렬 기능 숨기기
		    	ordering: false,
		    	
		    	// 정보 표시 숨기기
		    	info: false,
		    	
		    	//몇개씩 보여줄지
		    	displayLength: 5,
		    	language: {
		            paginate: {
		                previous: '‹',
		                next:     '›'
		            }
		        }
		    });
		  });
		    </script>
		
</body>
</html>
