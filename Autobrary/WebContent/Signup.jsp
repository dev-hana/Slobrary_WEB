<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
input[data-readonly] {
  pointer-events: none;
}
</style>
	<script type="text/javascript">
    function calcHeight(){
   	 //find the height of the internal page

   	 var the_height=
   	 document.getElementById('the_iframe').contentWindow.
   	 document.body.scrollHeight;

   	 //change the height of the iframe
   	 document.getElementById('the_iframe').height=
   	 the_height;

   	 //document.getElementById('the_iframe').scrolling = "no";
   	 document.getElementById('the_iframe').style.overflow = "hidden";
   }

   function iframeshow(){
       if($('#the_iframe').css('display') == 'none'){
       $('#the_iframe').show();
   }else{
       $('#the_iframe').show();
   }
   }
   
   function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/popup/AddressPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
			document.info.addr.value = roadFullAddr;		
	}
   
    </script>
    <title>Slobrary - 회원가입</title>
    <%@ include file="/CND.jsp" %>
    <link href="/css/signup.css" rel="stylesheet">
</head>
<body class="bg-light">
    <header>
    <jsp:include page="Top.jsp" flush="false"/>
    </header>
    <div id="document">
        <div class="row p-5 ml-5 mr-5" id="div1">
            <div class="col bg-white shadow-sm p-5 ml-5 mr-5" id="div2">
                <div id="wrapper">
                <h4>회원가입</h4>
                <hr>
                <form action="SignupProc.jsp" name="info" target="list" method="post" id="num-form" class="needs-validation" novalidate>
                <input type="hidden" name="form_type" value="인증번호 발송">
                    <div id="img-tab">
                        <div class="img-wrapper">
                            <img id="imgPreview" class="img-cover shadow-sm" src="img/default/userImg/girl1.png" alt="프로필사진">
                        </div>
                        <button id="openImgUpload" data-toggle="modal" data-target="#modal-img" class="btn btn-light shadow-sm" type="button"><i class="fas fa-camera"></i>&nbsp;&nbsp;프로필 사진 선택</button>
                        <input type="hidden" id="mem_img" name="mem_img" value="girl1.png">

                    </div><br>

                    <div class="form-group">
                        <!-- 계정 정보 -->
                        <label for="mem_id">아이디</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="mem_id" placeholder="아이디를 입력해주세요." name="mem_id" required>
                            <button id="idCheck" class="btn btn-light">중복확인</button>
                        </div>

                        <label for="pwd">비밀번호</label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="pwd" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d](?=.*[!@#$%^&*()_-+=[]{}~?:;`|/]){8,}$" placeholder="숫자, 대/소문자 포함 8글자 이상 입력해주세요." name="mem_pw" required>
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
                        <input type="text" class="form-control" id="name" name="mem_name" required>

                        <label for="gender_male">성별</label>
                        <div class="mb-1 mt-n2">
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="gender_male" name="mem_gender" class="custom-control-input" value="남" checked>
                                <label class="custom-control-label" for="gender_male">남</label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="gender_female" name="mem_gender" class="custom-control-input" value="여">
                                <label class="custom-control-label" for="gender_female">여</label>
                            </div>
                        </div>

                        <label for="birth">생년월일</label>
                        <input type="text" class="form-control" id="birth" name="mem_birth" placeholder="예: 19870423" required>

                        <label for="phone">전화번호</label>
                        <input type="tel" class="form-control" id="phone" placeholder="01012345678" name="mem_phone" required>
                        <div class="invalid-feedback">01012345678 형식으로 입력해주세요.</div>
						
						<label for="addr">주소</label>
						<div class="input-group">
                        <input type="text" class="form-control" id="addr" placeholder="" name="addr" data-readonly required>
                        <button id="address" class="btn btn-light" onclick="goPopup()">주소검색</button>
                        <div class="invalid-feedback">계속하려면 체크하십시오.</div>
						</div>
						
                        <label for="email">이메일</label>
                        <div class="input-group">
                        <input type="email" class="form-control" id="email" placeholder="abc@slobrary.com" name="mem_mail" required>
                        <button id="submit-btn" type="submit" class="btn btn-primary">인증번호 발송</button></div>
                        <div class="invalid-feedback">이메일 형식으로 입력해주세요.</div>

                    </div>
					</form>
					<form action="SignupProc.jsp" target="list" method="post" id="signup-form" class="needs-validation" novalidate>
					<input type="hidden" name="form_type" value="회원가입">
					<label for="num">인증번호 확인</label>
                    <input type="text" class="form-control" id="num" placeholder="" name="num" required>
					
                    <div class="form-check mb-3 mt-3">
                        <label class="form-check-label">
                            <input class="form-check-input" type="checkbox" id="tosCheck" required>
                            <a href="#" data-toggle="modal" data-target="#modal-TOS">이용약관</a>에 동의합니다.
                            <div class="invalid-feedback">계속하려면 체크하십시오.</div>
                        </label>
                    </div>
                    <button id="submit-btn" type="submit" class="btn btn-primary">회원가입</button>
                </form>
                </div>
            </div>
        </div>
        <iframe id="the_iframe" onload="calcHeight();" name="list" title="팝업" frameborder="0" scrolling="no" style="display:none; overflow-x:hidden; overflow:auto; width:100%;"></iframe>
    </div>

    <!--이용약관 모달-->
    <div class="modal fade" id="modal-TOS" tabindex="-1" role="dialog" aria-labelledby="modal-title" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modal-title">이용약관</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button id="btnAgreeTOS" onclick="modalAgreeTOS()" type="button" class="btn btn-primary">동의</button>
                </div>
            </div>
        </div>
    </div>

    <!--사용자 이미지 모달-->
    <div class="modal fade" id="modal-img" tabindex="-1" role="dialog" aria-labelledby="modal-title" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modal-title">프로필 이미지</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-sm">
                            <label class="image-radio">
                                <div class="img-wrapper">
                                    <img class="img-cover shadow-sm" src="img/default/userImg/girl1.png">
                                    <input type="radio" name="image_radio" value="girl1.png" checked>
                                </div>
                            </label>
                        </div>
                        <div class="col-sm">
                            <label class="image-radio">
                                <div class="img-wrapper">
                                    <img class="img-cover shadow-sm" src="img/default/userImg/girl2.png">
                                    <input type="radio" name="image_radio" value="girl2.png">
                                </div>
                            </label>
                        </div>
                        <div class="col-sm">
                            <label class="image-radio">
                                <div class="img-wrapper">
                                    <img class="img-cover shadow-sm" src="img/default/userImg/girl3.png">
                                    <input type="radio" name="image_radio" value="girl3.png">
                                </div>
                            </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm">
                            <label class="image-radio">
                                <div class="img-wrapper">
                                    <img class="img-cover shadow-sm" src="img/default/userImg/boy1.png">
                                    <input type="radio" name="image_radio" value="boy1.png">
                                </div>
                            </label>
                        </div>
                        <div class="col-sm">
                            <label class="image-radio">
                                <div class="img-wrapper">
                                    <img class="img-cover shadow-sm" src="img/default/userImg/boy2.png">
                                    <input type="radio" name="image_radio" value="boy2.png">
                                </div>
                            </label>
                        </div>
                        <div class="col-sm">
                            <label class="image-radio img-wrapper">
                                <div class="img-wrapper">
                                    <img class="img-cover shadow-sm" src="img/default/userImg/boy3.png">
                                    <input type="radio" name="image_radio" value="boy3.png">
                                </div>
                            </label>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button id="btnSelectUserImg" onclick="modalImgSubmit()" type="button" class="btn btn-primary">선택</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
	$('#idCheck').click(function(){
		if( $('#mem_id').val() == ""){
		alert("아이디를 입력해주세요.")
		}else if( ($('#mem_id').val() < "0" || $('#mem_id').val() > "9") && ($('#mem_id').val() < "A" || $('#mem_id').val() > "Z")
				&& ($('#mem_id').val() < "a" || $('#mem_id').val() > "z")){
			alert("한글 및 특수문자는 아이디로 사용할 수 없습니다.");
		}else{
		
		url="IdCheckProc.jsp?mem_id=" + $('#mem_id').val();
		window.name = "parentForm";
		window.open(url,"cildForm","width=300,height=150");
		}
	});
</script>
<script type="text/javascript" src="js/signup.js"></script>
</html>