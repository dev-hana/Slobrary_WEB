<%@ page contentType="text/html;charset=UTF-8" %>
<%-- 

	작성자: 장지은
	파일 이름: AdminLogin.jsp
	목적: 관리자 로그인을 위한_jsp

 --%>
<html>
  <head>
    <meta charset="utf-8">
    <title>Admin Login</title>
  </head>
  <body align="center" style="margin-top:180px;">
    <h1 style="color:#042759;">&nbsp 관리자 로그인</h1>
    <form method="post" action="AdminLoginProc.jsp">
    <table align="center">
        <tr>
            <th style="align-text=center;">ID</th>
            <td><input type="text" name="admin_id"
              style="width:200px;height:30px;">
            </td>
        </tr>
        <br>
        <br>
        <tr>
            <th>  PASSWORD  </th>
            <td><input type="password" name="admin_passwd"
              style="width:200px;height:30px;"></td>
        </tr>
       <tr> 
     	 <td colspan="2" align="center">
     	 <br><br>
     	 <input type="submit" value="login" 
     	 style="background-color:#042759;font-weight:inital;color:#FFFFFF;padding-top:6px;padding-bottom:6px;border: none;border-radius:5px; padding:15px;">
     	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      	<input type="reset" value="reset" style="background-color:#042759;font-weight:inital;color:#FFFFFF;padding-top:6px;padding-bottom:6px;border: none;border-radius:5px; padding:15px;">
      	</td>
      </tr>
    </table>
    </form>
  </body>
</html>  