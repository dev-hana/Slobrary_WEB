<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, db.*, beans.*"%>
<jsp:useBean id="userMgr" class="db.UserMgr" />
<!DOCTYPE html>
<html>
<head>
    <!-- Theme Made By www.w3schools.com -->
    <title>유저관리</title>
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
    	<h1>유저 관리</h1>
    </div>
    <input type="text" class="form-control" id="searchID" onkeyup="searchFunction()" placeholder="ID로 검색">
        <table id="userInfo" class="table">
            <thead>
                <tr>
                    <th>email</th>
                    <th>password</th>
                    <th>image</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
		Vector vResult= userMgr.getUserList();
        SignUpBean user;
		if(vResult.size() ==0){
		%>
		<tr> 
		<td align="center" colspan="8">등록된 사용자가 없습니다.</td>
		</tr>
		<%}else{
			for(int i=0; i<vResult.size(); i++){
			  user = (SignUpBean)vResult.get(i);
		%>
		<tr> 
		<td><%=user.getMem_email()%></td>
		<td><%=user.getMem_passwd()%></td>
		<td><%=user.getMem_image()%></td>
		<td><a href="javascript:userDetail('<%=user.getMem_email()%>');">상세보기</a></td>
		</tr>
		<%	}
		}%>
            </tbody>
        </table>
        <hr>
    </div>
<br>
    
<form name="detail" method="post" action="UserDetail.jsp" >
		<input type="hidden" name="email">
		</form>
    
    <script>
        function userDetail(email) {
			document.detail.email.value=email;
			document.detail.submit();
	}
    </script>

</body>
</html>