<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bucketConnector.BucketManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="bookMgr" class="database.BookMgr" />
<jsp:useBean id="watchMgr" class="database.WatchMgr" />
<%@ page import="java.text.*"%>
<%@ include file="/CND.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link href="/css/MyPageList.css?v=2" rel="stylesheet" />
<link href="/css/pagination.css" rel="stylesheet">
<style type="text/css">
.remove_thead {
	display: none;
}
.img{
	display:flex;
	align-item: center;
}
</style>
</head>
<body>
	<%
		String mem_id = (String)session.getAttribute("loginKey");
		String type = request.getParameter("type");
	 	//type="interest";
		if(type.equals("loanbook")){
	%>
	<!-- 현재 대출중인 도서 -->
	<div class="pl-3 pt-3 pb-1">
		<h4>대출 도서</h4>
	</div>
	<%
		Vector vLoan = bookMgr.getLoan(mem_id, 0);
		if(vLoan.size() != 0){
	%>
	<table class="table mt-2">
		<%
			
			for(int i=0; i<vLoan.size();i++){
				LoanBean loanBean = (LoanBean)vLoan.get(i);
				String loan_id = "loan" + Integer.toString(i); //반납 남은 일수 css바꾸기 위한 태그 아이디값
				String loan_text = "loantext" + Integer.toString(i); //연체 도서 text 바꾸기 위한 태그 아이디값
				
				BookBean bookBean = bookMgr.getBook(loanBean.getId_num());
				
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
			<td class="img"><img width="110" height="140" 
				src="<%=new BucketManager().base64DownLoader(bookBean.getImage())%>"
				alt="<%=bookBean.getId_num() %>">
			</td>
			<td>
				<span class="title mr-2">
					<strong>[&nbsp;도서&nbsp;]</strong>
				</span>
				<span class="alink">
					<a href="# "><%=bookBean.getName() %></a>
				</span> <br>
				<span class="mr-2" style="color: BDBDBD; font-size: 0.7px;">
					<i class="fas fa-square-full"></i>
				</span>
				<span class="ap">
					저자 : <%=bookBean.getAuthor() %>
				</span> <br>
				<span class="mr-2" style="color: BDBDBD; font-size: 0.7px;">
					<i class="fas fa-square-full"></i>
				</span>
				<span class="ap">
					출판사 : <%=bookBean.getPublisher() %>
				</span> <br>
				
				<div class="sm-date">
					<span class="loan">대출일&nbsp;</span><span>:&nbsp;<%=loanBean.getLoan_date().substring(0, 10) %></sapn><br>
						<span class="return">반납일&nbsp;</span><span>:&nbsp;<%=return_date %></span>
				</div>
				
				<div class="btn-community btn-group mt-3 mb-2 pr-2">
					<button type="button" onclick="modal_view('<%=bookBean.getName() %>','<%=bookBean.getId_num() %>')" data-toggle="modal" data-target="#reviewModal" class="btn btn-outline-secondary mb-1">
						리뷰하기
					</button>
					<div class="dropdown">
						<button onclick="buttonDrop()" class="btn btn-outline-secondary mb-1 dropdown-toggle"></button>
						<div class="dropdown-content communityDropdown dropdown-menu-right">
						<a href="/contents/community/BookDiaryForm.jsp" class="dropdown-item">
							독서일기쓰기
						</a>
						<a href="/contents/community/DrawUp.jsp?type=report&book_id=<%=bookBean.getId_num() %>" class="dropdown-item">
							독후감 쓰기
						</a>
					</div>
				</div>
				</div>
				
				<div class="bg-light p-3 mt-2" id="<%=loan_text %>">
					반납일까지&nbsp;
					<span class="loan" id="<%=loan_id %>"><%=resultT %>일</span>&nbsp;
					남았습니다!
					<% 
						if(resultT < 0){
					%>
					<script>
						$("#<%=loan_text%>").html("<span class=\"loan\" id=\"<%=loan_id %>\" ><%=Math.abs(resultT)%>일</span>&nbsp;연체되었습니다!");
						var getId = document.getElementById("<%=loan_id%>");
						getId.style.color="#ff0000";
					</script>
					<%
						} else {
					%>
					<script>
						var getId = document.getElementById("<%=loan_id%>");
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
	
	<%		}else{
		%>
			<!-- <a href='https://www.freepik.com/vectors/data'>Data vector created by stories - www.freepik.com</a> -->
			<div class="p-4 m-2 text-center border now-loan">
				<img alt="이미지가 없습니다." width="210" src="/img/no_data.jpg"><br>
				<span>현재 대출중인 도서가 없습니다</span>
			</div>
		<%
	}
		} else if (type.equals("allrecord")) {
	%>
		<div class="pl-3 pt-3 pb-1">
			<h4>이전 대출 기록</h4>
		</div>
	<%
			Vector vReturn = bookMgr.getReturn(mem_id, 0);
			if(vReturn.size()!=0){
	%>
	<!-- 모든 대출 기록 -->
	<table class="table mt-2" id="allTable">
		<thead class="hiddenTh">
			<tr>
				<th>이미지</th>
				<th>도서 정보</th>
			</tr>
		</thead>
		<%
			
				for (int i = 0; i < vReturn.size(); i++) {
					LoanBean loanBean = (LoanBean) vReturn.get(i);

					String return_id = "return" + Integer.toString(i); //반납  타입에 따른 css와 text를 바꾸기 위한 태그 아이디값
					String return_type = loanBean.getReturn_type();

					BookBean bookBean = bookMgr.getBook(loanBean.getId_num());

					String loan_date = loanBean.getLoan_date().substring(0, 10);
					String return_date = loanBean.getReturn_date().substring(0, 10);
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					Date firstDate = format.parse(loan_date);
					Date lastDate = format.parse(return_date);
					long calDate = firstDate.getTime() - lastDate.getTime();
					long calDate_ = calDate / (24*60*60*1000);
					calDate_ = Math.abs(calDate_);

		%>
		<tr>
			<td class="img"><img width="110" height="140"
				src="<%=new BucketManager().base64DownLoader(bookBean.getImage())%>"
				alt="<%=bookBean.getId_num()%>">
			</td>
			<td>
				<span class="title mr-2">
					<strong>[&nbsp;도서&nbsp;]</strong>
				</span>
				<span class="alink">
					<a href="# "><%=bookBean.getName()%></a>
				</span><br> 
				<span class="mr-2" style="color: BDBDBD; font-size: 0.7px;">
					<i class="fas fa-square-full"></i>
				</span>
				<span class="ap">
					저자 : <%=bookBean.getAuthor()%>
				</span><br>
				<span class="mr-2" style="color: BDBDBD; font-size: 0.7px;">
					<i class="fas fa-square-full"></i>
				</span>
				<span class="ap">
					출판사 : <%=bookBean.getPublisher()%>
				</span>
				
				<div class="sm-date">
					<span class="loan">대출일&nbsp;</span><span>:&nbsp;<%=loan_date%></span><br>
					<span class="loan">반납완료일&nbsp;</span><span>:&nbsp;<%=return_date%></span>
				</div>
				
				<div class="btn-community btn-group mt-3 mb-2 pr-2">
					<button type="button" onclick="modal_view('<%=bookBean.getName() %>','<%=bookBean.getId_num() %>')" data-toggle="modal" data-target="#reviewModal" class="btn btn-outline-secondary mb-1">
						리뷰하기
					</button>
					<div class="dropdown">
						<button onclick="buttonDrop()" class="btn btn-outline-secondary mb-1 dropdown-toggle"></button>
						<div class="dropdown-content communityDropdown dropdown-menu-right">
						<a href="/contents/community/BookDiaryForm.jsp" class="dropdown-item">
							독서일기쓰기
						</a>
						<a href="/contents/community/DrawUp.jsp?type=report&book_id=<%=bookBean.getId_num()%>" class="dropdown-item">
							독후감 쓰기
						</a>
					</div>
				</div>
				</div>
				<div class="bg-light p-3 mt-2">
					<span id="<%=return_id%>">정상</span>반납을 완료하였습니다!
				</div> 
				
				<%
 				if (calDate_ > 14) {
 				%> 
 				<script>
					$("#<%=return_id%>").text("연체");
					var getId = document.getElementById("<%=return_id%>");
					getId.style.color="#ff0000";
				</script> 
				<%
 					} else {
 				%> 
 				<script>
					var getId = document.getElementById("<%=return_id%>");
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
			}else{
				%>
					<div class="p-5 m-2 text-center border non-loan">
						아직 도서를 대출하지 않았습니다<br>
						<span>Slobrary</span>와 함께 읽고 싶은 도서를 찾아봐요!<br>
						다른 유저들의 리뷰를 보고 마음에 드는 도서를 담아보세요<br>
						<button class="btn btn-outline-secondary rounded mt-3">도서리뷰 보러가기</button>
					</div>
				<%
			}
		} else if (type.equals("interest")) {
	%>
	<!-- 관심 도서 -->
	<div class="pl-3 pb-2 pt-3">
		<h4>관심 도서</h4>
	</div>
	<table class="table table" id="allTable">
		<thead class="remove_thead">
			<tr>
				<th>이미지</th>
				<th>정보</th>
			</tr>
		</thead>
		<tbody>
			<%
				Vector vWatch = watchMgr.getWatch(mem_id);
					for (int i = 0; i < vWatch.size(); i++) {
						WatchBean watchBean = (WatchBean) vWatch.get(i);
						BookBean bookBean = bookMgr.getBook(watchBean.getBook_id());
						String watch_id = "watch" + Integer.toString(i); //도서 상태에 따른 css를 바꾸기 위한 태그 아이디값

						String name = bookBean.getName();
						if (name.length() > 17) {
							name = name.substring(0, 15);
							name = name + "..";
						}
						String author = bookBean.getAuthor();
						if (author.length() > 4) {
							author = author.substring(0, 4);
							author = author + "..";
						}
						String publisher = bookBean.getPublisher();
						if (publisher.length() > 4) {
							publisher = publisher.substring(0, 4);
							publisher = publisher + "..";
						}
						String status = bookBean.getStatus();
			%>
			<tr>
				<td class="img"><img width="110" height="140"
					src="<%=new BucketManager().base64DownLoader(bookBean.getImage())%>"
					alt="<%=bookBean.getId_num()%>">
				</td>
				<td>
					<span class="title mr-2">
						<strong>[&nbsp;도서&nbsp;]</strong>
					</span>
					<span class="alink">
						<a href="# "><%=name%></a>
					</span><br> 
					<span class="mr-2" style="color: BDBDBD; font-size: 0.7px;">
						<i class="fas fa-square-full"></i>
					</span>
					<span class="ap">
						저자 : <%=author%>
					</span><br>
					<span class="mr-2" style="color: BDBDBD; font-size: 0.7px;">
						<i class="fas fa-square-full"></i>
					</span>
					<span class="ap">
						출판사 : <%=publisher%>
					</span>
					<div class="mt-5 pt-1 pr-1" style="float: right;">
						<form>
							<!-- 관심도서 아이디 자리 -->
							<input type="hidden" name="watch_id" value="1">
							<button class="btn btn-outline-secondary">관심도서삭제</button>
						</form>
					</div>
					<div class="bg-light p-3 mt-4">
						상태: <span id="<%=watch_id%>">&nbsp;&nbsp;<%=status%></span>
					</div> 
					
					<%
 						if (status.equals("대출가능")) {
 					%> 
 					<script>
						var getId = document.getElementById("<%=watch_id%>");
						getId.style.color="#146eff";
					</script> 
					<%
 						} else {
 					%> 
 					<script>
						var getId = document.getElementById("<%=watch_id%>");
						getId.style.color = "#ff0000";
					</script> 
					<%
 						}
 					%>
 				</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	
	<%
		} else if (type.equals("overdue")) {
	%>
	<!-- 연체도서 -->
	<div class="pl-3 pb-2 pt-3">
		<h4>연체 도서</h4>
	</div>
	<table class="table" id="overdueTable" onload="page()">
		<thead class="hiddenTh">
			<tr>
				<th>이미지</th>
				<th>도서 정보</th>
			</tr>
		</thead>
		<tbody>
			<%
				Vector vLoan = bookMgr.getLoan(mem_id, 0);
					for (int i = 0; i < vLoan.size(); i++) {
						LoanBean loanBean = (LoanBean) vLoan.get(i);
						String loan_id = "loan" + Integer.toString(i); //반납 남은 일수 css바꾸기 위한 태그 아이디값
						String loan_text = "loantext" + Integer.toString(i); //연체 도서 text 바꾸기 위한 태그 아이디값

						BookBean bookBean = bookMgr.getBook(loanBean.getId_num());
						String name = bookBean.getName();
						if (name.length() > 17) {
							name = name.substring(0, 15);
							name = name + "..";
						}
						String author = bookBean.getAuthor();
						if (author.length() > 4) {
							author = author.substring(0, 4);
							author = author + "..";
						}
						String publisher = bookBean.getPublisher();
						if (publisher.length() > 4) {
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
						long resultT = loanT / (24 * 60 * 60 * 1000);
						if (resultT < 0) {
			%>
			<tr>
				<td class="img">
					<img width="110" height="140"
						src="<%=new BucketManager().base64DownLoader(bookBean.getImage())%>"
						alt="<%=bookBean.getId_num()%>">
				</td>
				<td>
				<td>
					<span class="title mr-2">
						<strong>[&nbsp;도서&nbsp;]</strong>
					</span>
					<span class="alink">
						<a href="# "><%=name%></a>
					</span><br> 
					<span class="mr-2" style="color: BDBDBD; font-size: 0.7px;">
						<i class="fas fa-square-full"></i>
					</span>
					<span class="ap">
						저자 : <%=author%>
					</span><br>
					<span class="mr-2" style="color: BDBDBD; font-size: 0.7px;">
						<i class="fas fa-square-full"></i>
					</span>
					<span class="ap">
						출판사 : <%=publisher%>
					</span>
					
					<div class="sm-date">
						<span class="loan">대출일&nbsp;</span>
						<span>:&nbsp;<%=loan_date%></span><br>
						<span class="return">반납일&nbsp;</span>
						<span>:&nbsp;<%=return_date%></span>
					</div>
					
					<div class="bg-light p-3 mt-2">
						반납일로부터&nbsp;&nbsp;
						<span class="overdate"><%=Math.abs(resultT)%></span>
						일&nbsp;&nbsp;연체되었습니다.
					</div>
				</td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td>a</td>
				<td>연체된 도서가 없습니다</td>
			</tr>
			<%
				}
			}
			%>
		</tbody>
	</table>
	<%
		}
	%>
	<!-- Modal -->
	<jsp:include page="/contents/ReviewModal.jsp" flush="false" />
	<script>
		function modal_view(title, loan_id) {
			$("#modalTitle").text(title + "-리뷰");
			$("#l_id").val(loan_id);
		}
		
		// community dropdown button 관련 스크립트
		// 버튼 토글 
		function buttonDrop() {
			var dropdownItem = $(document.activeElement).parent().find('.communityDropdown');
			if (dropdownItem.hasClass("show")) {
				dropdownItem.removeClass("show");
			} else {
				dropdownItem.addClass("show");
			}

		}
		// 화면 바깥 클릭 시 모든 토글 사라지게
		window.onclick = function(event) {
			if (!event.target.matches('.dropdown-toggle')) {
				var dropdowns = document.getElementsByClassName("dropdown-content");
				var i;
				for (i = 0; i < dropdowns.length; i++) {
					var openDropdown = dropdowns[i];
					if (openDropdown.classList.contains('show')) {
						openDropdown.classList.remove('show');
					}
				}
			}
		}
	</script>
	<!-- dataTable js -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
	<script>
		$(document).ready(function() {
			//이전 대출 목록 페이지네이션
			$('#allTable').DataTable({
				// 표시 건수기능 숨기기 select로 몇개씩 표출할지
				lengthChange : false,

				// 검색 기능 숨기기
				searching : false,

				// 정렬 기능 숨기기
				ordering : false,

				// 정보 표시 숨기기
				info : false,

				//dataTable 초기화 에러시 추가
				bDestroy : true,

				//몇개씩 보여줄지
				displayLength : 5,
				language : {
					paginate : {
						previous : '‹',
						next : '›'
					}
				}
			});
		});
	</script>
</body>
</html>