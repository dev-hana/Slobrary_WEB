<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*, database.*" %>
<jsp:useBean id="ntMgr" class="database.NoticeMgr" />
<%

String id = (String)session.getAttribute("adminKey");
String num = request.getParameter("mem_id");
String chkid = ntMgr.searchId(num);
if(!id.equals(chkid)){
	%>
	<script>
	alert("본인이 작성한 공지사항만 삭제할 수 있습니다.");
	history.back();
	</script>
<%} else{
	session.setAttribute("num", num);
	response.sendRedirect("NoticeDelProc.jsp");
}%>