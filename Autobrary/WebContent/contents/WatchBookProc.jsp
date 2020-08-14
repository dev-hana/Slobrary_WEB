<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "watchMgr" class = "database.WatchMgr" />
<%String mem_id = (String)session.getAttribute("loginKey"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String book_id = request.getParameter("book_id");
	String type = request.getParameter("type");
	
	boolean watchBook = false;
	//로그인이 되어있는 경우
	if(mem_id == null) {
		%>
		 <script type="text/javascript">
	  		alert("로그인이 필요한 작업입니다.");
	 	 	history.back(-1);
		 </script>	
		<%
	} else{
		
	//type이 register인 경우
		if(type.equals("register")){
		//등록되어 있지 않은 경우 관심도서 등록
		boolean insert = watchMgr.insertWatch(mem_id, book_id);
			if(insert){
				%>
				 <script type="text/javascript">
				  	alert("관심도서로 등록되었습니다!");
			 	 	history.back(-1);
				 </script>	
				<%
			//등록되어 있는 경우
			}else{
				%>
				 <script type="text/javascript">
				  	alert("이미 등록된 도서입니다.");
				  	history.back(-1);
				 </script>	
				<%
			}
		//관심도서 삭제(마이페이지에서만 가능)
		}else{
			%>
			 <script type="text/javascript">
		  		alert("관심도서에서 삭제되었습니다.");
		 	 	history.back(-1);
			 </script>	
			<%
		}
	}
%>
</body>
</html>