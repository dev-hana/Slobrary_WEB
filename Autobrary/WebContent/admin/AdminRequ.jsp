<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>관리자 신청</title>
<%@ include file="/CND.jsp" %>
<link href="../css/signup.css" rel="stylesheet">
</head>
<body class="bg-light">
<header>
<%@ include file="Setside.jsp" %>
<%@ include file="AdminTop.jsp" %>
</header>
 <div id="document">
        <div class="row p-5 ml-5 mr-5">
            <div class="col bg-white shadow-sm p-5 ml-5 mr-5">
                <div id="wrapper">
                
                <hr>
                <form action="AdminRequProc.jsp" name="info" target="list" method="post" id="signup-form" class="needs-validation" novalidate>
             
                    <div class="form-group">
                        <!-- 계정 정보 -->
                        <label for="mem_id">아이디</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="id" placeholder="아이디를 입력해주세요." name="id" required>
                            <button id="idCheck" class="btn btn-light">중복확인</button>
                        </div>

                        <label for="pwd">비밀번호</label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="pwd" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d](?=.*[!@#$%^&*()_-+=[]{}~?:;`|/]){8,}$" placeholder="숫자, 대/소문자 포함 8글자 이상 입력해주세요." name="pwd" required>
                            <button type="button" id="btnToggle_pwd" class="toggle"><i id="eyeIcon_pwd" class="fa fa-eye"></i></button>
                            <div class="invalid-feedback mb-3">숫자, 대/소문자 포함 8글자 이상 입력해주세요.</div>
                        </div>
                        <div class="input-group">
                            <input type="password" class="form-control" id="pwdCheck" placeholder="비밀번호 확인" name="pwdCheck" required>
                            <button type="button" id="btnToggle_pwdCheck" class="toggle"><i id="eyeIcon_pwdCheck" class="fa fa-eye"></i></button>
                        </div>
                        <div class="alert alert-success mt-2" id="alert-success">비밀번호가 일치합니다.</div>
                        <div class="alert alert-danger mt-2" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
                        
                        <br>
                        <!-- 회원 정보 -->
                        <label for="name">이름</label>
                        <input type="text" class="form-control" id="name" name="name" required>

                        <label for="phone">전화번호</label>
                        <input type="tel" class="form-control" id="phone" placeholder="01012345678" name="phone" required>
                        <div class="invalid-feedback">01012345678 형식으로 입력해주세요.</div>
                        
                        
						<label for="rank">직위</label>
                        <div class="mb-1 mt-n2">
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="staff" name="rank" class="custom-control-input" value="staff" checked>
                                <label class="custom-control-label" for="gender_male">staff</label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="master" name="rank" class="custom-control-input" value="master">
                                <label class="custom-control-label" for="gender_female">master</label>
                            </div>
                        </div>
                        
                    </div>
                    <button id="submit-btn" type="submit" class="btn btn-primary">신청하기</button>
					</form>
                </div>
            </div>
        </div>
    </div>

<script>
	$('#idCheck').click(function(){
		if( $('#id').val() == ""){
		alert("아이디를 입력해주세요.")
		}else if( ($('#id').val() < "0" || $('#id').val() > "9") && ($('#id').val() < "A" || $('#id').val() > "Z")
				&& ($('#id').val() < "a" || $('#id').val() > "z")){
			alert("한글 및 특수문자는 아이디로 사용할 수 없습니다.");
		}else{
		
		url="AdminIdCheck.jsp?id=" + $('#id').val();
		window.name = "parentForm";
		window.open(url,"cildForm","width=300,height=150");
		}
		});
</script>
<script type="text/javascript" src="../js/signup.js"></script>
</body>
</html>