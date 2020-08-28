<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<%
String mem_id = (String)session.getAttribute("loginKey");
if(mem_id == null) {
%>
 				<script>
    			alert("로그인이 필요한 작업입니다.");
    			</script>
<%}%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" href="/css/summernote-lite.css">
<style>
.option{
	display:flex;
	border-bottom: 1px solid #bbb;
}
.note-modal-footer{
	height: 60px;
}
</style>
</head>
<body>
<jsp:include page="/Top.jsp" flush="false" />
	<div class="row justify-content-center pt-5 pb-5">
		<div class="col-xl-8 mt-4">
		
		<form method="post" action="DrawupProc.jsp">
			<input type="hidden" name="mem_id" value="<%=mem_id %>"/>
			<div class="title mb-2">
				<div class="input-group-prepend">
				<span class="input-group-text">제목</span>

				<input type="text" class="form-control" name="title" required>
				</div>
			</div>
			<div>
				 <textarea name="content" id="summernote" name="editordata" required></textarea>
				 <div class="invalid-feedback">내용을 입력해주세요!</div>
			 </div>
			 <div class="option pl-2 pb-3 mt-2 mb-4 bg-white">
			 	<div class="mt-2">
				  <span>머리말</span>
				  <select class="form-control" id="sel1" name="section">

				    <option>도서 추천</option>
				    <option>독후감</option>
				    <option>도서관 활동</option>
				  </select>
				</div>
			 	<div class="ml-5 mt-2">
			 		<span>범위</span><br>
			 		<label class="radio-inline mr-2 mt-2"><input type="radio" value="public" name="scope" checked="checked">&nbsp;공개</label>
					<label class="radio-inline mt-2"><input type="radio" value="private" name="scope" >&nbsp;비공개</label>
			 	</div>
			 </div>
			 <div class="float-right">
			 	<input type="submit" class="btn btn-secondary" value="등록하기"></input>
			 </div>
		</form>
		</div>	
	</div>



<script src="/js/formneeds.js"></script>
<!-- include summernote css/js -->
<script src="/js/summernote-lite.js"></script>
<script src="/js/summernote-ko-KR.js"></script>
<!-- summernote에디터 -->
<script type="text/javascript">
$(document).ready(function() {
	  $('#summernote').summernote({
		  height: 450,                 // 에디터 높이
			minHeight: 450,             // 최소 높이
			maxHeight: null,             // 최대 높이
			focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			lang: "ko-KR",					// 한글 설정
			placeholder: '욕설 및 타인을 비하할 시 게시글은 삭제됩니다.',
		  toolbar: [
			    // [groupName, [list of button]]
			    ['style', ['style']],
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['link','picture','video']],
			    ['view', ['fullscreen','codeview', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
				
	  });
	});
</script>
</body>
</html>