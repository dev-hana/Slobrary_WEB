<%@page import="mail.Sender"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="memMgr" class="database.MemMgr" />
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
		String mem_id = request.getParameter("mem_id");
		
		//인증번호 발송을 누른경우
		if(pwd_type.equals("인증번호")){
			String name = request.getParameter("name");
			String birth = request.getParameter("birth");
			String email = request.getParameter("email");
			mem_id = request.getParameter("mem_id");

			String check = memMgr.checkIdpw(mem_id, name, birth, email);
			
			//회원정보가 없을 경우
			if(check == null){
				out.println("<script>alert('일치하는 회원정보가 없습니다.');history.back();</script>");
			} else{
				Random generator = new Random(); 
				String randChar = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
				String first = Character.toString(randChar.charAt(generator.nextInt(randChar.length())));
				int rand = generator.nextInt(999999); 
				String randResult = first + rand;
				session.setAttribute("c_number", randResult);
				String title = "SL:O 비밀번호 찾기 인증번호 입니다.";
				String content = name + "사용자님, <br>" +
						"귀하의 이메일 주소를 통해 SL:O 계정에 대한 비밀번호 찾기를 요청을 하였습니다. <br>"+
						name + "님의 인증번호는 다음과 같습니다. <br>"+
						"<h1>" + randResult + "</h1>" +
						"<br>비밀번호 찾기를 요청하지 않았다면, 타인이 비밀번호찾기를 시도하려는 것일 수 있습니다.<br>" +
						"<b>누구에게도 이 인증번호를 알려주면 안됩니다.</b><br>" +
						"부적절한 타인의 시도였다고 생각하면 하단의 메일로 연락을 취해주세요.<br>" +
						"SL:O 팀";
				new Sender(title, content, email);
				out.println("<script>alert('입력하신 메일로 인증번호가 발송되었습니다.');</script>");
				response.sendRedirect("Sendmailmessage.jsp?mem_id=" + request.getParameter("mem_id"));
			}
		}
		
		
		//인증번호 입력 다음 버튼을 누른경우
		else{
			
			mem_id = request.getParameter("mem_id");
			
			if(session.getAttribute("c_number")==null){
				out.println("<script>alert('인증절차를 순서대로 진행해 주십시오.');history.back();</script>");
			}else{
				String number = request.getParameter("number");
				String sessionNumber = session.getAttribute("c_number").toString();
				//인증번호가 일치할 경우 인증번호를 저장한 세션 삭제 후 비밀번호 변경 페이지로 이동
				
				if(number.equals(sessionNumber)){
					session.removeAttribute("c_number");
					response.sendRedirect("NewPwd.jsp?mem_id=" +request.getParameter("mem_id"));
				}else{
					out.println("<script>alert('인증번호가 일치하지 않습니다');history.back();</script>");
				}
			}
		};
	%>
</body>
</html>