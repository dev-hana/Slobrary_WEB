<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/noticeModal.css" rel="stylesheet">
</head>
<body>
  <!-- Modal -->
  <div class="noticeModal modal fade" id="myModal" role="dialog">
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