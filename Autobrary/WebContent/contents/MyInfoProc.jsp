<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="memMgr" class="database.MemMgr" />
<%
	request.setCharacterEncoding("utf-8");
	String mem_id = request.getParameter("mem_id");
	String address = request.getParameter("mem_address");
	String img = request.getParameter("mem_img");
	boolean flag = memMgr.memberUpdateMy(mem_id, address);
	
	System.out.println(img);
	
%>
<%=img %>