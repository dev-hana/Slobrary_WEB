<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp"%>

<%
	String category = "커뮤니티";
	String pageNames = "도서 별점, 독서일기, 독후감, 자유게시판";
	String pageUrls = "ReviewPage.jsp, BookDiaryPage.jsp, " + "BookReportPage.jsp, CommunityPage.jsp";
	String currentPage = "독후감";
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Slobrary - <%=currentPage%></title>
<link href="/css/allNeed.css" rel="stylesheet">
<link href="/css/bookReportPage.css?v=1" rel="stylesheet">
<link href="/css/pagination.css" rel="stylesheet">
</head>
<body>
	<header>
		<jsp:include page="/Top.jsp" flush="false" />
	</header>
	
	<div class="container-fluid mb-5">
		<div class="row mt-4 pt-4 justify-content-md-center">
			<!-- sub nav -->
			<div class="col-xl-3 mr-n4">
				<jsp:include page="/SideMenuBar.jsp" flush="false">
					<jsp:param name="category" value="<%=category%>" />
					<jsp:param name="pageNames" value="<%=pageNames%>" />
					<jsp:param name="pageUrls" value="<%=pageUrls%>" />
					<jsp:param name="currentPage" value="<%=currentPage%>" />
				</jsp:include>
			</div>
			<%
				String type = request.getParameter("type");
				
			//모든 게시글
				if(type==null){
			%>
			<section class="main-content col-xl-8 mt-3">
				<!-- title -->
				<h1 class="main-title mb-2">
					<i class="far fa-square"></i>
					&nbsp;<%=currentPage%>
				</h1>
				<div class="table_div">
				<table class="table contents mb-4" id="bookDiaryTable">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">도서명</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
						</tr>
					</thead>
					<tbody>
						<%
							for(int i=0;i<17;i++){
						%>
						<tr>
							<td>1</td>
							<td>날씨가 좋으면 찾아가겠어요</td>
							<td class="alink"><a href="BookReportDetail.jsp?report_id=1">이도우 작가의 도서를 읽어봤어요!</a></td>
							<td>yangz</td>	
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				</div>
				<div class="btn_div pr-3">
					<button type="button" onclick="location.href='DrawUp.jsp?type=report'" class="btn btn-outline-secondary">독후감 쓰기</button>
					<button type="button" onclick="location.href='BookReportPage.jsp?type=myReport'" class="btn btn-outline-secondary mr-2">나의 독후감</button>
				</div>
			</section>
			<%
				}else{
					//나의 독후감
			%>
				<section class="main-content col-xl-8 mt-3">
				<!-- title -->
				<h1 class="main-title mb-4">
					<i class="far fa-square"></i>
					&nbsp;나의 독후감
				</h1>
				<div class="table_div">
				<table class="table contents mb-4" id="bookDiaryTable">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">도서명</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
						</tr>
					</thead>
					<tbody>
						<%
							for(int i=0;i<17;i++){
						%>
						<tr>
							<td>1</td>
							<td>날씨가 좋으면 찾아가겠어요</td>
							<td class="alink"><a href="BookReportDetail.jsp">이도우 작가의 도서를 읽어봤어요!</a></td>
							<td>yangz</td>	
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				</div>
				<div class="btn_div pr-3">
					<button type="button" onclick="location.href='DrawUp.jsp?type=report'" class="btn btn-outline-secondary">독후감 쓰기</button>
					<button type="button" onclick="location.href='BookReportPage.jsp'" class="btn btn-outline-secondary mr-2">모두의 독후감</button>
				</div>
			</section>
			<%
				}
			%>
		</div>
	</div>
<!-- dataTable js -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
<!-- paging js -->
<script type='text/javascript'>  
	var $jq = jQuery.noConflict(true);  
</script>
<script>
$jq(document).ready( function () {
	$jq('#bookDiaryTable').DataTable({
    	// 표시 건수기능 숨기기 select로 몇개씩 표출할지
    	lengthChange: false,
    	
    	// 검색 기능 숨기기
    	searching: true,
    	
    	// 정렬 기능 숨기기
    	ordering: false,
    	
    	// 정보 표시 숨기기
    	info: false,
    	oLanguage: {
  	      sZeroRecords: "일치하는 독후감이 없습니다."
  	    },
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
<jsp:include page="/Footer.jsp" flush="false" />
</body>
</html>