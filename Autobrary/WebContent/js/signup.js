// 유효성 검사 통과하지 않으면 다음 페이지로 넘어가지 않도록 하는 코드
(function () {
    'use strict';
    window.addEventListener('load', function () {
        // Get the forms we want to add validation styles to
        var forms = document.getElementsByClassName('needs-validation');
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                // pwd와 pwdCheck의 값이 같은지 체크
                if (document.getElementById("pwd").value != document.getElementById("pwdCheck").value) {
                    alert("Password mismatch");
                    $("#pwdCheck").addClass('was-validated');
                    event.preventDefault();
                    event.stopPropagation();
                } else if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    }, false);
}());

// 사진 첨부 시 사진 미리보기
function readInputFile(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#imgPreview').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$('#imgInput').change(function () {
    readInputFile(this);
});

// 패스워드 show/hide 버튼
var pwd = document.getElementById('pwd');
var pwdCheck = document.getElementById('pwdCheck');

var pwdIcon = document.getElementById('eyeIcon_pwd');
var pwdCheckIcon = document.getElementById('eyeIcon_pwdCheck');

var btnPwd = document.getElementById('btnToggle_pwd');
var btnPwdCheck = document.getElementById('btnToggle_pwdCheck');

function togglePwd() {
    if (pwd.type === 'password') {
        pwd.type = 'text';
        pwdIcon.classList.add('fa-eye-slash');
    } else {
        pwd.type = 'password';
        pwdIcon.classList.remove('fa-eye-slash');
    }
}

function togglePwdCheck() {
    if (pwdCheck.type === 'password') {
        pwdCheck.type = 'text';
        pwdCheckIcon.classList.add('fa-eye-slash');
    } else {
        pwdCheck.type = 'password';
        pwdCheckIcon.classList.remove('fa-eye-slash');
    }
}

btnPwd.addEventListener('click', togglePwd, false);
btnPwdCheck.addEventListener('click', togglePwdCheck, false);

// 프로필 이미지 라디오 선택
$(document).ready(function () {
    // add/remove checked class
    $(".image-radio").each(function () {
        if ($(this).find('input[type="radio"]').first().attr("checked")) {
            $(this).addClass('image-radio-checked');
        } else {
            $(this).removeClass('image-radio-checked');
        }
    });

    // sync the input state
    $(".image-radio").on("click", function (e) {
        $(".image-radio").removeClass('image-radio-checked');
        $(this).addClass('image-radio-checked');
        var $radio = $(this).find('input[type="radio"]');
        $radio.prop("checked", !$radio.prop("checked"));

        e.preventDefault();
    });
});

//프로필 이미지 선택 모달 버튼 클릭시 적용
function modalImgSubmit() {
    var selectImg = $('input[name="image_radio"]:checked').val();
    var imgPreview = document.getElementById('imgPreview');
    var imgUrl_ = 'img/default/userImg/';

    imgUrl_ = imgUrl_ + selectImg;
    imgPreview.src = imgUrl_;
    $('#modal-img').modal('hide');
    $('.modal-backdrop').remove();
}

//이용 약관 모달 동의 버튼 클릭시 적용
function modalAgreeTOS() {
    var checkTOS = document.getElementById('tosCheck');
    checkTOS.setAttribute('checked', 'true');
    $('#modal-TOS').modal('hide');
    $('.modal-backdrop').remove();
}