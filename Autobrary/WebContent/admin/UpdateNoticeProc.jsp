<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*" %>
<jsp:useBean id="ntMgr" class="database.NoticeMgr" />
<%    
    //제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가                                                   
    request.setCharacterEncoding("utf-8");

    String num = request.getParameter("id");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    
    boolean flag = ntMgr.updateNotice(num, title, content);
    if(flag){
    	%>
    			<script>
    			alert("성공적으로 수정하였습니다");
    			location.href="Notice.jsp";
    			</script>
    	<%
    		}else{
    	%>
    			<script>
    			alert("수정도중 에러가 발생하였습니다.");
    			history.back();
    			</script>

    	<%}%>


