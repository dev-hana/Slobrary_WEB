<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="memMgr" class="database.MemMgr" />
<jsp:useBean id="memBean" class="database.MemBean" />
<jsp:setProperty name="memBean" property="*" />
<%
    boolean flag = memMgr.deleteMember(memBean);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
<%
if(flag){%>
	alert("성공적으로 탈퇴시켰습니다.");
	location.href="MemMgr.jsp";
	<%}else{%>
	alert("위시리스트가 있는 고객입니다.삭제가 불가능합니다.");
	location.href="MemMgr.jsp";
	<%}%>
</script>
</body>
</html>

