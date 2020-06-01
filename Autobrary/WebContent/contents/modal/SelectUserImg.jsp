<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/modal/SelectUserImg.css" rel="stylesheet" />

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
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
    <script type="text/javascript" src="/contents/modal/SelectUserImg.js"></script>
</body>
</html>