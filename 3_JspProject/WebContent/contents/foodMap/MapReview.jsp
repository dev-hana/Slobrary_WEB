<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, beans.ReviewBean"%>
<jsp:useBean id="sBean" class="mapAPI.Search"></jsp:useBean>
<jsp:useBean id="revBean" class="db.ReviewMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="ReviewList.css" type="text/css" rel="stylesheet">
<link href="ReviewMenu.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script language="JavaScript" src="myPage.js"></script>
</head>
<body>
	<% 
		String ins = request.getParameter("store_addr");
		Vector revList = revBean.SDReviewList(ins);
	%>
	<div>
		<%
			for(int i=0;i<revList.size();i++){
				ReviewBean myReview = (ReviewBean)revList.get(i);
		%>
			<div class=mylist style="display: inline-block; position: relative; z-index: 1;margin: 20px 0 0 20px;font-size: 12px;">
				<div class="title"><%= myReview.getStore() %></div><br>
				<h5><%= myReview.getTitle() %></h5>
				<br>
				
				<%= myReview.getContents() %><br>
         		<%= myReview.getHashtag() %>
                  
			</div>
			
		<%
			}
		%>
	</div>
</body>
</html>