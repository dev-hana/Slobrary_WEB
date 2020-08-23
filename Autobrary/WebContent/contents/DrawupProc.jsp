<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*, database.*" %>
<jsp:useBean id="reportMgr" class="database.ReportMgr" />
<%
//제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가                                                   
request.setCharacterEncoding("utf-8");

String id = "comghana";
String book_id = "EM212594";
String title = request.getParameter("title");
String content = request.getParameter("editordata");
String section = request.getParameter("section");
String scope = request.getParameter("scope");
if(section.equals("독후감")){
	boolean flag = reportMgr.insertReport(id, book_id, title, content, scope);
    if(flag){
    	%>
    			<script>
    			alert("성공적으로 등록하였습니다");
    			location.href="../index.jsp";
    			</script>
    	<%
    		}else{
    	%>
    			<script>
    			alert("등록도중 에러가 발생하였습니다.");
    			history.back();
    			</script>

    	<%}
}else{%>
				<script>
    			alert("아직 데이터를 저장할 수 없습니다.");
    			history.back();
    			</script>
<%} %>
