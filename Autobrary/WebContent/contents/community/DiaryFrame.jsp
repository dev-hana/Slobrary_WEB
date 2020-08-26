<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<%@page import="bucketConnector.BucketManager"%>
<jsp:useBean id="bookMgr" class="database.BookMgr" />
<jsp:useBean id="diaryMgr" class="database.DiaryMgr" />
<jsp:useBean id="memMgr" class="database.MemMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Vector vDiary = diaryMgr.getDiaryList(null, "all");
	for(int i = 0; i < vDiary.size(); i++){
		DiaryBean diaryBean = (DiaryBean)vDiary.get(i);
		BookBean bookBean = bookMgr.getBook(diaryBean.getBook_id());
		MemBean memBean = memMgr.getMember(diaryBean.getMem_id());
	
	%>
	<article class="diary">
		<a href="/contents/BookDetailPage.jsp?bookid=<%=diaryBean.getBook_id()%>" class="imageBox"> <img class="thumbnail"
			src="<%=new BucketManager().base64DownLoader(bookBean.getImage())%>"
			alt="<%=bookBean.getId_num()%>" alt="<%=diaryBean.getBook_id()%>">
		</a>

		<button type="button" class="textBox">
			<h1 class="book-title"><%=bookBean.getName()%></h1>

			<span> <strong class="date"><%=diaryBean.getDiary_date().substring(0, 10)%></strong>
				&nbsp;|&nbsp; <strong class="read-page"><%=diaryBean.getPage()%></strong>쪽까지
				읽음
			</span> <q class="impressive-sentence" cite="책이름"> <%=diaryBean.getSentence()%>
			</q>

			<p class="experience">
				<%=diaryBean.getContent()%>
			</p>
			<br>
			<br> <a href="#" class="user"> <img
				src="<%=new BucketManager().base64DownLoader(memBean.getProfile())%>"
				alt="<%=bookBean.getId_num()%>" alt="" class="user-img"> <b><%=diaryBean.getMem_id()%></b>
			</a>
		</button>
	</article>
	<%
		}
	%>
</body>
</html>