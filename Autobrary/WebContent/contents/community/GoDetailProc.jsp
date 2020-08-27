<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="reportMgr" class="database.ReportMgr" />
<jsp:useBean id="boardMgr" class="database.BoardMgr" />
<%
	String mem_id = (String)session.getAttribute("loginKey");
	String report_id = request.getParameter("report_id");
	String board_id = request.getParameter("board_id");
	
	//독후감
	if(report_id != null){
		ReportBean reportBean = reportMgr.getReport(report_id);
		if(reportBean.getLocked().equals("private")){
			if(mem_id == null){
				%>
				<script>
				alert("비공개 게시물입니다.");
				history.back();
				</script>
				<%
			}else if(mem_id.equals(reportBean.getMem_id())){
				%>
				<script>
				location.href="BookReportDetail.jsp?report_id=<%=report_id%>";
				</script>
				<%
			}else{
				%>
				<script>
				alert("비공개 게시물입니다.");
				history.back();
				</script>
				<%
			}
		}else{
			%>
			<script>
			location.href="BookReportDetail.jsp?report_id=<%=report_id%>";
			</script>
			<%
		}
	}else if(board_id != null){ //자유게시판
		BoardBean boardBean = boardMgr.getBoard(board_id);
		if(boardBean.getScope().equals("private")){
			if(mem_id==null){
				%>
				<script>
				alert("비공개 게시물입니다.");
				history.back();
				</script>
				<%
			}else if(mem_id.equals(boardBean.getMem_id())){
				%>
				<script>
				location.href="CommunityDetail.jsp?board_id=<%=board_id%>";
				</script>
				<%
			}else{
				%>
				<script>
				alert("비공개 게시물입니다.");
				history.back();
				</script>
				<%
			}
		}else{
			%>
			<script>
			location.href="CommunityDetail.jsp?board_id=<%=board_id%>";
			</script>
			<%
		}
	}
	
%>