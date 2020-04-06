<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, beans.ReviewBean"%>
<jsp:useBean id="revBean" class="db.ReviewMgr"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="ReviewList.css" type="text/css" rel="stylesheet">
<link href="likeBtn.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<style type="text/css">
	.mylist {
    width: 500px;
    padding: 20px;
}

.mylist img{
    margin: 10px 10px 0px 0px;
}
#content {
    width: 50%;
}

.heart {
  width: 100px;
  height: 100px;
  background: url(http://imagizer.imageshack.com/img923/4545/XdJDuY.png) no-repeat;  
  cursor: pointer;
  margin:-30px;
}
.heart-blast {
  background-position: -2800px 0;
  transition: background 1s steps(28);
}

.dropdown {
    margin-bottom: 150px;
}
.dropdown button {
    font-size: 12px;
}

.container-border {
    border: 1px solid #ccc;
}

.float-right {
    float: right;
}

.float-left {
    float:left;
}
</style>
<script>
$(document).foundation();
$(function() {
  $('.button-like')
    .bind('click', function(event) {
      $(".button-like").toggleClass("liked");
    })
});
</script>
<title>Insert title here</title>
</head>
<body>
	<%
		String email = "dd@gmail.com";  //(String)session.getAttribute("email");
		
		System.out.println("hashtag : "+request.getParameter("hashtag"));
		if (request.getParameter("hashtag")==null || request.getParameter("hashtag").equals("")==true) {
			%>
				<script type="text/javascript">
					alert("해시태그를 입력해주세요 ");
				</script>
			<%
		}else { 
			String []hashtag=request.getParameter("hashtag").split("#");
			Vector revList = revBean.hashTagList(hashtag);
			
	%>
	<div>
		<%
			for(int i=0;i<revList.size();i++){
				ReviewBean hashReview = (ReviewBean)revList.get(i);
		%>
				<div class="mylist container" style="border: 1px solid #ccc;">
       			 <img class="float-right" style="width: 200px;" src="<%= request.getContextPath() %>/image/reviewDB/<%=hashReview.getImage()%>">
        		<div><b><%= hashReview.getStore() %></b><br>
        		<%=hashReview.getStore_addr()%></div>
        		<h3><%= hashReview.getTitle() %></h3>
        		<h4><%
                    	int rate = hashReview.getRating();
                    	for (int j=0; j<rate; j++)
                    		out.print("★");
                    	%></h4>
        		<div id="content"><%= hashReview.getContents() %></div><br>
        		<div><kbd>#</kbd> <%= hashReview.getHashtag() %></div><br>
        		<div style="padding-top:5px;"><%= hashReview.getHeart_cnt() %></div>
				<form method="post" action="../review/LikeReviewProc.jsp?flag=hash" target="like">
					<input type="hidden" name="review_no" value="<%=hashReview.getNo()%>">
					<button type="submit"class="button button-like">
  					<i class="fa fa-heart"></i>
  					<span>좋아요</span>
					</button>
				</form>
				<iframe name="like" style="display:none;"></iframe>
			</div>
		<%
			}
		}
		%>
</body>
</html>