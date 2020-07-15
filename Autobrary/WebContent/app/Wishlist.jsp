<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="bookMgr" class="database.BookMgr" />
<%@ page import = "org.json.simple.JSONArray" %>
<%@ page import = "org.json.simple.JSONObject" %>

<%
String mem_id = request.getParameter("mem_id");
Vector vResult = bookMgr.getWishList(mem_id);
JSONObject head = new JSONObject();

for(int i = 0; i<vResult.size(); i++) {
	WishBean wishBean = (WishBean)vResult.get(i);

	JSONObject data = new JSONObject(); 
	data.put("wish_id", wishBean.getWish_id());
	data.put("mem_id", wishBean.getMem_id());
	data.put("book_name", wishBean.getName());
	data.put("author", wishBean.getAuthor());
	data.put("publisher", wishBean.getPublisher());
	data.put("status", wishBean.getStatus());
	data.put("wish_date", wishBean.getWish_date());

	
	
	head.put(i, data);
	

}

%>
<%=head %>