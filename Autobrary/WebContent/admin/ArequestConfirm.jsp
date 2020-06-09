

<ArequestConfirm.jsp>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="adMgr" class="database.AdminSet" />
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String confirm = request.getParameter("confirm");
	
	if(confirm.equals("등록허가")) {
		%>등록허가<%
		ArequestBean reqBean = adMgr.getArequest(id);
		boolean flag = adMgr.confirmAdmin(reqBean);
		if(flag){
			boolean flag_ = adMgr.deleteArequest(id);
			if(flag_){
				%>
				<script>
				alert("성공적으로 추가하였습니다");
				location.href="AdminMaster.jsp";
				</script>
				<%
			}else{
				%>
				<script>
				alert("에러가 발생하였습니다.");
				history.back();
				</script>

		<%
			}
	}else{
%>
		<script>
		alert("추가하였습니다. 신청목록에 에러가 발생하였습니다.");
		history.back();
		</script>

<%
	  }
	}else {
		%>등록불가<%
		boolean flag_ = adMgr.deleteArequest(id);
		if(flag_){
			%>
			<script>
			alert("신청을 거부하였습니다.");
			location.href="AdminMaster.jsp";
			</script>
			<%
		}else{
			%>
			<script>
			alert("에러가 발생하였습니다.");
			history.back();
			</script>

	<%
		}
	}	
%> 





