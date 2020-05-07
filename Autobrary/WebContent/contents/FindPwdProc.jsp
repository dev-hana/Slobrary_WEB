<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String pwd_type=request.getParameter("pwd_type");
		
		//인증번호 발송을 누른경우
		if(pwd_type.equals("인증번호")){
			String name = request.getParameter("mem_name");
			String birth = request.getParameter("mem_birth");
			String email = request.getParameter("mem_mail");
			
			//실제 회원정보가 있을 경우 인증번호 발송 및 세션에 인증번호 저장 부분 (기능 테스트용으로 간단히 만듬) 
			if(name.equals("양지현")==true){
				out.println("<script>alert('입력하신 메일로 인증번호가 발송되었습');history.back();</script>");
				session.setAttribute("c_number","123456");
			}//일치하는 회원정보가 없을경우
			else{
				out.println("<script>alert('일치하는 회원정보가 없습니다.');history.back();</script>");
			}
		}
		//인증번호 입력 다음 버튼을 누른경우
		else{
			if(session.getAttribute("c_number")==null){
				out.println("<script>alert('인증절차를 순서대로 진행해 주십시오.');history.back();</script>");
			}else{
				String number = request.getParameter("number");
				//인증번호가 일치할 경우 인증번호를 저장한 세션 삭제 후 비밀번호 변경 페이지로 이동
				if(number.equals((String)session.getAttribute("c_number"))){
					session.removeAttribute("c_number");
					response.sendRedirect("/contents/NewPwd.jsp");
				}else{
					out.println("<script>alert('인증번호가 일치하지 않습니다');history.back();</script>");
				}
			}
		}
	%>
</body>
</html>