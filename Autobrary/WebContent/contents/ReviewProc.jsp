<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="reviewMgr" class="database.ReviewMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	String mem_id = (String)session.getAttribute("loginKey");
	String rating = request.getParameter("rating");
	String bookid = request.getParameter("bookid");
	String content = request.getParameter("review");
	RatingBean ratingBean = reviewMgr.getRating(bookid);
	if(content == null){
		%>
		<script>
		alert("리뷰를 입력해 주십시오.");
		history.back();
		</script>
  <%
	}
	boolean flag = reviewMgr.insertReview(mem_id, bookid, content, rating);
	if(flag){
		//총점
		double alls = Double.parseDouble(ratingBean.getAll_score());
		alls = alls + Double.parseDouble(rating);
		String alls_ = Double.toString(alls);
		//갯수
		int count = Integer.parseInt(ratingBean.getCount());
		count = count + 1;
		String count_ = Integer.toString(count);
		//평점
		double rate = alls / count;
		String rate_ = Double.toString(rate);
		
		boolean flag_ = reviewMgr.updateRating(bookid, alls_, count_, rate_);
		if(flag_){%>
			<script>
			alert("리뷰를 등록하였습니다.");
			history.back();
			</script>
				
		<%}else{%>
			<script>
			alert("다시 시도해주세요.");
			history.back();
			</script>
		<%}
	}else{%>
		<script>
		alert("이미 리뷰가 등록된 도서입니다.");
		history.back();
		</script>
	<%}%>
