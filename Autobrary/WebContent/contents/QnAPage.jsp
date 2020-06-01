<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row justify-content-md-center mt-4">
			<div class="col-xs-12 col-md-8">
			</div>
		</div>
		<div class="row justify-content-md-center" >
			<div class="col-xs-12 col-md-8">
			<jsp:include page="/contents/QnAList.jsp" flush="false"/>
			</div>
		</div>
	</div>
</body>
</html>