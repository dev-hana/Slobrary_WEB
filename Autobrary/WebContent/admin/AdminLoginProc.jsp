<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="adset" class="database.AdminSet" /> <%-- 중요 --%>

<%-- 

	작성자: 장지은
	파일 이름: AdminLoginProc.jsp
	목적: 로그인을 처리하기 위한_jsp

 --%>
 
<%
	String admin_id = request.getParameter("admin_id");
	String admin_passwd = request.getParameter("admin_passwd");
	boolean adminCheck = adset.adminCheck(admin_id, admin_passwd); //중요
    if(adminCheck) {
	    session.setAttribute("adminKey", admin_id);
%>

   <script>
   location.href="Index.jsp";
   </script>

<%}else{%>

   <script>
   alert("입력한 정보가 정확하지 않습니다.");
   location.href="AdminLogin.jsp";
   </script>

<%}%>