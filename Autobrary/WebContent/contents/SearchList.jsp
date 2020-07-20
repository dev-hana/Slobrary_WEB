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
.title a:hover{
	color: #424242;
	text-decoration: underline;
}
.title a:link { color: #424242; text-decoration: none;}
.title a:visited { color: #424242; text-decoration: none;}
</style>

<%
	request.setCharacterEncoding("UTF-8");
	String keytype = request.getParameter("keytype");
	String keyword = request.getParameter("keyword");
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
	
	boolean result=false;
%>
</head>
<body>
	<%
		//검색결과가 있는 경우
		if(result){
	%>
  	<div class="mb-3 pl-3">
			<h4><span style="color:#A593E0;"><i class="fas fa-search"></i></i></i></span>&nbsp;&nbsp;검색결과</h4>
			<div class="mt-3">
				<span class="border m-2 mt-1 p-1 pr-2 pl-2 "><%=keyKor%></span><span class="keyword"><strong><%=keyword %></strong></span><span class="oth">(의)로 검색한 결과 </span><span class="count">총 122권</span>
			</div>
	</div>
  	<div class="pr-2 pl-2">
	<table class="table">
		<%
			for(int i=0; i<5;i++){
				
		%>
		<tr>
			<td class="img pt-3">
				<img width="110" height="140" alt="이미지가 없습니다." src="/img/book2.jpg">
			</td>
			<td><span class="title">도서명 : <a href="/" target="_parent">내가 원하는 것을 나도 모를 때</a>	&nbsp;&nbsp;&#124;&nbsp;&nbsp;저자 : 이도우&nbsp;&nbsp;&#124;&nbsp;&nbsp;출판사 : 동양출판사</span>
			
			<div class="p-3">
			<div style="float:right;" class="mt-5">
					<form>
					<input type="hidden" name="watch_id" value="1">
					<button class="btn btn-outline-secondary" type="submit">상세보기</button>
				</form>
			</div>
			<div class="pr-2 mt-5" style="float:right;">
				<form>
					<input type="hidden" name="watch_id" value="1">
					<button class="btn btn-outline-secondary" type="submit">관심도서등록</button>
				</form>
			</div>
			</div>
			<div class="bg-light p-3 mt-4">상태 : <span>&nbsp;&nbsp;대출가능</span></div>
			</td>
		</tr>
		
		<%
			}
		%>
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
</body>
</html>