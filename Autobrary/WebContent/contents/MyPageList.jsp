<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bucketConnector.BucketManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, database.*"%>
    <jsp:useBean id="bookMgr" class="database.BookMgr" />
    <%@ page import="java.text.*" %>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link href="/css/MyPageList.css?v=2" rel="stylesheet" />
</head>
<body>

	<%
		String mem_id = (String)session.getAttribute("loginKey");
		String type = request.getParameter("type");
	 	//type="interest";
		if(type.equals("loanbook")){
	%>
	<!-- 현재 대출중인 도서 -->
	<div class="pl-3 pb-2 pt-3">
		<h4>대출 도서</h4>
	</div>
	<table class="table">
		<%
		
			Vector vLoan = bookMgr.getLoan(mem_id);
			for(int i=0; i<vLoan.size();i++){
				LoanBean loanBean = (LoanBean)vLoan.get(i);
				String loan_id = "loan" + Integer.toString(i); //반납 남은 일수 css바꾸기 위한 태그 아이디값
				String loan_text = "loantext" + Integer.toString(i); //연체 도서 text 바꾸기 위한 태그 아이디값
				
				BookBean bookBean = bookMgr.getBook(loanBean.getId_num());
				String name = bookBean.getName();
				if(name.length() > 17){
					name = name.substring(0, 15);
					name = name + "..";
				}
				String author = bookBean.getAuthor();
				if(author.length() > 4){
					author = author.substring(0, 4);
					author = author + "..";
				}
				String publisher = bookBean.getPublisher();
				if(publisher.length() > 4) {
					publisher = publisher.substring(0, 4);
					publisher = publisher + "..";
				}
				
				String loan_date = loanBean.getLoan_date().substring(0, 10);
			
				SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
				Date loan = fm.parse(loan_date);
				
				Calendar cal = Calendar.getInstance();
				cal.setTime(loan);
				cal.add(Calendar.DATE, 14);
				
				String return_date = fm.format(cal.getTime());
				Date return_time = fm.parse(return_date);
				Date date = new Date();
				
				long loanT = return_time.getTime() - date.getTime();
				long resultT = loanT / (24*60*60*1000);
	
		%>
		<tr>
			<td class="img pt-3">
				<img width="120" height="140" src="<%=new BucketManager().base64DownLoader(bookBean.getImage())%>" alt="<%=bookBean.getId_num() %>">
			</td>
			<td><span class="title">도서명 : <a class="linkA" href="# "><%=name %></a>	&nbsp;&nbsp;&#124;&nbsp;&nbsp;저자 :<%=author %>&nbsp;&nbsp;&#124;&nbsp;&nbsp;출판사 :<%=publisher %></span>
			<br><span class="loan">대출일&nbsp;</span><span>:&nbsp;<%=loanBean.getLoan_date().substring(0, 10) %></sapn>
			<br><span class="return">반납일&nbsp;</span><span>:&nbsp;<%=return_date %></span>
			<br>
			<div class="mt-3 mb-2 pr-2" style="float:right;">
				<form>
					<input type="hidden" name="id_num" value="1">
					<button class="btn btn-outline-secondary mb-1">리뷰하기</button>
				</form>
			</div>
			<div class="bg-light p-3 mt-2" id="<%=loan_text %>">반납일까지&nbsp;<span class="loan" id="<%=loan_id %>" ><%=resultT %>일</span>&nbsp;남았습니다!
			<% if(resultT < 0){
					%>
					
					<script>
						$("#<%=loan_text%>").html("<span class=\"loan\" id=\"<%=loan_id %>\" ><%=Math.abs(resultT)%>일</span>&nbsp;연체되었습니다!");
						var getId = document.getElementById("<%=loan_id %>");
						getId.style.color="#ff0000";
					</script>
					<%
				}else{
					%>
					<script>
						var getId = document.getElementById("<%=loan_id %>");
						getId.style.color="#146eff";
						
					</script>
					<%
				}
			%>
			</div>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}else if(type.equals("allrecord")){
	%>
		<!-- 모든 대출 기록 -->
		<div class="pl-3 pb-2 pt-3">
			<h4>이전 대출 기록</h4>
		</div>
				<table class="table">
				<%
				Vector vReturn = bookMgr.getReturn(mem_id);
				for(int i=0; i<vReturn.size();i++){
					LoanBean loanBean = (LoanBean)vReturn.get(i);
					
					String return_id = "return" + Integer.toString(i); //반납  타입에 따른 css와 text를 바꾸기 위한 태그 아이디값
					String return_type = loanBean.getReturn_type();
					
					BookBean bookBean = bookMgr.getBook(loanBean.getId_num());
					String name = bookBean.getName();
					if(name.length() > 17){
						name = name.substring(0, 15);
						name = name + "..";
					}
					String author = bookBean.getAuthor();
					if(author.length() > 4){
						author = author.substring(0, 4);
						author = author + "..";
					}
					String publisher = bookBean.getPublisher();
					if(publisher.length() > 4) {
						publisher = publisher.substring(0, 4);
						publisher = publisher + "..";
					}
					
					String loan_date = loanBean.getLoan_date().substring(0, 10);
					String return_date = loanBean.getReturn_date().substring(0, 10);
				
				%>
					<tr>
			<td class="img pt-3">
				<img width="120" height="140" src="<%=new BucketManager().base64DownLoader(bookBean.getImage())%>" alt="<%=bookBean.getId_num() %>">
			</td>
			<td><span class="title">도서명 : <a class="linkA" href="# "><%=name %></a>	&nbsp;&nbsp;&#124;&nbsp;&nbsp;저자 : <%=author %>&nbsp;&nbsp;&#124;&nbsp;&nbsp;출판사 : <%=publisher %></span>
			<br><span class="loan">대출일&nbsp;</span><span>:&nbsp;<%=loan_date %></sapn>
			<br><span class="loan">반납완료일&nbsp;</span><span>:&nbsp;<%=return_date %></span>
			<br>
			<div class="mt-3 mb-2 pr-2" style="float:right;">
				<form>
					<input type="hidden" name="id_num" value="1">
					<button class="btn btn-outline-secondary mb-1">리뷰하기</button>
				</form>
			</div>
			<div class="bg-light p-3 mt-2"><span id="<%=return_id%>">정상</span>반납을 완료하였습니다!</div>
			<% if(return_type.equals("연체반납")){
					%>
					
					<script>
						$("#<%=return_id%>").text("연체");
						var getId = document.getElementById("<%=return_id %>");
						getId.style.color="#ff0000";
					</script>
					<%
				}else{
					%>
					<script>
						var getId = document.getElementById("<%=return_id %>");
						getId.style.color="#146eff";
						
					</script>
					<%
				}
			%>
			</td>
		</tr>
			<%
				}
			%>
				</table>
	<%
		}else if(type.equals("interest")){
	%>
		<!-- 관심 도서 -->
		<div class="pl-3 pb-2 pt-3">
			<h4>관심 도서</h4>
		</div>
		<table class="table table">
		<%
			for(int i=0; i<3;i++){
				%>
		<tr>
			<td>
				<img width="120" height="140" alt="이미지가 없습니다." src="/img/book2.jpg">
			</td>
			<td><span class="title">도서명 : <a class="linkA" href="# ">내가 원하는 것을 나도 모를 때</a>	&nbsp;&nbsp;&#124;&nbsp;&nbsp;저자 : 김도우&nbsp;&nbsp;&#124;&nbsp;&nbsp;출판사 : 동양출판사</span>
			<div class="mt-3 mb-2 pr-1" style="float:right;">
				<form>
					<!-- 관심도서 아이디 자리 -->
					<input type="hidden" name="watch_id" value="1">
					<button class="btn btn-outline-dark mb-5">관심도서삭제</button>
				</form>
			</div>
			<div class="bg-light p-3 mt-5"><span>상태 : 대출불가(대출중)</span></div>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}else if(type.equals("overdue")){
	%>
		<!-- 연체도서 -->
		<div class="pl-3 pb-2 pt-3">
			<h4>연체 도서</h4>
		</div>
				<table class="table">
				<%
		
			Vector vLoan = bookMgr.getLoan(mem_id);
			for(int i=0; i<vLoan.size();i++){
				LoanBean loanBean = (LoanBean)vLoan.get(i);
				String loan_id = "loan" + Integer.toString(i); //반납 남은 일수 css바꾸기 위한 태그 아이디값
				String loan_text = "loantext" + Integer.toString(i); //연체 도서 text 바꾸기 위한 태그 아이디값
			
				BookBean bookBean = bookMgr.getBook(loanBean.getId_num());
				String name = bookBean.getName();
				if(name.length() > 17){
					name = name.substring(0, 15);
					name = name + "..";
				}
				String author = bookBean.getAuthor();
				if(author.length() > 4){
					author = author.substring(0, 4);
					author = author + "..";
				}
				String publisher = bookBean.getPublisher();
				if(publisher.length() > 4) {
					publisher = publisher.substring(0, 4);
					publisher = publisher + "..";
				}
				
				String loan_date = loanBean.getLoan_date().substring(0, 10);
			
				SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
				Date loan = fm.parse(loan_date);
				
				Calendar cal = Calendar.getInstance();
				cal.setTime(loan);
				cal.add(Calendar.DATE, 14);
				
				String return_date = fm.format(cal.getTime());
				Date return_time = fm.parse(return_date);
				Date date = new Date();
				
				long loanT = return_time.getTime() - date.getTime();
				long resultT = loanT / (24*60*60*1000);
				if(resultT < 0) {
	
		%>
					<tr>
						<td class="img pt-3">
							<img width="120" height="140" src="<%=new BucketManager().base64DownLoader(bookBean.getImage())%>" alt="<%=bookBean.getId_num() %>">
						</td>
						<td>
							<td><span class="title">도서명 : <a class="linkA" href="# "><%=name %></a>	&nbsp;&nbsp;&#124;&nbsp;&nbsp;저자 : <%=author %>&nbsp;&nbsp;&#124;&nbsp;&nbsp;출판사 : <%=publisher %></span>
							<br><span class="loan">대출일&nbsp;</span><span>:&nbsp;<%=loan_date %></sapn>
							<br><span class="return">반납일&nbsp;</span><span>:&nbsp;<%=return_date %></span>
							<br>
							<div class="bg-light p-3 mt-2">반납일로부터&nbsp;&nbsp;<span class="overdate"><%=Math.abs(resultT) %></span>&nbsp;&nbsp;연체되었습니다.</div>
						</td>
					</tr>
			<%
				}else{
					%><tr><tr><%
				}
			}
			%>
				</table>
	<%
		} 
	%>
</body>
</html>