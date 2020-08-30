<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/sideMenuBar.css">
</head>
<%
	String category = request.getParameter("category");
	String pageNames = request.getParameter("pageNames");
	String pageUrls = request.getParameter("pageUrls");
	String currentPage = request.getParameter("currentPage");
	
	String pageName[] = pageNames.split(", ");
	String pageUrl[] = pageUrls.split(", ");
	HashMap<String, String> pages = new HashMap<String, String>();
	for(int i=0; i<pageName.length; i++) {
		pages.put(pageName[i], pageUrl[i]);
	}
	
%>
<body>
	<nav id="sidebar" class="p-4 pt-5 mr-4">
		<div class="sidebar-header mb-5" id="titleh1">
			<h1 id="titleh2"><%=category%></h1>
		</div>
		<ul class="sidebar-menu list-unstyled components mb-5" id="ulid">
			<%
					for (String name : pages.keySet()) {
						if
						(name.equals(currentPage)) {
							out.println("<li class='active'><a href='" + pages.get(name) + "'>"+ name + "</a></li>");
						}else {
							out.println("<li><a href='" + pages.get(name) + "'>"+ name + "</a></li>");
						}
					}
				%>
		</ul>
	</nav>
</body>
</html>