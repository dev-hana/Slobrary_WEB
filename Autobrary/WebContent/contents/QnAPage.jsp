<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
 	font-family: 'Noto Sans KR', sans-serif;
 }
 .stxt{
 	color:#585858;
 }
</style>
</head>
<body class="bg-light">
	<jsp:include page="../Top.jsp" flush="false"/>
	<div class="container-fluid mt-5">
		<div class="row justify-content-md-center" >
			<div class="col-xl-8 bg-white shadow-sm rounded p-5">
				<div class="pl-3">
					<div>
						<h3>자주 묻는 질문 FAQ</h3>
					</div>
					<div class="stxt">
						가장 자주 묻는 질문에 대한 내용을 쉽고 빠르게 확인하실 수 있습니다.
					</div>
				</div><hr>
				<div class="m-1 mt-3 mb-3">
					<jsp:include page="/contents/QnAMenu.jsp" flush="false"/>
				</div>
				<div>
					<jsp:include page="/contents/QnAList.jsp" flush="false"/>
				</div>
			</div>
		</div>
	</div>
</body>
</html>