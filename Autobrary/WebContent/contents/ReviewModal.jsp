<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/rating.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
</head>
<body>

<!-- Modal -->
<div class="modal fade" id="reviewModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalTitle">title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      <!-- 별점 -->
      <div class="row justify-content-md-center">
      	<div class="star" style="font-size: 2em;">
      	 <div id="halfstarsReview"></div> 
      	</div>
      </div>
      
      <hr>
      <!-- form -->
      <form>
      	<div class="form-group mt-4">
      		<input type="hidden" value="0" id="halfstarsInput" class="form-control form-control-sm">
      		<input type="hidden" id="l_id">
    		<textarea class="form-control" placeholder="이 책을 평가해주세요!" id="textarea" rows="4"></textarea>
  		</div>
      	
      </form>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">완료</button>
      </div>
    </div>
  </div>
</div>
<script>
  $("#halfstarsReview").rating({
      "click": function (e) {
      console.log(e);
      $("#halfstarsInput").val(e.stars);
      }
   });
  $('.modal').on('hidden.bs.modal', function (e) {
	  console.log('modal close');
	  $(this).find('form')[0].reset();
	  location.reload();
	});
</script>
</body>
</html>