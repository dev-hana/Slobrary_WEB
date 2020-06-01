
<%@page import="mail.Sender"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*" %>
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
			String form_type = request.getParameter("form_type");
			//사용자가 인증번호 발송을 누른경우 ( 비밀번호 암호화, 인증번호 생성 필요 )
			//사용자가 회원가입 도중 페이지를 종료하거나 했을 경우 세션 만료 시간 설정 필요
			if(form_type.equals("인증번호 발송")){
				String img = request.getParameter("mem_img");
				String mem_id = request.getParameter("mem_id");
				String password = request.getParameter("mem_pw");
				String name =request.getParameter("mem_name");
				String gender = request.getParameter("mem_gender");
				if(gender.equals("여")) gender="F";
				else gender = "M";
				String birth = request.getParameter("mem_birth");
				String phone = request.getParameter("mem_phone");
				String address = request.getParameter("mem_adress");
				String email = request.getParameter("mem_mail");
				System.out.println(img);
				if(new MemMgr().emailCheck(email)){
					out.println("<script>alert('이미 가입되어있는 이메일입니다.');</script>");
				}else{
				//사용자 정보 세션에 저장
				session.setAttribute("mem_id", mem_id);
				session.setAttribute("password", password);
				session.setAttribute("name", name);
				session.setAttribute("gender", gender);
				session.setAttribute("birth", birth);
				session.setAttribute("phone", phone);
				session.setAttribute("address", address);
				session.setAttribute("email", email);
				session.setAttribute("img", img);
				Random generator = new Random(); 
				String randChar = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
				String first = Character.toString(randChar.charAt(generator.nextInt(randChar.length())));
				int rand = generator.nextInt(999999); 
				String randResult = first + rand;
				session.setAttribute("cnum", randResult);
				String title = "SL:O 회원가입 이메일 인증번호 입니다.";
				String content = name + " 사용자님, <br>" +
						"귀하의 이메일 주소를 사용해 SL:O 회원가입 요청을 하였습니다. <br>"+
						name + "님의 인증번호는 다음과 같습니다. <br>"+
						"<h1>" + randResult + "</h1>" +
						"<br>회원가입을 요청하지 않았다면, 이 메일은 무시하셔도 됩니다.<br>" +
						"<b>누구에게도 이 인증번호를 알려주면 안됩니다.</b><br>" +
						"다른 궁금한 사항이 있을경우 하단의 메일로 연락 주세요.<br>" +
						"SL:O 팀";
				new Sender(title, content, email);
				out.println("<script>alert('입력하신 메일로 인증번호가 발송되었습니다.');</script>");
				}
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
						
						//세션 불러오기
						String mem_id = (String)session.getAttribute("mem_id");
						String passwd = (String)session.getAttribute("password");
						String name = (String)session.getAttribute("name");
						String gender = (String)session.getAttribute("gender");
						String birth = (String)session.getAttribute("birth");
						String phone = (String)session.getAttribute("phone");
						String address = (String)session.getAttribute("address");
						String email = (String)session.getAttribute("email");
						String img = (String)session.getAttribute("img");
								
						
						boolean flag = memMgr.insertMember(mem_id, passwd, name, gender, birth, phone, address, email, img);
						if(flag){
							session.invalidate();
							out.println("<script>window.top.location.href='SignupOk.jsp?id="+mem_id+"';</script>");
						}
						else{
							%>
							<script>
							alert("회원가입을 실패하였습니다. 다시 시도해 주세요");
							history.back();
							</script>
						<%	
						}
						
						
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