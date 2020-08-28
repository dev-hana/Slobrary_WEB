<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.modal-header {
    border-bottom: 0 none;
}
.modal-footer {
    border-top: 0 none;
}
.btn-outline-secondary{
	float:right;
	border-radius: 40px !important;
	border-color: var(--main-color-dark) !important;
	color : var(--main-color-dark);
}
.btn-outline-secondary:hover{
	background-color: var(--main-color-dark) !important;
	color : white !important;
}
.btn-outline-secondary:active{
	background-color: var(--main-color-dark) !important;
	color : white !important;
}
.btn-outline-secondary:focus {
  box-shadow: none !important;
  outline: none !important; 
}
.close:focus {
  box-shadow: none !important;
  outline: none !important; 
}
.modal-body img{
	width: 350px;
}
.text-box p{
	text-align: center;
	font-size: 20px;
	color:var(--main-color-dark);
	font-weight: bold;
}
.text-box{
	justify-content: center;
	align-item: center;
}


</style>
</head>
<body>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content rounded-0">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       
        <div class="text-box">
	        <div class="pl-5 mb-1">
	        	<img alt="이미지가 없습니다." src="/img/review.jpg">
	        </div>
        		<p>
	        	도서를 대출한지 3일이 지났어요<br>
	        	SLO에서 읽은 도서의 리뷰와 독후감을<br>
	        	작성해 공유해보세요!
	        	</p>
        </div>
          <!-- <a href='https://www.freepik.com/vectors/people'>People vector created by pch.vector - www.freepik.com</a> -->
        </div>
        <div class="modal-footer justify-content-center">
          <button type="button" class="btn btn-outline-secondary rounded" onclick="location.href='/contents/MyPage.jsp'" data-dismiss="modal">독후감 남기러 가기</button>
        </div>
      </div>
      
    </div>
  </div>
</body>
</html>