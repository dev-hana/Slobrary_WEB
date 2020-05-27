<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="memMgr" class="database.MemMgr" />
     <%
     String contentPage=request.getParameter("contentPage");
     if(contentPage==null){
    	 contentPage="MyPageList.jsp";
     }
     
	String mem_id = (String)session.getAttribute("loginKey");
	if(mem_id==null) {
	%>
		   <script>
		   alert("로그인 후 사용 가능합니다.");
		   location.href="../Login.jsp";
		   </script>
	<%} else{
		MemBean memBean = memMgr.getMember(mem_id);
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 아이콘 -->
<link rel="shortcut icon" href="/img/favicon.ico">
<!-- css -->
<link href="/css/MyPage.css?v=1" rel="stylesheet" />
 <meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>
<body class="bg-light">
	<jsp:include page="../Top.jsp" flush="false"/>
	<div class="container-fluid">
		<div class="row mt-5 justify-content-md-center">
			<div class="col-xl-3 mr-3">
				<div class="shadow-sm p-3 mb-5 bg-white rounded">
				<div class="row1 mb-4">
					<div style="float:left;"><h5>내 정보</h5></div> <div style="float:right;"><button onClick="location.href='MyInfo.jsp'" class="btn btn-outline-secondary btn-sm" type="sumbit">수정</button></div>
				</div>
				<div class="row2">
					<div class="img1">
						<img style="width:110px; height:110px;" class="rounded-circle shadow-sm" src="/img/default/userImg/girl1.png">
					</div>
					<div style="text-align: left; margin-left: 10px; margin-bottom: 20px;">
						<span><%=memBean.getMem_id() %></span>
						<p><%=memBean.getMem_mail() %></p>
					</div>
				</div>
				<div class="row3">
					<ul class="list-group mypage">
						<li class="list-group-item list-group-item-action"><a href="#">내 서재</a></li>
						<li class="list-group-item list-group-item-action"><a href="#">연체도서</a></li>
						<li class="list-group-item list-group-item-action"><a href="WishList.jsp">희망도서</a></li>
					<li class="list-group-item list-group-item-action"><a href="#">관심도서</a></li>
				</ul>
				</div>
			</div>
				<div class="shadow-sm p-4 mb-5 bg-white rounded">
					<jsp:include page="/contents/UserChart.jsp" flush="false"/>
				</div>
			</div>
			<div class="col-xl-4">
				<jsp:include page="<%=contentPage %>" flush="false"/>
			</div>
		</div>
		
	</div>
</body>
</html>
<%}%>