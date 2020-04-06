<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset:UTF-8" charset="UTF-8" />
    <% request.setCharacterEncoding("UTF-8"); %>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fork Login</title>
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
    <h1 style="text-align:center">Login</h1><br />
    <div class="glogin">
        <br/>
        <span style="text-align:center;display:block">Login Please</span><hr /><br>
        <form method="post" action="LoginProc.jsp">
        <input type="text" name="email" id="email" class="gtxt " placeholder="Email" onchange="BlurRemoveCss('txtUser')" /><br /><br />
        <input type="password" name="password" id="password" placeholder="Password" class="gtxt " onchange="BlurRemoveCss('txtPassword')" /><br/><br/>
        <p style="text-align:center">
            <input type="submit" value="Login" class="btn btn-info gbtn" />
            <a href="Signup.jsp">
                <input type="button" class="btn btn-info gbtn" id="Signup" value="Sign up"/>
            </a><br>
        </p>
        </form>
    </div>
</div>
</body>
</html>