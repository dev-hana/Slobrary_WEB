<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userBean" class="db.UserMgr" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile Image</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">
        body {
            background-color: #FFDCDC;
        }
        #profile{
        	text-align: center;
        }

        .Pro {
            background-color: white;
            margin: auto;
            width: 350px;
            border: solid 1px #218d8d;
            padding: 5px;
            border-radius: 5px;
            margin-bottom: 4%;
        }

            .Pro:hover {
                box-shadow: 0 15px 20px rgba(0, 0, 0, 0.3);
            }

        .gtxt {
            border: none;
            border-bottom: solid 1px #a7d4d4;
            width: 80%;
            display: block;
            margin: auto;
            padding: 5px;
        }

        .gbtn {
            margin-bottom: 10px;
        }
        #no{
        	background-color:#FFB2D9;
        	border:#EDA0C7;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <br><br>
    <h1 style="text-align:center">Profile Image</h1><br/>
    <div class="Pro"><br/>
    	<div id="profile">
    	<p class="gtxt">프로필 이미지를 선택하시겠습니까?</p>
    	<form action="SetProfileImgProc.jsp" method="post" enctype="multipart/form-data">
        <br>	
        	<input type="hidden" name="email" value="<%= request.getParameter("email") %>"/>
        	<input type="file" name="image"><hr><br>
        	<input type="submit" value="YES" class="btn btn-info gbtn" />
            <a href="Login.jsp">
                <input type="button" class="btn btn-info gbtn" id="no" value="NO"/>
            </a><br><br>
        </form>
        </div>
    </div>
</div>
</body>
</html>