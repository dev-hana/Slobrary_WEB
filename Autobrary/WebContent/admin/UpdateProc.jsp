<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="memMgr" class="database.MemMgr" />
<jsp:useBean id="memBean" class="database.MemBean" />
<jsp:setProperty name="memBean" property="*" />
<%
    boolean flag = memMgr.memberUpdate(memBean);
%>

<%
if(flag){
%>
		<script>
		alert("성공적으로 수정하였습니다");
		location.href="Memdetail.jsp";
		</script>
<%
	}else{
%>
		<script>
		alert("수정도중 에러가 발생하였습니다.");
		history.back();
		</script>

<%
	  }
%>