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
			String form_type = request.getParameter("form_type");
			//사용자가 인증번호 발송을 누른경우 ( 비밀번호 암호화, 인증번호 생성 필요 )
			//사용자가 회원가입 도중 페이지를 종료하거나 했을 경우 세션 만료 시간 설정 필요
			if(form_type.equals("인증번호 발송")){
				String id = request.getParameter("mem_id");
				String password = request.getParameter("mem_pw");
				String name =request.getParameter("mem_name");
				String gender = request.getParameter("mem_gender");
				String birth = request.getParameter("mem_birth");
				String phone = request.getParameter("mem_phone");
				String address = request.getParameter("mem_adress");
				String email = request.getParameter("mem_mail");
				
				//사용자 정보 세션에 저장
				session.setAttribute("id", id);
				session.setAttribute("password", password);
				session.setAttribute("name", name);
				session.setAttribute("gender", gender);
				session.setAttribute("birth", birth);
				session.setAttribute("phone", phone);
				session.setAttribute("address", address);
				session.setAttribute("email", email);
				
				//인증번호 랜덤 생성을 가정하고 번호 세션에 저장
				session.setAttribute("cnum", "123");
				
				out.println("<script>alert('입력하신 메일로 인증번호가 발송되었습니다.');</script>");
				
			}//회원가입을 누른 경우
			else{
				
				//메일 인증 절차를 걷치지 않은 경우
				if(session.getAttribute("cnum")==null){
					out.println("<script>alert('회원가입 절차를 순서대로 진행해 주십시오.');</script>");
				}
				
				//메일 인증 절차 진행후 인증번호 확인 및 회원가입
				else{
					
					String num = request.getParameter("num");
					
					//사용자가 입력한 비밀번호가 세션에 저장된 인증번호화 일치할 경우
					if(num.equals(session.getAttribute("cnum"))){
						//DB에 세션에 저장된 사용자 정보 등록 필요
						
						//완료 후 세션 모두 삭제 및 완료 페이지로 이동
						String id = (String)session.getAttribute("id");
						session.invalidate();
						out.println("<script>window.top.location.href='SignupOk.jsp?id="+id+"';</script>");
					}
					//인증번호가 일치하지 않는 경우
					else{
						out.println("<script>alert('인증번호가 일치하지 않습니다.');</script>");
					}
				}
				
			}
		%>
</body>
</html>