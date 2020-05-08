<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=1">
    <title>Slobrary - 로그인</title>
	<jsp:include page="/CND.jsp" flush="false"/>
    <link href="css/login.css" rel="stylesheet">
</head>
<body class="bg-light">
    <header>
    <jsp:include page="Top.jsp" flush="false"/>
    </header>
    <div id="document">
        <div class="row p-5 ml-5 mr-5">
            <div class="col bg-white shadow-sm p-5 ml-5 mr-5">
                <div id="wrapper">
                <h4>로그인</h4>
                <hr>
                <form action="LoginProc.jsp" method="post" id="login-form">
                    <div class="form-group">
                        <label for="input_id">아이디</label>
                        <input type="text" class="form-control" id="input_id" name="mem_id" placeholder="아이디를 입력해주세요.">

                        <label for="input_pw">비밀번호</label>
                        <input type="password" class="form-control" id="input_pw" name="mem_pw" placeholder="비밀번호를 입력해주세요.">

                        <div class="custom-control custom-checkbox mt-1">
                            <input type="checkbox" class="custom-control-input" id="remember" name="remember" value="true">
                            <label class="custom-control-label" for="remember">내 정보 기억하기</label>
                        </div>
                        <div id="btn-group" class="mt-3 mb-3 float-right">
                            <a href="#">비밀번호 찾기</a>
                            <span>|</span>
                            <a href="Signup.jsp">회원가입</a>
                        </div>
                        <input id="submit-btn" type="submit" class="btn btn-dark mt-5" value="로그인">
                    </div>
                </form>
            </div>
            </div>
        </div>
    </div>

</body>
</html>