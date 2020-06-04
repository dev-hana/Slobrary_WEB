<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="bookMgr" class="database.BookMgr" />
   <%@ include file="Top.jsp" %> 
    <%
    	String id_num = request.getParameter("id_num");
  	  boolean flag_ = bookMgr.countBest(id_num);
  	  if(flag_) {
  		  BestBean bestBean = bookMgr.getBest(id_num);
  		  boolean flag = bookMgr.deleteBest(bestBean.getBest_id());
  			if(flag) {
    			%>
    				<script>
    				alert("취소하였습니다");
    				location.href="BookBest.jsp";
    				</script>
    		<% }else{ %>
    				<script>
    				alert("오류가 발생했습니다. 다시 시도해주세요.");
    				location.href="BookMgr.jsp";
    				</script>
    		<%}
  	  }else{
    	boolean flag = bookMgr.insertBest(id_num, admin_id);
    	if(flag) {
    		%>
    				<script>
    				alert("등록하였습니다");
    				location.href="BookBest.jsp";
    				</script>
    		<% }else{ %>
    				<script>
    				alert("이미 등록된 도서입니다.");
    				location.href="BookMgr.jsp";
    				</script>
    		<%	}
    		}%>
