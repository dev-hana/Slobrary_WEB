<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String confirm = request.getParameter("confirm");
	
	if(confirm.equals("등록허가")) {
		%>등록허가<%
	}else {
		%>등록불가<%
	}	
%>