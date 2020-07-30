<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 아이콘 -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
 <!-- dataTable pagenation -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
 <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
 <style>
.img{
	text-align: center;
}
.keyword{
	color:#353535;
}
.oth{
	color:#747474;
}
.count{
	color:#DE4F4F;
}
.non_keyword{
	color:#9354ED;
}
.alink a:hover{
	color: #424242;
	text-decoration: underline;
}
.alink a:link { color: #424242;}
.alink a:visited { color: #424242; text-decoration: none;}

.ap{
	color:6C6C6C;
	font-size:14px;
}
.title{
	color:#A593E0;
}
.alinl{
	font-size:15px;
}
.point{
	font-size:14px;
 	color:9D9D9D;
}
</style>

<%
	request.setCharacterEncoding("UTF-8");
	String keytype ="all"; //request.getParameter("keytype");
	String keyword ="a"; //request.getParameter("keyword");
	String keyKor;
	if(keytype.equals("all")){
		keyKor = "전체";
	}else if(keytype.equals("title")){
		keyKor="도서명";
	}else if(keytype.equals("author")){
		keyKor="저자";
	}else{
		keyKor="출판사";
	}
	
	boolean result=true;
%>
</head>
<body>
	<%
		//검색결과가 있는 경우
		if(result){
			int n=23; //리뷰개수
			int tab=0; //1탭 5리뷰
			int star=4;
			boolean open = true;
	%>
	<!-- 검색결과 타이틀 및 검색 옵션과 키워드 검색결과 개수 -->
  	<div class="mb-3 pl-3">
			<h4><span style="color:#A593E0;"><i class="fas fa-search"></i></i></i></span>&nbsp;&nbsp;검색결과</h4>
			<div class="mt-3">
				<span class="border m-2 mt-1 p-1 pr-2 pl-2 "><%=keyKor%></span><span class="keyword"><strong>"<%=keyword %>"</strong></span><span class="oth">(의)로 검색한 결과 </span><span class="count">총 122권</span>
			</div>
	</div>
	<!-- 검색결과 리스트 디자인 -->
  	<div class="pr-2 pl-2">
  	
	<table class="table"  id="myTable" style="width:100%">
		<thead style="display: none;">
			 <tr><th>이미지</th><th>정보</th></tr>
		</thead>
		<tbody>
		<%
			//검색결과 개수 만큼 반복
			for(int i=0; i<13;i++){
				
		%>
		<tr>
			<td class="img pt-3">
				<!-- 도서 이미지 -->
				<img class="shadow-sm" width="110" height="140" alt="이미지가 없습니다." src="/img/ex2.jpg">
			</td>
			<td><!--  <span class="title">도서명 : <a href="/" target="_parent">내가 원하는 것을 나도 모를 때</a>	&nbsp;&nbsp;&#124;&nbsp;&nbsp;저자 : 이도우&nbsp;&nbsp;&#124;&nbsp;&nbsp;출판사 : 동양출판사</span>-->
			<span class="title mr-2"><strong>[&nbsp;도서&nbsp;]</strong></span><span class="alink"><a href="/" target="_parent">내가 원하는 것을 나도 모를 때<%=i %></a></span><br>
			<!-- 별점 -->
			<div style="font-size: 17px;">
						<%
							for(int s=1;s<=5;s++){
								if(s<=star){
								%>
									<span style="color:#fcd703;"><i class="fas fa-star"></i></span>
								<%
								}else{
								%>
									<span style="color:#B8B8B8;"><i class="fas fa-star"></i></span>
								<%
								}
							}
						%>
						<span class="point ml-2">4점</span>
					</div>
			<span class="mr-2" style="color:BDBDBD; font-size:0.7px;"><i class="fas fa-square-full"></i></span><span class="ap">저자 : 이도우</span><br>
			<span class="mr-2" style="color:BDBDBD; font-size:0.7px;"><i class="fas fa-square-full"></i></span><span class="ap">출판사 : 동양출판사</span>
			
			<div class="mt-2 pr-2">
			<div class="pt-2 float-right">
					<form>
					<input type="hidden" name="watch_id" value="1">
					<button class="btn btn-outline-secondary" type="submit">상세보기</button>
				</form>
			</div>
			<div class="pt-2 pr-2 float-right">
				<form>
					<input type="hidden" name="watch_id" value="1">
					<button class="btn btn-outline-secondary" type="submit">관심도서등록</button>
				</form>
			</div>
			</div>
			<div class="bg-light p-3">상태 : <span>&nbsp;&nbsp;대출가능</span></div>
			</td>
		</tr>
		
		<%
			}
		%>
		</tbody>
	</table>
	</div>
	<%
		}else{
		%>	
			<div class="mb-3 pl-3">
			<h4><span style="color:#A593E0;"><i class="fas fa-search"></i></i></i></span>&nbsp;&nbsp;검색결과</h4>
			<div class="mt-3">
				<span class="border m-2 mt-1 p-1 pr-2 pl-2 "><%=keyKor%></span><span class="keyword"><strong><%=keyword %></strong></span><span class="oth">(의)로 검색한 결과 </span><span class="count">총 122권</span>
			</div>
			</div>
			<div class="row border justify-content-md-center" style="text-align: center;">
			<div class="p-5">
				<p><span style='font-size:60px;'>&#128531;</span></p>
				<div>
					"<span class="non_keyword"><%=keyword %></span>"<span>에 대한 검색 결과가 없습니다.</span>
				</div>
			</div>
			</div>
		<%
		}
	%>
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
    	
    	//몇개씩 보여줄지
    	displayLength: 6
    }
    		
    );
    
} );
    </script>
</body>
</html>