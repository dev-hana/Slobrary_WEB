<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
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
<link href="/css/MyInfo.css?v=2" rel="stylesheet" />

<title>개인정보 수정</title>
<!-- 아이콘 -->
<link rel="shortcut icon" href="../img/favicon.ico">
 
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<title>마이페이지 수정</title>
<script type="text/javascript">
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/popup/AddressPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
		document.info.mem_address.value = roadFullAddr;		
}
</script>
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
			
			<form class="needs-validation" name="info" method="post" action="MyInfoProc.jsp" novalidate>
				<!-- 프로필 이미지 -->
					<div id="img-tab">
                        <div class="img-wrapper">
                            <img id="imgPreview" class="img-cover shadow-sm" src="/img/default/userImg/<%=memBean.getProfile() %>" alt="프로필사진">
                        </div>
                        <button id="openImgUpload" data-toggle="modal" data-target="#modal-img" class="btn btn-light shadow-sm" type="button"><i class="fas fa-camera"></i>&nbsp;&nbsp;프로필 사진 선택</button>
                        <input type="hidden" id="mem_img" name="mem_img" value="<%=memBean.getProfile()%>">
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
							<td>
								<div class="input-group">
								<input name="mem_address" id="mem_address" class="form-control" type="text" value="<%=memBean.getMem_address() %>" required="true" readonly="true" />
								<button type="button" id="address" class="btn btn-light" onclick="goPopup()">주소검색</button>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">가입일</th>
							<td><%=memBean.getMem_date() %></td>
						</tr>
					</table>
				<div class="btns">
					<button class="btn btn-outline-primary pl-4 pr-4" type="submit">확인</button>
					<button onclick="location.href='MyPage.jsp'" type="button" class="btn btn btn-outline-danger pl-4 pr-4">취소</button>
				</div>
				<input type="hidden" name="mem_id" value="<%=memBean.getMem_id() %>" >
				</form>
				<div style="float:right;"><button onclick="location.href='Withdraw.jsp'" type="button" class="btn btn-sm">회원탈퇴</button></div>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="/contents/modal/SelectUserImg.jsp" flush="false"/>
</body>
</html>