<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, db.*, beans.*"%>
<jsp:useBean id="userMgr" class="db.UserMgr" />
<!DOCTYPE html>
<html>
<head>
    <!-- Theme Made By www.w3schools.com -->
    <title>리뷰 상세보기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
    	.input-group {
    		margin-bottom : 30px;
    	}
    </style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="60" style="padding-top:70px">
   <%@ include file="Top.jsp" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String currentEmail = request.getParameter("email");
	System.out.println(currentEmail);
	SignUpBean vResult= userMgr.getUser(currentEmail);
%>
    <div id="contents" class="container" style="margin = 0px 400px 0px 400px">
    	<div style="text-align:center; padding:50px; border-bottom: 1px solid; border-top:1px solid; margin-bottom:30px" >
        <h1>상세 정보</h1>
    	</div>
    	<button type="button" onclick="back()" class="btn btn-default pull-right">뒤로</button>
    	<form action="UserProc.jsp?flag=delete" method="post">
    		<input type="hidden" name="currentEmail" value="<%=currentEmail%>">
			<input type="submit" class="btn btn-default" value="삭제">
		</form>
        	<br><br><br>
        	<form method="post" action="UserProc.jsp?flag=update" enctype="multipart/form-data">
						<input type="hidden" class="form-control" name="current_email" value="<%=vResult.getMem_email()%>">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">이메일</span> 
								<input type="text" class="form-control" name="mem_email" value="<%=vResult.getMem_email()%>">
							</div>
							<div class="input-group">
								<span class="input-group-addon">비밀번호</span> 
								<input type="text" class="form-control" name="mem_passwd" value="<%=vResult.getMem_passwd()%>">
							</div>
							<div class="input-group">
								<span class="input-group-addon">이미지</span> 
								<input type="file" class="form-control" name="mem_image" value="<%=vResult.getMem_image()%>">
							</div>
							<label></label> <label></label>
						
							<div style="text-align:center">
								<input type="submit" onclick="update()" class="btn btn-default" value="수정">&nbsp;&nbsp;&nbsp;
								<input type="reset" class="btn btn-default" value="초기화">&nbsp;&nbsp;&nbsp;
							</div>
						</div>
                    </form>
                </div>
   

    
    <script>
    function back(){
    	var result = confirm("정말 뒤로 가시겠습니까?");
		if (result) location.href="UserMgr.jsp";
    };
    
    function delUser(no){
    	var result = confirm("정말 삭제하시겠습니까?");
		if (result) location.href="UserProc.jsp?currentEmail="+no+"&flag=delete";
    };
    </script>

</body>
</html>