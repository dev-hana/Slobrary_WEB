<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*, database.*" %>
<jsp:useBean id="reportMgr" class="database.ReportMgr" />
<jsp:useBean id="boardMgr" class="database.BoardMgr" />
<%
//제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가                                                   
request.setCharacterEncoding("utf-8");

String mem_id = (String)session.getAttribute("loginKey");
String book_id = request.getParameter("book_id");
String title = request.getParameter("title");
String content = request.getParameter("editordata");
String type = request.getParameter("type");
String scope = request.getParameter("scope");
if(type.equals("report")){
	if(book_id.equals("0")){
		%>
		<script>
		alert("도서를 선택하여 주십시오.");
		history.back();
		</script>
  <%}
	boolean flag = reportMgr.insertReport(mem_id, book_id, title, content, scope);
    if(flag){
    	%>
    			<script>
    			alert("성공적으로 등록하였습니다");
    			location.href="../../Index.jsp";
    			</script>
    	<%
    		}else{
    	%>
    			<script>
    			alert("등록도중 에러가 발생하였습니다.");
    			history.back();
    			</script>

    	<%}
}else{
	boolean flag = boardMgr.insertBoard(mem_id, title, content, scope);
	if(flag){
	%>
    			<script>
    			alert("성공적으로 등록하였습니다");
    			location.href="../../Index.jsp";
    			</script>
    	<%
    	}else{
    	%>
    			<script>
    			alert("등록도중 에러가 발생하였습니다.");
    			history.back();
    			</script>
<%
    	}
	}%>
