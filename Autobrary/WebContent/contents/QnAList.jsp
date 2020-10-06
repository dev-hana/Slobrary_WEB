<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 물어보는 질문 리스트</title>
<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400&display=swap&subset=korean" rel="stylesheet">
<!-- css -->
<link href="/css/QnAList.css" rel="stylesheet">
<link href="/css/pagination.css" rel="stylesheet">
<%
	//all=전체, book=자료이용, member=회원문의, etc=기타
	String type = request.getParameter("type");
%>
</head>
<body>
	
	<table class="table" id="myTable" style="width:100%">
					<thead>
						<tr>
						<th>분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						</tr>
					</thead>
					<tbody>
						<%
							for(int i=0;i<15;i++){
								%>
								<tr>
									<!-- 분류 회원문의,자료이용,기타 -->
									<td>도서이용<%=i %></td>
									<td onclick="divHide('a<%=i %>')" data-toggle="collapse" href="#a<%=i %>" aria-expanded="false">
																							<!-- 제목 -->
					  					<span class="textQ mr-3">Q</span><span class="qTitle">도서관 이용시간과 휴관일은 어떻게 되나요?</span>
					  					<div class="collapse a<%=i %> mt-1 A" id="a<%=i %>">
											<span class="textA mr-3">A</span>
											<!-- 내용 -->
											<span>
												소속도서관을 방문하여 재발급을 신청하면 됩니다. 분실 시 회원카드의 타인에 의한 무단사용을 방지하기 위해 도서관에 즉시 통지 부탁드립니다.
											</span>
										</div>
									</td>
									<!-- 작성자 -->
									<td>관리자</td>
									<!-- 등록날짜 -->
									<td>2020/08/13</td>
								</tr>
								  
								<%
							}
						%>
					</tbody>
				</table>
</body>

<!-- dataTable js -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>

<script>
$(document).ready( function () {
	$('#myTable').DataTable({
    	// 표시 건수기능 숨기기 select로 몇개씩 표출할지
    	lengthChange: false,
    	
    	// 검색 기능 숨기기
    	searching: false,
    	
    	// 정렬 기능 숨기기
    	ordering: false,
    	
    	// 정보 표시 숨기기
    	info: false,
    	responsive: {
            details: {
                type: 'column',
                target: 'tr'
            }
        },
    	//몇개씩 보여줄지
    	displayLength: 10,
    	language: {
            paginate: {
                previous: '‹',
                next:     '›'
            }
        }
    });
  });

function divHide(item){
	var a = "."+item;
	
	if($(a).css("display") != "none"){
		$(a).fadeOut('slow');
		
	}else{
		$(a).fadeIn('slow');
	}
}

</script>
</html>