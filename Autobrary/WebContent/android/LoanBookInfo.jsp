<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="bookMgr" class="database.BookMgr" />
<%@ page import = "org.json.simple.JSONArray" %>
<%@ page import = "org.json.simple.JSONObject" %>

<%
String mem_id = request.getParameter("mem_id");
Vector vResult = bookMgr.getLoan(mem_id);
JSONObject head = new JSONObject();

for(int i = 0; i<vResult.size(); i++) {
	LoanBean loanBean = (LoanBean)vResult.get(i);
	BookBean bookBean = bookMgr.getBook(loanBean.getId_num());
	JSONObject data = new JSONObject(); 
	data.put("id_num", loanBean.getId_num());
	data.put("loan_date", loanBean.getLoan_date());

	data.put("name", bookBean.getName());
	data.put("author", bookBean.getAuthor());
	data.put("publisher", bookBean.getPublisher());
	data.put("image", bookBean.getImage());
	
	
	
	head.put(i, data);
	

}

%>
<%=head %>