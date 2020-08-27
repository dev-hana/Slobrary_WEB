<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="reportMgr" class="database.ReportMgr" />
<%
	String mem_id = (String)session.getAttribute("loginKey");
	String report_id = request.getParameter("report_id");
	ReportBean reportBean = reportMgr.getReport(report_id);
	if(reportBean.getLocked().equals("private")){
		if(mem_id.equals(reportBean.getMem_id())){
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
	
%>