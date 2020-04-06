<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, db.*, beans.*"%>
<jsp:useBean id="reviewMgr" class="db.ReviewMgr" />
<!DOCTYPE html>
<html>
<head>
    <!-- Theme Made By www.w3schools.com -->
    <title>리뷰관리</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <!-- link rel="stylesheet" href="admin.css"-->
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="60" style="padding-top:70px">
   <%@ include file="Top.jsp" %>
   <%
   		if (check == null)
   			response.sendRedirect("AdminLogin.jsp");
   %>
    <div id="contents" class="container" style="margin = 0px 400px 0px 400px">
    <div style="text-align:center; padding:50px; border-bottom: 1px solid; border-top:1px solid; margin-bottom:30px" >
    	<h1>리뷰 관리</h1>
    </div>
    <input type="text" class="form-control" id="searchID" onkeyup="searchFunction()" placeholder="ID로 검색">
        <table id="userInfo" class="table">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>writer</th>
                    <th>title</th>
                    <th>rating</th>
                    <th>date</th>
                    <th>store</th>
                    <th>contents</th>
                    <th>hashtag</th>
                    <th>heart_cnt</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
		Vector vResult= reviewMgr.getReviewList();
        ReviewBean review;
		if(vResult.size() ==0){
		%>
		<tr> 
		<td align="center" colspan="9">등록된 리뷰가 없습니다.</td>
		</tr>
		<%}else{
			for(int i=0; i<vResult.size(); i++){
			review = (ReviewBean)vResult.get(i);
		%>
		<tr> 
		<td><%=review.getNo()%></td>
		<td><%=review.getWriter()%></td>
		<td><%=review.getTitle()%></td>
		<td><%=review.getRating()%></td>
		<td><%=review.getDate()%></td>
		<td><%=review.getStore()%></td>
		<td><%=review.getContents()%></td>
		<td><%=review.getHashtag()%></td>
		<td><%=review.getHeart_cnt()%></td>
		<td><a href="javascript:reviewDetail('<%=review.getNo()%>');">상세보기</a>
		</tr>
		<%}
		}%>
            </tbody>
        </table>
        <hr>
    </div>
<br>
    
<form name="detail" method="post" action="ReviewDetail.jsp" >
		<input type="hidden" name="no">
		</form>
    
    <script>
        function reviewDetail(no) {
			document.detail.no.value=no;
			document.detail.submit();
	}
    </script>

</body>
</html>