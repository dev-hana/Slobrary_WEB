<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="revBean" class="db.ReviewMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
	    String flag=request.getParameter("flag");
		String no = request.getParameter("review_no");
		String email = (String)session.getAttribute("email");
		boolean isIn = revBean.isInHeartList(no, email);
		boolean result = false;	
		
		if(isIn==false){
			result=revBean.insertHeartReview(no, email);
			if(result){
				%>
				<script type="text/javascript">
				alert("좋아요 리뷰에 추가되었습니다.");
				history.go(-1);
				</script>
		<%
			}	
		}else{
			result=revBean.deleteHeartReview(no, email);
			if(result){
			%>
			<script type="text/javascript">
				alert("좋아요 리뷰에서 삭제되었습니다.");
			<%	
				if(flag==null){
					%>
					history.go(-1);
					<%
				}else{
					
				}
			%>	
			</script>
		<%
			}
		}
	%>
</body>
</html>