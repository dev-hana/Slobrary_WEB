<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<%@page import="bucketConnector.BucketManager"%>
<jsp:useBean id="bookMgr" class="database.BookMgr" />
<%@ include file="/CND.jsp" %>
<%
	String id_num = request.getParameter("bookid");
	BookBean bookBean = bookMgr.getBook(id_num);
	RatingBean rateBean = bookMgr.getBookrating(id_num);
	String subname = bookMgr.getClass(bookBean.getClass_id());
	char mainclass = bookBean.getClass_id().charAt(0);
	String mainclass_ = mainclass + "00";
	String classname = bookMgr.getClass(mainclass_);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Slobrary - <%=bookBean.getName() %></title>
<!-- dataTable pagination -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
<link href="/css/bookDetailPage.css" rel="stylesheet">
</head>
<body>
	<header>
		<jsp:include page="/Top.jsp" flush="false" />
	</header>
	<div class="top-bar">
		<a href="/contents/SearchPage.jsp" class="btn btn-back">
			<i class="fas fa-angle-left"></i>&nbsp;뒤로
		</a>
		<h1>도서 상세 보기</h1>	
	</div>
	
	<section class="bookDetail">
		<div class="bookInfo">
			<div class="imageBox">
				<img class="thumbnail" src="<%=new BucketManager().base64DownLoader(bookBean.getImage())%>" alt="<%=bookBean.getId_num()%>">
			</div>

			<div class="textBox">
				<h1 class="title"><%=bookBean.getName() %></h1>
				<dl>
					<div class="rating">
						<dt>평균평점</dt>
						<dd>
							<%
								double astar = Double.parseDouble(rateBean.getRating());
								int fullStar = (int) Math.floor(astar / 1.0); //꽉찬별 개수
								boolean halfStar = false;

								// 0.5 경우 반별
								if (astar - fullStar == 0.5) {
									halfStar = true;
								}

								for (int s = 1; s <= 5; s++) {
									if (s <= fullStar) {
							%>
							<i class="fas fa-star"></i>
							<%
								} else if (s > fullStar && halfStar == true) {
							%>
							<i class="fas fa-star-half"></i> <i
								class="fas fa-star-half fa-flip-horizontal disabled"></i>
							<%
								if (s == 5) {
											break;
										}
										halfStar = false;
									} else {
							%>
							<i class="fas fa-star disabled"></i>
							<%
								}
								}
							%>
							<%=astar%>
						</dd>
					</div>
					<div>
						<dt>저자명</dt>
						<dd><%=bookBean.getAuthor() %></dd>
					</div>
					<div>
						<dt>출판사</dt>
						<dd><%=bookBean.getPublisher() %></dd>
					</div>
					<div>
						<dt>대분류</dt>
						<dd><%=classname %></dd>
					</div>
					<div>
						<dt>소분류</dt>
						<dd><%=subname %></dd>
					</div>
					<div>
						<dt>ISBN</dt>
						<dd><%=bookBean.getIsbn() %></dd>
					</div>
					<div>
						<dt>언어</dt>
						<dd><%=bookBean.getLanguage() %></dd>
					</div>
				</dl>


				<div class="buttons">
					<!--form>
						<input type="hidden" name="watch_id" value="1">
						<button type="submit">관심도서등록</button>
					</form-->
					<button type="submit" class="btn">관심도서등록</button>
					<button type="button" class="btn">리뷰 작성</button>
					<button type="button" class="btn">독후감 작성</button>
				</div>
			</div>
		</div>
		
		<div class="collectionInfo">
			<h2 class="subTitle">소장정보</h2>
			<table class="table">
				<thead>
					<th>대출상태</th>
					<th>청구기호</th>
					<th>등록번호</th>
					<th>반납예정일</th>
				</thead>
				<tbody>
					<%
					Vector vequalBook = bookMgr.getEqualbook(bookBean.getIsbn());
					for (int i = 0; i < vequalBook.size(); i++) {
						BookBean equalBean = (BookBean)vequalBook.get(i);
						String status = "";
						if(equalBean.getStatus().equals("대출가능")){
							status = "대출가능";
						}else{
							status="대출불가["+equalBean.getStatus()+"]";
						}
				%>
					<tr>
						<td><%=status %></td>
						<td><%=equalBean.getSign() %></td>
						<td><%=equalBean.getId_num() %></td>
						<td><%=equalBean.getDate().substring(0, 10) %></td>
					</tr>
					<%
					}
				%>
				</tbody>
			</table>
		</div>

		<div class="bookReviews">
			<h2 class="subTitle">도서 리뷰</h2>
			<button type="button" class="btn btn-more">모두 보기</button>

			<select name="keytype" class="sort">
				<option value="all">최근 등록 순</option>
				<option value="title">높은 평가 순</option>
				<option value="author">낮은 평가 순</option>
			</select>
			<%
			for (int k = 0; k < 3; k++) {
		%>
			<div class="bookReview">
				<a href="#" class="user"> <img
					src="/img/default/userImg/boy1.png" alt="" class="user-img">
					<b>닉네임</b>
				</a> <span class="date">작성일<%=k%></span> <span class="rating"> <i
					class="fas fa-star"></i>
				</span>
				<p class="contents">이 책은 어쩌구 저쩌구 재밌는데 지루하고 어쩌구이다. 이 책은 어쩌구 저쩌구
					재밌는데 지루하고 어쩌구이다. 이 책은 어쩌구 저쩌구 재밌는데 지루하고 어쩌구이다. 이 책은 어쩌구 저쩌구 재밌는데
					지루하고 어쩌구이다. 이 책은 어쩌구 저쩌구 재밌는데 지루하고 어쩌구이다. 이 책은 어쩌구 저쩌구 재밌는데 지루하고
					어쩌구이다.</p>
				<button type="button" class="btn btn-more">더보기</button>
			</div>
			<%
			}
		%>
		</div>

		<div class="bookReports">
			<h2 class="subTitle">독후감</h2>
			<button type="button" class="btn btn-more">모두 보기</button>
			<select name="keytype" class="sort">
				<option value="all">최근 등록 순</option>
				<option value="title">작성자 순</option>
				<option value="author">가나다 순</option>
			</select>
			<div class="bookReport">
				<a href="#" class="user"> <b>닉네임</b> <img
					src="/img/default/userImg/boy1.png" alt="" class="user-img">
				</a>
				<div class="contents">
					<b class="title">독후감 제목</b> <span class="date">작성일</span>
					<p class="detail">이 책은 어쩌구 저쩌구 재밌는데 지루하고 어쩌구이다.이 책은 어쩌구 저쩌구
						재밌는데 지루하고 어쩌구이다.이 책은 어쩌구 저쩌구 재밌는데 지루하고 어쩌구이다.이 책은 어쩌구 저쩌구 재밌는데
						지루하고 어쩌구이다.</p>
				</div>
			</div>
		</div>

		<div class="sameAuthorBooks">
			<h2 class="subTitle">이 책과 저자가 같은 도서</h2>
			<div class="bookList">
			<%
			Vector vEqualA = bookMgr.getEqualauthor(bookBean.getAuthor());
			for(int j=0; j<vEqualA.size(); j++) {
				BookBean equalaBean = (BookBean)vEqualA.get(j);
				RatingBean ratingBean = bookMgr.getBookrating(equalaBean.getId_num());
				String book_name ="";
				if(equalaBean.getName().length() < 9){
					book_name = equalaBean.getName();
				}else{
					book_name = equalaBean.getName().substring(0, 9) + "...";
				}
			
			%>
				<a href="/contents/BookDetailPage.jsp?bookid=<%=equalaBean.getId_num()%>" class="book">
					<div class="imageBox">
						<img class="thumbnail" alt="" src="<%=new BucketManager().base64DownLoader(equalaBean.getImage())%>">
					</div> <b class="title"><%=book_name %></b> <small class="author"><%=equalaBean.getAuthor() %></small>
				</a> 
					<%
				}
				%>
			</div>
		</div>

	</section>
	<!-- paging js -->
		<script>
			$(document).ready(function() {
				$('#review').DataTable({
					// 표시 건수기능 숨기기 select로 몇개씩 표출할지
					lengthChange : false,

					// 검색 기능 숨기기
					searching : false,

					// 정렬 기능 숨기기
					ordering : false,

					// 정보 표시 숨기기
					info : false,

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