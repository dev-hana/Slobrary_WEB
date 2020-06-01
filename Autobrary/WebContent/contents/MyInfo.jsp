<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*, database.*"%>
<jsp:useBean id="memMgr" class="database.MemMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- 자바 스크립트 -->
<script type="text/javascript" src="/js/formneeds.js"></script>

<!-- css -->
<link href="/css/MyInfo.css" rel="stylesheet" />

<!-- 아이콘 -->
<link rel="shortcut icon" href="../img/favicon.ico">
 
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<title>마이페이지 수정</title>

</head>

<body class="bg-light">
	<jsp:include page="../Top.jsp" flush="false"/>
	<%
		String mem_id = (String)session.getAttribute("loginKey");
		MemBean memBean = memMgr.getMember(mem_id);
	%>
	<div class="back">
	<div class="container-fluid">
		<div class="row mt-5 justify-content-md-center">
			<div class="col-xl-4 shadow-sm p-3 mb-5 bg-white rounded">
			
			<form class="needs-validation" method="post" action="MyInfoProc.jsp" novalidate>
				<!-- 프로필 이미지 -->
					<div id="img-tab">
                        <div class="img-wrapper">
                            <img id="imgPreview" class="img-cover shadow-sm" src="/img/default/userImg/girl1.png" alt="프로필사진">
                        </div>
                        <button id="openImgUpload" data-toggle="modal" data-target="#modal-img" class="btn btn-light shadow-sm" type="button"><i class="fas fa-camera"></i>&nbsp;&nbsp;프로필 사진 선택</button>
                        <input type="hidden" name="mem_img" value="girl1.png">
                    </div>
					<hr>
				
				<!-- 정보  -->
				<div class="table1">
					<table class="table table-borderless">
						<tr>
							<th scope="row">이름</th>
							<td><%=memBean.getMem_name() %></td>
						</tr>
						<tr>
							<th scope="row">이메일</th>
							<td><%=memBean.getMem_mail() %></td>
						</tr>
						<tr>
							<th scope="row">전화번호</th>
							<td><%=memBean.getMem_phone() %></td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td><input name="mem_address" class="form-control" type="text" value="<%=memBean.getMem_address() %>" required></input></td>
						</tr>
						<tr>
							<th scope="row">가입일</th>
							<td><%=memBean.getMem_date() %></td>
						</tr>
					</table>
				</div>
				<div class="btns">
					<button class="btn btn-outline-primary pl-4 pr-4" type="submit">확인</button>
					<button onclick="location.href='MyPage.jsp'" type="button" class="btn btn btn-outline-danger pl-4 pr-4">취소</button>
				</div>
				<input type="hidden" name="mem_id" value="<%=memBean.getMem_id() %>" >
				</form>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="/contents/modal/SelectUserImg.jsp" flush="false"/>
</body>
</html>