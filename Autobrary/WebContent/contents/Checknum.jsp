<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="memMgr" class="database.MemMgr" />
<%
	String mem_id = request.getParameter("mem_id");
	MemBean memBean = memMgr.getMember(mem_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<style>
* {
    font-family: 'Noto Sans KR', sans-serif;
}
label {
	font-size:15px;
    margin-top: 10px;
}
.einfo{
	font-size:14px;
	color:#BDBDBD;
	text-align:right;
}

.btn-secondary.custom-btn {
	background-color: #E6E6E6;
	border-color: #E6E6E6;
	color: #000;
}

</style>
<jsp:include page="../Top.jsp" flush="false"/>
<title>비밀번호 찾기</title>
</head>
<body class="bg-light">
	<div class="container-fluid mt-4">
		<div class="row justify-content-md-center">
			<div class="col-lg-4 shadow-sm p-3 mb-5 bg-white p-5">
				<div class="title">
					<h4>비밀번호 찾기</h4><hr>
				</div>
					<div>
					<div class="form-group">
					<form action="FindPwProcProc.jsp" method="post" class="needs-validation" novalidate>
					
						<label for="id">아이디</label>
                        <div class="input-group mb-2">
                           <a style="color:gray;"><%=memBean.getMem_id() %> </a>                     
                        </div>
						<label for="name">이름</label>
                        <div class="input-group mb-2">
                           <a style="color:gray;"><%=memBean.getMem_name() %> </a>           
                        </div>
                        
							<label for="birth">생년월일</label>
							<div class="input-group mb-2">
                        	 <a style="color:gray;"><%=memBean.getMem_birth() %> </a>        
                        	</div>
						<label for="email">이메일</label>
                        <div class="input-group">
                             <a style="color:gray;"><%=memBean.getMem_mail() %> </a>        
                        </div>						
						<label for="number">인증번호</label>
						</form>
						<form action="FindPwdProc.jsp" method="post" class="needs-validation" novalidate>
                        <div class="input-group">
                        <input type="text" class="form-control" placeholder="인증번호를 입력해주세요" name="number" required>
                        </div>
                        <div style="text-align:right;" class="mt-3">
                        <input type="hidden" name="pwd_type" value="비밀번호찾기">
                        <input type="hidden" name="mem_id" value=<%=memBean.getMem_id() %>>
                        <button id="submit-btn" class="btn btn-secondary custom-btn btn-block pt-2 pb-2" type="submit">다음</button>
                        </div>
                        </form>
						</div>
				</div>
			
			</div>
		</div>
	</div>
</body>
</html>