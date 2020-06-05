<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<%@ include file="/CND.jsp" %>
<jsp:useBean id="memMgr" class="database.MemMgr" />

     <%
     String contentPage=request.getParameter("CONTENTPAGE");
     if(contentPage==null){
    	 contentPage="MyPageList.jsp?type=loanbook";
     }
     
	String mem_id = (String)session.getAttribute("loginKey");
	if(mem_id==null) {
	%>
		   <script>
		   alert("로그인 후 사용 가능합니다.");
		   location.href="../Login.jsp";
		   </script>
	<%} else{
		MemBean memBean = memMgr.getMember(mem_id);
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<!-- css -->
<link href="/css/MyPage.css?v=2" rel="stylesheet" />
</head>
<body class="bg-light">
	<header>
	<jsp:include page="../Top.jsp" flush="false"/>
	</header>
	
	<div class="row mt-5 justify-content-md-center"">
		<!-- 마이페이지 개인정보 및 메뉴 -->
        <div class="col-xl-3 mr-2">
        <div class="bg-white shadow-sm rounded p-2">
        	<!-- 타이틀 및 수정버튼 -->
        	<div class="mt-3 pl-3 pr-3">
        		<div style="float:left;"><h5>내 정보</h5></div> <div style="float:right;">
        		<button onClick="location.href='MyInfo.jsp'" class="btn btn-outline-secondary btn-sm" type="sumbit">수정</button></div>
        	</div><br><hr>
        	
        	<!-- 회원 이미지 및 간략한 정보 -->
        	<div>
        		<div class="pt-2 pb-5" id="img-tab">
                     <div class="img-wrapper">
                          <img id="imgPreview" class="img-cover shadow-sm" src="/img/default/userImg/girl1.png" alt="프로필사진">
                     </div>
                     <input type="hidden" id="mem_img" name="mem_img" value="<%=memBean.getProfile()%>">
                </div>
                <div class="pl-3 pr-3">
                	<div><span><%=memBean.getMem_id() %></span></div>
					<div></div><span><%=memBean.getMem_mail() %></span></div>
             </div><hr>
             
             <!-- 메뉴 -->
             <div class="mb-3 pt-3 pb-1">
             	<jsp:include page="/contents/MyPageMenu.jsp" flush="false"/>
             </div>
             </div>
        </div>
        
        <!-- 서재 컨텐츠 -->
        <div class="col-md-7">
        	<div class="bg-white shadow-sm rounded p-2">
        		<jsp:include page="<%=contentPage %>" flush="false"/>
        	</div>
        </div>
    </div>
	
	<%
		if(contentPage.equals("MyPageList.jsp?type=loanbook")){
			String record = "MyPageList.jsp?type=allrecord";
	%>
		<div class="row mt-5 p-3 justify-content-md-center">
			<div class="col-xl-10 bg-white shadow-sm rounded p-4">
				<jsp:include page="<%=record %>" flush="false"/>
			</div>
		</div>
	<%
		}else{
			
			%>
			<div><br></div>
			<%
		}
	%>
	
</body>
</html>
<%}%>