$(document).ready(function () {
	$("#alert-success").hide(); 
	$("#alert-danger").hide();
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
    
    document.getElementById('mem_img').value=selectImg;
    $('#modal-img').modal('hide');
    $('.modal-backdrop').remove();
}