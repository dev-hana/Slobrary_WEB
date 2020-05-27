<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="adSet" class="database.AdminSet" />

  <%
    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("AdminLogin.jsp");
	} else {
		
		session.setAttribute("admin_id", admin_id);
		AdminBean adBean = adSet.getName(admin_id);
	
%>
 <br><br>
     <link rel="shortcut icon" href="/img/favicon.ico">
  <div style="color:#042759;text-align:right;margin-right:500px;">
    &nbsp&nbsp
    <span style="font-weight:bold;font-size:20px;color:#000000"><a style="color:#042759;"><%=adBean.getName() %></a>관리자님, 어서오세요</span> &nbsp&nbsp
    <button type="button" style="background-color:#042759;font-weight:bold;color:#FFFFFF;
    padding-top:6px;
    padding-bottom:6px;
    border: none;
    border-radius:5px;"
    onclick="location.href='AdminLogout.jsp' ">LOGOUT</button>

  </div>
  <%}%>