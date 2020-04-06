<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, beans.ReviewBean"%>
<jsp:useBean id="revBean" class="db.ReviewMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<% 
		String email = (String) request.getParameter("email");
		String state = (String) request.getParameter("state");
		String ins = request.getParameter("store_addr");
		Vector mapList = revBean.SDReviewList(ins);
		if(state==null){
			state="revlist";
		}
		Vector myVector = new Vector();
		Vector revList = revBean.myReviewList(email);
		Vector heartList = revBean.heartReviewList(email); 
		ReviewBean myReview = new ReviewBean();
		
		if (state.equals("heartlist")) myVector = heartList; 
		else if (state.equals("revlist")) myVector = revList;
		else if (state.equals("maplist")) myVector= mapList;
		if (myVector.size() == 0) {
			out.println("<div class='container' style='border: 1px solid #ccc;' ><h2>등록된 리뷰가 없습니다!</h2></div>");
		}else{
	%>
	<script type="text/javascript">
$(function() { $(".heart").on("click", function() {
	    $(this).toggleClass("heart-blast");
		document.addHeart.submit();
	  });
	}); 
</script>
		<%
				for(int i=0;i<myVector.size();i++){
					myReview = (ReviewBean)myVector.get(i);
					System.out.println(request.getContextPath()+"/image/reviewDB/"+myReview.getImage());
		%>
		<div class="mylist container" style="border: 1px solid #ccc;">
        <img class="float-right" style="width: 200px;" src="<%= request.getContextPath() %>/image/reviewDB/<%=myReview.getImage()%>">
        <div><b><%= myReview.getStore() %></b><br>
        <%=myReview.getStore_addr()%></div>
        <h3><%= myReview.getTitle() %></h3>
        <h4><%
                    	int rate = myReview.getRating();
                    	for (int j=0; j<rate; j++)
                    		out.print("★");
                    	%></h4>
        <div id="content"><%= myReview.getContents() %></div><br>
        <div><kbd>#</kbd> <%= myReview.getHashtag() %></div><br>
        <div class="float-left"><div class="heart"></div></div>
        <div style="padding-top:5px;"><%= myReview.getHeart_cnt() %></div>
     <% if(state.equals("revlist")==true) { %>
        <div class="dropdown float-right">
					<input type="hidden" name="review_no" value="<%=myReview.getNo()%>">
                    <button class="btn btn-dark dropdown-toggle" data-toggle="dropdown">
                    	메뉴
                  </button>
                  <div class="dropdown-menu">
                  		<form method="post" action="MyReviewUpdate.jsp">
                  			<input type="hidden" name="no" value="<%=myReview.getNo()%>">
                  		<button type="submit" class="dropdown-item btn">리뷰 수정</button>
                  		</form>
                  
                  		<form method="post" action="ReviewProc.jsp?flag=delete">
                  			<input type="hidden" name="no" value="<%=myReview.getNo()%>">
                  		<button type="submit" class="dropdown-item btn">리뷰 삭제</button>
                  		</form>
                  </div>
        		 </div>
        <%} %>
				</div>
		<%
			}
		%>
		
		<form name="addHeart" method="post" action="<%=request.getContextPath()%>/contents/review/LikeReviewProc.jsp" >
		<input type="hidden" name="review_no" value="<%=myReview.getNo()%>">
		</form>
		<%
		}%>
</body>
</html>