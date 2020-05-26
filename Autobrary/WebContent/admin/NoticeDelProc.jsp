<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.util.*, database.*" %>
<jsp:useBean id="ntMgr" class="database.NoticeMgr" />
<%
	String num = (String)session.getAttribute("num");
%>
<script>
 var confirm = confirm("정말 삭제하시겠습니까? \n 삭제한 후 복구가 불가능합니다.");
 if(confirm) {
	 <%
	    
	 	boolean flag = ntMgr.deleteNotice(num);
	 	if(flag){
	 		%>
	 		alert("성공적으로 삭제하였습니다.");
	 		location.href="Notice.jsp";
	 		<%
	 	}else{
	 		%>
	 		alert("삭제에 실패하였습니다. 다시 시도해 주세요.");
	 		history.back();<%
	 	}
	 %>
 }else {
	 history.back();
 }
 
 </script>