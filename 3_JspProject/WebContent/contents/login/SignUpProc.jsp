<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="suBean" class="beans.SignUpBean"/>
<jsp:setProperty name="suBean" property="*"/>
<jsp:useBean id="userBean" class="db.UserMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<%
		request.setCharacterEncoding("utf-8");
		String email="";
		String passwd="";
		String ok_passwd="";
		boolean pw_ok=false;
		boolean email_ok=false;
		if(request.getParameter("ok_passwd")!=null && suBean.getMem_email() != null && suBean.getMem_passwd()!=null){
			email = suBean.getMem_email();
			passwd = suBean.getMem_passwd();
			ok_passwd = request.getParameter("ok_passwd");
			if(userBean.checkEmail(email)==false && email.equals("")==false){
				email_ok=true;
			}else{
		%>
				<script type="text/javascript">
					alert("다른 이메일을 입력해주세요");
					location.href="Signup.jsp";
				</script>
		<%
			}if(passwd.equals(ok_passwd)==true){
				pw_ok=true;
			}else{
		%>		
				<script type="text/javascript">
					alert("비밀번호가 일치하지 않습니다.");
					location.href="Signup.jsp";
				</script>
		<%
			}
			if(email_ok == true && pw_ok==true){
				boolean flag = userBean.insertUser(suBean);
				if(flag==true){
					%>
					<jsp:forward page="SetProfileImg.jsp">
						<jsp:param value="<%= suBean.getMem_email() %>" name="email"/>
					</jsp:forward>
					<% 
				}else{
		%>			
				<script type="text/javascript">
					alert("회원가입 도중 문제가 발생하였습니다.");
				</script>
		<%
				}
			}
		}else{
			if(email.equals("")==true || passwd.equals("")==true){
				%>
				<script type="text/javascript">
					alert("모든 정보를 기재해주세요");
					location.href="Signup.jsp";
				</script>
			<%
			}
		}
		%>
		
</body>
</html>