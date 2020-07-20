<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<style>
.book{
	font-size: 13px;
	color: #585858;
}
.table{
	text-align: center;
}
.author{
	font-size: 12px;
	color: #585858;
}
.bt{
	border-top: 2px solid #D8D8D8;
}

</style>

<!-- 아이콘 -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%
		int n = 4; // 데이터 개수
		int count=1;
		int line = n/4;
		if(n%2==1){
			line+=1;
		}

	%>	
		<div class="mb-3 pl-3">
			<h5><span style="color:#A593E0;"><i class="fas fa-bookmark"></i></span>&nbsp;&nbsp;신간도서</h5>
		</div>
		<div class="pr-2 pl-2">
			<hr>
			<table class="table table-borderless pl-2 pr-2">
	<%
		for(int i=0;i<line;i++){
			%>
				<tr>
			<%
			while(count<=n){
				%>
					<td>
						<img class="shadow-sm mb-2" width="115" height="160" alt="이미지가 없습니다." src="/img/ex1.jpg"><br>
						<p class="book">내가 원하는 것을  아무도 모를 때</p><p class="author">이도우</p>
					</td>
				<%
				if(count%4==0){
					count+=1;
					break;
				}
				count+=1;
			}
			%>
				</tr>
			<%
		}
	%>
			</table>
		</div>
	<%
		count=1;
	%>	
		<div class="mb-3 pl-3">
			<h5><span style="color:#A593E0;"><i class="fas fa-bookmark"></i></span>&nbsp;&nbsp;베스트셀러</h5>
		</div>
		<div class="pr-2 pl-2">
			<hr>
			<table class="table table-borderless pl-2 pr-2">
	<%
		for(int i=0;i<2;i++){
			%>
				<tr>
			<%
			while(count<=8){
				%>
					<td>
						<img class="shadow-sm mb-2" width="115" height="160" alt="이미지가 없습니다." src="/img/ex1.jpg"><br>
						<p class="book">내가 원하는 것을  아무도 모를 때</p><p class="author">이도우</p>
					</td>
				<%
				if(count%4==0){
					count+=1;
					break;
				}
				count+=1;
			}
			%>
				</tr>
			<%
		}
	%>
			</table>
		</div>
</body>
</html>