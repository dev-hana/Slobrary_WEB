<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String id = request.getParameter("id_num");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table.type03 {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
  margin : 20px 10px;
}
table.type03 th {
    width: 147px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;

}
table.type03 td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
.btn {background-color:#042759;font-weight:bold;color:#FFFFFF;border: none;border-radius:5px;}
</style>
</head>
<body>
<%@ include file="Top.jsp" %><br><br>
<%@ include file="Setside.jsp" %>
<%@ include file="AdminTop.jsp" %>
<br><br>
<%
	String id_ = (String)session.getAttribute("admin_id");
	boolean flag = adSet.masterCheck(id_);
	if(!flag){
		%>
		<script>
		alert("권한이 부족하여 접근할 수 없습니다.");
		history.back();
		</script>
<%}
	ArequestBean aqBean = adSet.getArequest(id);
	%>
	
	<table class="type03" style="margin-left:auto; margin-right:auto;">
    <tr>
        <th scope="row">아이디</th>
        <td><%=aqBean.getId() %></td>
    </tr>
     <tr>
        <th scope="row">이름</th>
        <td><%=aqBean.getName()%></td>
    </tr>
     <tr>
        <th scope="row">핸드폰번호</th>
        <td><%=aqBean.getPhone() %></td>
    </tr>
     <tr>
        <th scope="row">등록날자</th>
        <td><%=aqBean.getDate()%></td>
    </tr>
</table>
<div style="text-align:center;">


</div>

<form method="post" action="ArequestConfirm.jsp">
	<input type="hidden" name="id" value="<%=aqBean.getId() %>">
	<div style="text-align:center;">
	<input class="btn" type="submit" name="confirm" value="등록허가">
	<input class="btn" type="submit" name="confirm" value="등록불가">
	</div>
</form>
<%@ include file="Bottom.jsp" %>
</body>
</html>