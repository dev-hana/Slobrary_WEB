<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset:UTF-8" charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fork Sign up</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">
        body {
            background-color: #FFDCDC;
        }

        .glogin {
            background-color: white;
            margin: auto;
            width: 350px;
            border: solid 1px #218d8d;
            padding: 5px;
            border-radius: 5px;
            margin-bottom: 4%;
        }

            .glogin:hover {
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

            .gtxt:hover {
                border-bottom: solid 2px #034b4b;
            }

        .gbtn {
            margin-bottom: 10px;
        }
        #Signup{
        	background-color:#FFB2D9;
        	border:#EDA0C7;
        }
    </style>
</head>
<body>
<jsp:include page="../Top.jsp" flush="false"/>
<div class="container-fluid">
    <br /><br /><br />
    <h1 style="text-align:center">Sign Up</h1><br />
    <div class="glogin"><br/>
    	<form action="SignUpProc.jsp" method="post">
        <br>
        <input type="text" name="mem_email" id="email" class="gtxt " placeholder="이메일" onchange="BlurRemoveCss('txtUser')" /><br /><br />
        <input type="password" name="mem_passwd" id="password" placeholder="비밀번호" class="gtxt " onchange="BlurRemoveCss('txtPassword')" /><br/><br/>
        <input type="password" name="ok_passwd" id="passok" placeholder="비밀번호 확인" class="gtxt " onchange="BlurRemoveCss('txtPassword')" /><br/><br/>
        <p style="text-align:center">
                <input type="submit" id="Signup" value="Sign up" class="btn btn-danger gbtn" /><br/>
        </p>
        </form>
    </div>
</div>
</body>
</html>