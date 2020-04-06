<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="reviewMgr" class="db.ReviewMgr" />
<%
	String flag = request.getParameter("flag");
	boolean result = false;
	
	if(flag.equals("insert")){
    	result=reviewMgr.insertReview(request);
	}else{
		response.sendRedirect("ReviewWrite.jsp");
	}
	
	if(result){
%>
	  <script>
	    alert("처리하였습니다");
		location.href="ReviewWrite.jsp";
	  </script>
<%	}else{%>
	  <script>
	    alert("오류가 발생하였습니다.");
		location.href="ReviewWrite.jsp";
	  </script>
<%	}%>