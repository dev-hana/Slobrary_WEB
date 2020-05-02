<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- 자바 스크립트 -->
<script type="text/javascript" src="js/signup.js"></script>

<!-- css -->
<link href="/css/MyInfo.css" rel="stylesheet" />

<!-- 아이콘 -->
<link rel="shortcut icon" href="../img/favicon.ico">
 
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<title>마이페이지 수정</title>
</head>

<body class="bg-light">
	<jsp:include page="../Top.jsp" flush="false"/>
	<div class="back">
	<div class="container-fluid">
		<div class="row mt-5 justify-content-md-center">
			<div class="col-sm-4 shadow-sm p-3 mb-5 bg-white rounded">
			
			<form class="needs-validation" method="post" action="MyInfoProc.jsp" novalidate>
				<!-- 프로필 이미지 -->
					<div id="img-tab">
                        <div class="img-wrapper">
                            <img id="imgPreview" class="img-cover shadow-sm" src="/img/default/userImg/girl1.png" alt="프로필사진">
                        </div>
                        <button id="openImgUpload" data-toggle="modal" data-target="#modal-img" class="btn btn-light shadow-sm" type="button"><i class="fas fa-camera"></i>&nbsp;&nbsp;프로필 사진 선택</button>
                        <input type="hidden" name="mem_img" value="girl1.png">
                    </div>
					<hr>
				
				<!-- 정보  -->
				<div class="table1">
					<table class="table table-borderless">
						<tr>
							<th scope="row">이름</th>
							<td><input name="mem_name" class="form-control" type="text" value="양지" required></input></td>
						</tr>
						<tr>
							<th scope="row">이메일</th>
							<td><input name="mem_mail" class="form-control" type="email" value="yangz@naver.com" required></input></td>
						</tr>
						<tr>
							<th scope="row">전화번호</th>
							<td><input name="mem_phone" class="form-control" type="text" value="010-1234-5678" required></input></td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td><input name="mem_address" class="form-control" type="text" value="서울시 구로구" required></input></td>
						</tr>
						<tr>
							<th scope="row">가입일</th>
							<td>2020-04-22</td>
						</tr>
					</table>
				</div>
				<div class="btns">
					<button class="btn btn-outline-primary pl-4 pr-4" type="submit">확인</button>
					<button class="btn btn btn-outline-danger pl-4 pr-4">취소</button>
				</div>
				</form>
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
                                    <img class="img-cover shadow-sm" src="/img/default/userImg/girl1.png">
                                    <input type="radio" name="image_radio" value="girl1.png" checked>
                                </div>
                            </label>
                        </div>
                        <div class="col-sm">
                            <label class="image-radio">
                                <div class="img-wrapper">
                                    <img class="img-cover shadow-sm" src="/img/default/userImg/girl2.png">
                                    <input type="radio" name="image_radio" value="girl2.png">
                                </div>
                            </label>
                        </div>
                        <div class="col-sm">
                            <label class="image-radio">
                                <div class="img-wrapper">
                                    <img class="img-cover shadow-sm" src="/img/default/userImg/girl3.png">
                                    <input type="radio" name="image_radio" value="girl3.png">
                                </div>
                            </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm">
                            <label class="image-radio">
                                <div class="img-wrapper">
                                    <img class="img-cover shadow-sm" src="/img/default/userImg/boy1.png">
                                    <input type="radio" name="image_radio" value="boy1.png">
                                </div>
                            </label>
                        </div>
                        <div class="col-sm">
                            <label class="image-radio">
                                <div class="img-wrapper">
                                    <img class="img-cover shadow-sm" src="/img/default/userImg/boy2.png">
                                    <input type="radio" name="image_radio" value="boy2.png">
                                </div>
                            </label>
                        </div>
                        <div class="col-sm">
                            <label class="image-radio img-wrapper">
                                <div class="img-wrapper">
                                    <img class="img-cover shadow-sm" src="/img/default/userImg/boy3.png">
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
</html>