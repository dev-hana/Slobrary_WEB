<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<%@ page import="java.util.*,java.util.regex.*, database.*" %>
<jsp:useBean id="reportMgr" class="database.ReportMgr" />
<jsp:useBean id="bookMgr" class="database.BookMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.carousel-control-prev-icon {
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23A593E0' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E");
}

.carousel-control-next-icon {
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23A593E0' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E");
}
.carousel-item{
	text-align:center;
}
.carousel-inner > .item > img {
  width:65%;
  margin: 0 auto;
}
</style>
</head>
<body>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>독후감</th>
			</tr>
		</thead>
		<tbody>
		<%
		ReportBean reportBean = reportMgr.getReport("3");
		String content = new String();
		%>
			<tr>
				<td>
					
					<%
						String text = reportBean.getContent();
						if(text.contains("<img")){
							//이미지 태그 src 추출 후 이미지 태그 제거
					        Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
					        Matcher matcher = pattern.matcher(text);
					        
					        List<String> img = new ArrayList<>();
					        while(matcher.find()){
					            img.add(matcher.group(1));
					            img.add("/img/test.jpg");
					            content = matcher.replaceAll("");
					        }
					        System.out.println(content);
					%>
					<!-- 이미지가 있는 경우 -->
					<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
					  <div class="carousel-inner justify-content-center">
					    <% 
					    for(int i=0;i<img.size();i++){
					    	if(i==0){
					    		%>
					    		<div class="carousel-item item active">
							      <img class="img-fluid" src="<%=img.get(i) %>" class="img-responsive" alt="...">
							    </div>
					    		<%
					    	}else{
					    		%>
					    		<div class="carousel-item item">
							      <img class="img-fluid" src="<%=img.get(i) %>" alt="...">
							    </div>
					    		<%
					    	}
					    }
					    %>
					    
					    
					  </div>
					  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					  </a>
					  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					  </a>
					</div>
					<%} %>	
					<div>
						<%=content %>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>