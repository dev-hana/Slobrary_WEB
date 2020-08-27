<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="bookMgr" class="database.BookMgr" />
<%@ page import = "org.json.simple.JSONArray" %>
<%@ page import = "org.json.simple.JSONObject" %>

<%
Vector vResult = bookMgr.getBestList(0);
JSONObject head = new JSONObject();

for(int i = 0; i<vResult.size(); i++) {
	BestBean bestBean = (BestBean)vResult.get(i);
	BookBean bookBean = bookMgr.getBook(bestBean.getId_num());
	JSONObject data = new JSONObject(); 
	data.put("book_id", bestBean.getId_num());
	data.put("image", bookBean.getImage());
	
	head.put(i, data);
}

%>
<%=head %>