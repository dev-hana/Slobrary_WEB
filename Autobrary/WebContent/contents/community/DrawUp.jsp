<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="bookMgr" class="database.BookMgr" />
<%
String mem_id = (String)session.getAttribute("loginKey");
if(mem_id == null) {
%>
 				<script>
    			alert("로그인이 필요한 작업입니다.");
    			location.href="/Login.jsp";
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
.selectbox{
	width: auto !important;
}
</style>
</head>
<body>
<jsp:include page="/Top.jsp" flush="false" />
	<%
		String type =request.getParameter("type");

		if(type.equals("report")){
		//독후감
	%>
	<div class="row justify-content-center pt-5 pb-5">
		<div class="col-xl-8 mt-4">
		<form method="post" action="DrawupProc.jsp">
			<!-- proc에서 type 확인 독후감(report)/자유게시판 나눔(free) -->
			<input type="hidden" name="type" value="report"/>
			<input type="hidden" name="mem_id" value="<%=mem_id %>"/>
			<div class="title mb-2">
				<div class="input-group">
				
				<!-- 읽은 도서 목록 -->
				<%
					String bookid = request.getParameter("book_id");
					if(bookid==null){
				%>
				
				<select class="form-control mr-3" name="book_id">
						<option value="0" selected disabled>독후감을 작성할 도서를 선택해주세요</option>
						<% 
						Vector vLoan = bookMgr.getLoan(mem_id, 0);
						for(int i=0;i<vLoan.size();i++) {
							LoanBean loanBean = (LoanBean)vLoan.get(i);
							BookBean bookBean = bookMgr.getBook(loanBean.getId_num());
						%>
					    <option value="<%=bookBean.getId_num()%>"><%=bookBean.getName() %></option>
					   <%} %>
					   <% 
						Vector vReturn = bookMgr.getReturn(mem_id, 0);
						for(int i=0;i<vLoan.size();i++) {
							LoanBean returnBean = (LoanBean)vReturn.get(i);
							BookBean bookBean = bookMgr.getBook(returnBean.getId_num());
						%>
					    <option value="<%=bookBean.getId_num()%>"><%=bookBean.getName() %></option>
					   <%} %>
				</select>
				<%}else{ 
					BookBean bookBean = bookMgr.getBook(bookid);
				%>
				<input type="hidden" name="book_id" value="<%=bookid %>"/>
				<input type="text" class="form-control mr-3 rounded" name="book_name" value="<%=bookBean.getName() %>" readonly>
				<%} %>
				<span class="input-group-text">제목</span>
				<input type="text" class="form-control input-title" name="title" required>
				</div>
			</div>
			<div>
				 <textarea id="summernote" name="editordata" required></textarea>
				 <div class="invalid-feedback">내용을 입력해주세요!</div>
			 </div>
			 <div class="option pl-2 pb-3 mt-2 mb-4">
			 	<div class="ml-2 mt-2">
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
	<%
		}else{
		//자유게시판
	%>
		<div class="row justify-content-center pt-5 pb-5">
		<div class="col-xl-8 mt-4">
		<form method="post" action="DrawupProc.jsp">
		
			<!-- proc에서 type 확인 독후감(report)/자유게시판 나눔(free) -->
			<input type="hidden" name="type" value="free"/>
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
			 <div class="option pl-2 pb-3 mt-2 mb-4">
			 	<div class="ml-2 mt-2">
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
		
	<% 	
		}
	%>



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