<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="bookMgr" class="database.BookMgr" />
	<%
		request.setCharacterEncoding("UTF-8");
		String mem_id = request.getParameter("mem_id");
		String name = request.getParameter("name");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		
		boolean flag = bookMgr.insertWish(mem_id, name, author, publisher);
		if(flag) {
			 %><script>
			alert("성공적으로 신청하였습니다.");
			location.href="../contents/WishList.jsp";
			 </script><%

		}else{
		%><script>
			alert("신청 실패, 다시 시도해주세요");
			location.href="../contents/WishBook.jsp";
			 </script><%
		}
	%>

