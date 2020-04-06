<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="beans.SignUpBean" %> 
<jsp:useBean id="userBean" class="db.UserMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="MyPage.css">
<title>MyPage</title>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="60">
<jsp:include page="../Top.jsp" flush="false"/>
<% 	
String myemail = (String)session.getAttribute("email");
System.out.println(myemail);
	if (myemail == null) {
		response.sendRedirect("../login/Login.jsp");
	}
	SignUpBean user = userBean.getUser(myemail);
	
	String contentPage = request.getParameter("CONTENTPAGE");
	if(contentPage==null){
		contentPage="../review/ReviewList.jsp?email="+myemail;
	}

	
%>
<div class="myPage container">
		<div class="profile">
			<div class="row">
                <div id="profile_image" class="col-sm-3">
                    <img src="<%= request.getContextPath() %>/image/UserDB/<%= user.getMem_image() %>">
                </div>
                <div id="profile_info" class="col-sm-8">
                    <div id="info_text">
                    <h2><%=user.getMem_email()%></h2>
                        <br><br><br>
                    </div>
                    <div id="info_btn" class="pull-right">
                    <input type=button class="btn btn-info" value="정보수정"/>
                    <input type=button class="btn btn-danger" value="탈퇴하기"/>
                    </div>
                </div>
			</div><br><hr>
		</div>
		<div id="profile_menu">
			<div class="row">
				<div class="col-sm-5">
					<a href="MyPage.jsp?CONTENTPAGE=../review/ReviewList.jsp&state=revlist&email=<%= user.getMem_email()%>">나의 리뷰</a>
				</div>
				<div class="col-sm-5">
					<a href="MyPage.jsp?CONTENTPAGE=../review/ReviewList.jsp&state=heartlist&email=<%= user.getMem_email()%>">좋아요 누른 리뷰</a>
				</div>
			</div>
		</div>
		<div id="contentPage">
    		<jsp:include page="<%=contentPage%>" flush="false"/>
		</div>
</div>
</body>
</html>