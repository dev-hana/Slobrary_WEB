<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 물어보는 질문</title>
<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400&display=swap&subset=korean" rel="stylesheet">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<style type="text/css">
 .textQ{
 	font-family: 'Fredoka One', cursive;
 	font-size: 30px;
 	color:#A593E0;
 	
 }
 .textA{
 	font-family: 'Fredoka One', cursive;
 	font-size: 30px;
 	color:#84B1ED;
 	
 }	
 *{
 	font-family: 'Noto Sans KR', sans-serif;
 }
 .Q{
 	font-size: 22px;
 	margin-left:10px;
 }
 .A{
 	font-size: 18px;
 	margin-left:10px;
 	color:#585858;
 }
 .Qcontents{
 	background: 
 }
 .stxt{
 	color:#585858;
 }
 .nm {
  margin-top: -3rem !important;
}
</style>

</head>
<body>
	<div class="container">
	<div class="row">
		<div class="col-xl-12 p-4">
			<div>
				<h3>자주 묻는 질문 FAQ</h3>
			</div>
			<div class="stxt">
				가장 자주 묻는 질문에 대한 내용을 쉽고 빠르게 확인하실 수 있습니다.
			</div>
			<hr>
		</div>
	</div>
	<div class="row justify-content-md-center nm">
		<div class="col-xl-12 col-md-8 rounded p-5">
			<div id="accordion">
  				<div class="card">
    				<div class="card-header bg-light" id="heading1">
						<div class="Q collapsed" data-toggle="collapse" data-target="#collapse1" aria-expanded="false" aria-controls="collapse1" style="display: inline-block">
						<span class="textQ mr-3" style="display: inline-block">Q</span>도서관 이용시간과 휴관일은 어떻게 되나요?</div>
    				</div>
    			<div id="collapse1" class="collapse" aria-labelledby="heading1" data-parent="#accordion">
      				<div class="card-body">
      					<div>
							<div class="A" style="display: inline-block">
							<span class="textA mr-3">A</span>다음 표를 참고해주세요.</div>
							<div class="mt-4">
								<table class="table">
									<tr><th>구분</th><th>중앙도서관</th></tr>
									<tr><th>열람실</th><td>07:00~24:00<br>(휴관일은 월 09:00~18:00)</td></tr>
									<tr><th>문헌자료실</th><td>09:00~22:00<br>(토,일요일은 09:00~18:00)</td></tr>
									<tr><th>전자정보실</th><td>09:00~18:00</td></tr>
								</table>
							</div>
						</div>
        			</div>
    			</div>
  			</div>
  			<div class="card mt-1">
    				<div class="card-header bg-light" id="heading2">
						<div class="Q collapsed" data-toggle="collapse" data-target="#collapse2" aria-expanded="false" aria-controls="collapse2" style="display: inline-block">
						<span class="textQ mr-3" style="display: inline-block">Q</span>열람실은 어떻게 이용하나요?</div>
    				</div>
    			<div id="collapse2" class="collapse" aria-labelledby="heading2" data-parent="#accordion">
      				<div class="card-body">
      					<div>
							<div class="A" style="display: inline-block">
							<span class="textA mr-3">A</span>열람실은 별도의 절차 없이 이용가능합니다.</div>
						</div>
        			</div>
    			</div>
  			</div>
  			
  			<div class="card mt-1">
    				<div class="card-header bg-light" id="heading3">
						<div class="Q collapsed" data-toggle="collapse" data-target="#collapse3" aria-expanded="false" aria-controls="collapse3" style="display: inline-block">
						<span class="textQ mr-3" style="display: inline-block">Q</span>도서관 회원카드를 분실하였는데 어떻게 하나요?</div>
    				</div>
    			<div id="collapse3" class="collapse" aria-labelledby="heading3" data-parent="#accordion">
      				<div class="card-body">
      					<div>
							<div class="A">
							<span class="textA mr-3">A</span>
							소속도서관을 방문하여 재발급을 신청하면 됩니다. 분실 시 회원카드의 타인에 의한 무단사용을 방지하기 위해 도서관에 즉시 통지 부탁드립니다.</div>
						</div>
        			</div>
    			</div>
  			</div>
  			
  			<div class="card mt-1">
    				<div class="card-header bg-light" id="heading4">
						<div class="Q collapsed" data-toggle="collapse" data-target="#collapse4" aria-expanded="false" aria-controls="collapse4" style="display: inline-block">
						<span class="textQ mr-3" style="display: inline-block">Q</span>자료를 프린트 하거나 복사를 할 수 있나요?</div>
    				</div>
    			<div id="collapse4" class="collapse" aria-labelledby="heading3" data-parent="#accordion">
      				<div class="card-body">
      					<div>
							<div class="A">
							<span class="textA mr-3">A</span>
							비용을 지불하여 지정된 PC와 복사기를 이용해 프린트/출력/복사가 가능합니다.</div>
						</div>
        			</div>
    			</div>
  			</div>
 		</div>
 	</div>
 </div>
 
</div>
</body>
</html>