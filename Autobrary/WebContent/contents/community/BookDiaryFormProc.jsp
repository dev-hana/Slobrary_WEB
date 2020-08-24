<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="diaryMgr" class="database.DiaryMgr" />
<%
request.setCharacterEncoding("utf-8");
String mem_id = request.getParameter("mem_id");
String book_id = request.getParameter("id_num");
String book_page = request.getParameter("page");
String sentence = request.getParameter("sentence");
String content = request.getParameter("content");
boolean flag = diaryMgr.insertDiary(mem_id, book_id, book_page, content, sentence);

if(flag){
%>
		<script>
		alert("성공적으로 등록하였습니다");
		location.href="BookDiaryPage.jsp";
		</script>
<%
	}else{
%>
		<script>
		alert("에러가 발생하였습니다.");
		history.back();
		</script>

<%
	  }
%>