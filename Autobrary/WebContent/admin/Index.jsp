<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Autobrary Admin Main</title>
 <link rel="shortcut icon" href="/img/favicon.ico">
</head>
<body>
<%@ include file="Top.jsp" %>
    <table align="center" style="margin-top:200px;">
        	<tr>
        	<form name="" method="post" action="BookMgr.jsp">
          	  <td><button type="submit" style="border: none; background: white; padding-right:50px;"><img src="../img/book1.png"></button></td>
          	 </form>
			<form name="" method="post" action="MemMgr.jsp">
          	  <td><button type="submit" style="border: none; padding-right:50px; background: white"><img src="../img/mem1.png"></button></td>
          	</form>
          	<form name="" method="post" action="SetMgr.jsp">
          	  <td><button type="submit" style="border: none; padding-left: 50px; background: white;"><img src="../img/setting.png"></button></td>
          	</form>
       	 </tr>
        <tr align="center">
          <td style="font-weight:bold; font-size:20px; padding-right:50px;">도서 관리</td>
          <td style="font-weight:bold; font-size:20px; padding-right:50px;">회원 관리</td>
          <td style="font-weight:bold; font-size:20px; padding-left: 50px;">설정</td>
        </tr>
    </table>
    <%@ include file="Bottom.jsp" %>
</body>
</html>