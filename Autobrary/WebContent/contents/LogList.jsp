<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
<style>
.author{
	color: #A6A6A6;
	font-size: 13px;
}
.dropdown-menu {
  width: 100%; 
}

.btn{
 width: 100%;
}
.dropdown-menu {
	font-size: 14px;
    min-width: 75px !important;
    text-align: cecnter !important;
}

.carousel-control-prev-icon {
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23BDBDBD' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E");
}

.carousel-control-next-icon {
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23BDBDBD' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E");
}
.line{
	border-bottom: 6px solid rgba(165,147,224,0.3) !important;
}

</style>
</head>
<body>
<div class="mt-1">
<%
	String type =request.getParameter("type");

	//리뷰리스트
	if(type.equals("review")){
		int n=23; //리뷰개수
		int tab=0; //1탭 5리뷰
		int star=3;
		boolean open = true;
		%>
		
		<div class="tab-content mb-1">
		
		<%
		for(int a=1;a<=n;a++){
			if(a==1 || open==true){
				if(a==1){
					System.out.println("a==1--------<div>");
					open=false;
		%>		
				<div class="tab-pane fade show active" id="tab<%=tab %>">
		<%
				tab++;
				}else{
					System.out.println("open=true--------<div>");
					open=false;
		%>
				<div class="tab-pane fade" id="tab<%=tab %>">
		<%
				tab++;
				}
			}
	%>
		<table class="table">
			<thead>
				<tr>
      				<th><div><sapn>아무도 나를 모를 때<%=a %></span><span class="author ml-2">이도우 (2020.05.16)</span>
      				<div class="dropdown float-right">
					  <button class="btn pl-2 pr-2" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    <span style="color:#5D5D5D;"><i class="fas fa-ellipsis-v"></i></span>
					  </button>
					  <div class="dropdown-menu dropdown-menu-left" aria-labelledby="dropdownMenuButton">
					    <a class="dropdown-item float-left" href="#">수정</a>
					    <a class="dropdown-item float-left" href="#">삭제</a>
					  </div>
				</div>
				</div>			
				</th>
    			</tr>
			</thead>
			<tr>
				<td>
					<div class="mb-2" style="font-size: 20px;">
						<%
							for(int i=1;i<=5;i++){
								if(i<=star){
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
					</div>
					<div>
						이 책에는 우리 모두가 고통받는 이유가 나와 있다. 그 이유는 기업이나 조직들이 구성원들을 사람이 아니라 거대한 기계를 구성하며 쉽게 갈아끼울 수 있는 톱니바퀴로 만들고 싶어 하기 때문이다. 톱니바퀴를 더 쉽게 갈아 끼울 수 있다면 돈은 더 적게 줘도 된다. 게다가 지금까지 이렇게 되는 과정에 노동자들은 스스로 동참했다. 우리는 개인의 이익을 위해 우리의 무덤을 팠다.
					</div>
				</td>
			</tr>
		</table>
		<%
			if(a%5==0|| a==n){
				System.out.println("a%=5ora==n--------</div>");
					%>
					</div>
					<%
					open=true;
				}
			}
		%>
			<hr>
			</div>
		<div class="mb-2 mt-4">
			<nav>
			  <ul class="nav nav-pills justify-content-center">
			    <%
			    	for(int k=0;k<tab;k++){
			    %>
			    <li class="page-item"><a class="page-link" data-toggle="pill" href="#tab<%=k %>"><%=k+1 %></a></li>
			    <%} %>
			  </ul>
			</nav>
		</div>
		<%
	}else if(type.equals("diary")){
		%>
		<div class="p-3">
		<button type="button" class="btn btn-outline-secondary float-right col-xl-2 mb-3 btn-sm">일기쓰기</button>
		<%
		for(int i=0;i<5;i++){
	%>
		<table class="table table-bordered line mb-5">
			<tr>
				<td>
					<div>
						<span>나의 첫 독서 일기</span><span class="author ml-3">2020년 6월 23일</span>
						<div class="dropdown float-right">
					  		<button class="btn pl-2 pr-2" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    		<span style="color:#5D5D5D;"><i class="fas fa-ellipsis-v"></i></span>
					  		</button>
					  	<div class="dropdown-menu dropdown-menu-left" aria-labelledby="dropdownMenuButton">
					    	<a class="dropdown-item float-left" href="#">수정</a>
					    	<a class="dropdown-item float-left" href="#">삭제</a>
					  	</div>
					</div>
					
				</td>
			</tr>
			<tr>
				<td>
				<div id="imgCarousel<%=i %>" class="carousel slide" data-interval="false" data-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img class="d-block w-100" style="width:100%; height:50%; object-fit:contain;" src="/img/mem1.png" alt="First slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100" style="width:100%; height:50%; object-fit:contain;" src="/img/test.jpg" alt="Second slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100" style="width:100%; height:50%; object-fit:contain;" src="/img/ex2.jpg" alt="Third slide">
				    </div>
				  </div>
				  <a class="carousel-control-prev" href="#imgCarousel<%=i %>" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#imgCarousel<%=i %>" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
				<div class="p-3 mt-1 mb-1">
				일기는 날마다 그날그날 겪은 일이나 생각, 느낌 따위를 적는 개인의 기록을 가리킨다. 요즘은 다양한 방법으로 일기를 쓰는데, 그날 겪은 일 중에서 기억에 남는 일을 적기도 하지만, 특정한 테마를 갖고 일기를 작성하기도 한다. 독서일기장은 독서를 테마로 일기를 작성하는 것을 말하는데, 책을 읽고 느낀 점이나 생각한 바를 일기 형식을 빌어 작성하는 것이다. 평소에 쓰는 일기 쓰기 방식을 취하되, 내용이나 주제, 소재 등을 책에서 찾는 것이 다른 점이라 할 수 있다. 즉, 일반적인 일기가 자신의 감정을 표현하는 것이라면, 독서 일기는 책을 읽고 느낀 바나 생각한 바를 토대로 한다는 것이 다르다. 책의 주인공에게 편지를 쓰듯 일기를 쓰기도 하고, 줄거리를 요약한다거나 가장 인상 깊은 장면에 대해 쓰는 것도 독서일기장을 기록하는 방법이다.
				</div>
				</td>
			</tr>
		</table>
	<%
		}
		%>
		</div>
		<%
	}
%>

</div>
</body>
</html>