<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Autobrary Admin Main</title>
</head>
<body>
<%@ include file="Top.jsp" %>
    <table align="center" style="margin-top:200px;">
        	<tr>
        	<form name="" method="post" action="BookMgr.jsp">
          	  <td><button type="submit" style="border: none; background: white"><img src="../img/book.png"></button></td>
          	 </form>
			<form name="" method="post" action="MemMgr.jsp">
          	  <td><button type="submit" style="border: none; padding-left: 10px; background: white"><img src="../img/mem.png"></button></td>
          	</form>
       	 </tr>
        <tr align="center">
          <td style="font-weight:bold; font-size:20px;">도서 관리</td>
          <td style="font-weight:bold; font-size:20px;">회원 관리</td>
        </tr>
    </table>
    <%@ include file="Bottom.jsp" %>
</body>
</html>