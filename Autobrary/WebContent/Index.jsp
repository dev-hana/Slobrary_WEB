<%@page import="bucketConnector.BucketManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="memMgr" class="database.MemMgr" />
<jsp:useBean id="loanMgr" class="database.LoanMgr" />
<jsp:useBean id="watchMgr" class="database.WatchMgr" />
<jsp:useBean id="bookMgr" class="database.BookMgr" />

<jsp:useBean id="noticeMgr" class="database.NoticeMgr" />

<%
String mem_id = (String)session.getAttribute("loginKey");
%>
<!DOCTYPE html>
<html>
<head>
<title>Slobrary</title>
<link href="css/index.css?v=5" rel="stylesheet">
<%@ include file="/CND.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body class="bg-light">
	<header>
		<jsp:include page="/Top.jsp" flush="false" />
	</header>

	<div id="carousel" class="carousel slide carousel-fade"
		data-ride="carousel" data-interval="6000">
		<ol class="carousel-indicators">
			<li data-target="#carousel" data-slide-to="0" class="active"></li>
			<li data-target="#carousel" data-slide-to="1"></li>
			<li data-target="#carousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<!-- 신간도서 -->
			<div id="carousel-item-new" class="carousel-item active">
				<div class="container">
					<div class="row justify-content-md-center m-5">
						<div class="col-xs-6 mb-5 carousel-text">
							<div>
								<h1 id="texth1">NEW</h1>
								<p>Slobrary에 새로 들어온 신간이에요!</p>
								<button class="btn btn-sm btn-outline-secondary" type="button"
									onclick="location.href='/contents/SearchPage.jsp?contentPage=BookList.jsp?type=new'">더보기</button>
							</div>
						</div>
						<div class="col-xs-6">
							<div class="bookshelf container">
							<%
							//신간 도서 6개
							Vector vNew = bookMgr.getNewList(6);
							String newImage[] = new String [6];
							String newId[] = new String [6];
							for(int i = 0; i<vNew.size(); i++){
								BookBean bookBean = (BookBean)vNew.get(i);
								newImage[i] = bookBean.getImage();
								newId[i] = bookBean.getId_num();
							}
							
							%>
								<div class="row ml-5 mr-5">
									<div class="col-4 book">
										<a class="thumbnail_image shadow" href="/contents/BookDetailPage.jsp?bookid=<%=newId[0]%>"> <img
											class="thumbnail" src="<%=new BucketManager().base64DownLoader(newImage[0])%>"
											alt="<%=newId[0] %>"> <span class="border"></span>
										</a>
									</div>
									<div class="col-4 book">
										<a class="thumbnail_image shadow" href="/contents/BookDetailPage.jsp?bookid=<%=newId[1]%>"> <img
											class="thumbnail" src="<%=new BucketManager().base64DownLoader(newImage[1])%>"
											alt="<%=newId[1] %>"> <span class="border"></span>
										</a>
									</div>
									<div class="col-4 book">
										<a class="thumbnail_image shadow" href="/contents/BookDetailPage.jsp?bookid=<%=newId[2]%>"> <img
											class="thumbnail" src="<%=new BucketManager().base64DownLoader(newImage[2])%>"
											alt="<%=newId[2] %>"> <span class="border"></span>
										</a>
									</div>
								</div>
								<div class="row mb-4 ml-4 mr-4">
									<div class="rounded shelf shadow btom"></div>
								</div>

								<div class="row ml-5 mr-5">
									<div class="book col-4">
										<a class="thumbnail_image shadow" href="/contents/BookDetailPage.jsp?bookid=<%=newId[3]%>"> <img
											class="thumbnail" src="<%=new BucketManager().base64DownLoader(newImage[3])%>"
											alt="<%=newId[3] %>"> <span class="border"></span>
										</a>
									</div>
									<div class="col-4 book">
										<a class="thumbnail_image shadow" href="/contents/BookDetailPage.jsp?bookid=<%=newId[4]%>"> <img
											class="thumbnail" src="<%=new BucketManager().base64DownLoader(newImage[4])%>"
											alt="<%=newId[4] %>"> <span class="border"></span>
										</a>
									</div>
									<div class="col-4 book">
										<a class="thumbnail_image shadow" href="/contents/BookDetailPage.jsp?bookid=<%=newId[5]%>"> <img
											class="thumbnail" src="<%=new BucketManager().base64DownLoader(newImage[5])%>"
											alt="<%=newId[5] %>"> <span class="border"></span>
										</a>
									</div>
								</div>
								<div class="row mb-4 ml-4 mr-4">
									<div class="rounded shelf shadow btom"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 베스트셀러 -->
			<div id="carousel-item-best" class="carousel-item">
				<div class="container">
					<div class="row justify-content-md-center m-5">
						<div class="col-xs-6 mb-5 carousel-text">
							<div>
								<h1 id="texth1">Best</h1>
								<p>이번달 베스트셀러를 보여드려요.</p>
								<button class="btn btn-sm btn-outline-secondary" type="button"
									onclick="location.href='/contents/SearchPage.jsp?contentPage=BookList.jsp?type=best'">더보기</button>
							</div>
						</div>
						<div class="col-xs-6">
							<div class="bookshelf container">
							<%
							Vector vResult = bookMgr.getBestList(6);
							String bestImage[] = new String [6];
							String bestId[] = new String [6];
							for(int i = 0; i<vResult.size(); i++){
								BestBean bestBean = (BestBean)vResult.get(i);
								BookBean bookBean = bookMgr.getBook(bestBean.getId_num());
								bestImage[i] = bookBean.getImage();
								bestId[i] = bestBean.getId_num();
							}
							
							%>
								<div class="row ml-5 mr-5">
									<div class="col-4 book">
										<a class="thumbnail_image shadow" href="/contents/BookDetailPage.jsp?bookid=<%=bestId[0]%>"> <img
											class="thumbnail" src="<%=new BucketManager().base64DownLoader(bestImage[0])%>"
											alt="<%=bestId[0] %>"> <span class="border"></span>
										</a>
									</div>
									<div class="col-4 book">
										<a class="thumbnail_image shadow" href="/contents/BookDetailPage.jsp?bookid=<%=bestId[1]%>"> <img
											class="thumbnail" src="<%=new BucketManager().base64DownLoader(bestImage[1])%>"
											alt="<%=bestId[1] %>"> <span class="border"></span>
										</a>
									</div>
									<div class="col-4 book">
										<a class="thumbnail_image shadow" href="/contents/BookDetailPage.jsp?bookid=<%=bestId[2]%>"> <img
											class="thumbnail" src="<%=new BucketManager().base64DownLoader(bestImage[2])%>"
											alt="<%=bestId[2] %>"> <span class="border"></span>
										</a>
									</div>
								</div>
								<div class="row mb-4 ml-4 mr-4">
									<div class="rounded shelf shadow btom"></div>
								</div>

								<div class="row ml-5 mr-5">
									<div class="book col-4">
										<a class="thumbnail_image shadow" href="/contents/BookDetailPage.jsp?bookid=<%=bestId[3]%>"> <img
											class="thumbnail" src="<%=new BucketManager().base64DownLoader(bestImage[3])%>"
											alt="<%=bestId[3] %>"> <span class="border"></span>
										</a>
									</div>
									<div class="col-4 book">
										<a class="thumbnail_image shadow" href="/contents/BookDetailPage.jsp?bookid=<%=bestId[4]%>"> <img
											class="thumbnail" src="<%=new BucketManager().base64DownLoader(bestImage[4])%>"
											alt="<%=bestId[4] %>"> <span class="border"></span>
										</a>
									</div>
									<div class="col-4 book">
										<a class="thumbnail_image shadow" href="/contents/BookDetailPage.jsp?bookid=<%=bestId[5]%>"> <img
											class="thumbnail" src="<%=new BucketManager().base64DownLoader(bestImage[5])%>"
											alt="<%=bestId[5] %>"> <span class="border"></span>
										</a>
									</div>
								</div>
								<div class="row mb-4 ml-4 mr-4">
									<div class="rounded shelf shadow btom"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 오늘의 추천 책 -->
			<div id="carousel-item-pick" class="carousel-item">
				<div class="container">
					<div class="row justify-content-md-center m-5">
						<div class="col-xs-6 mb-5 carousel-text">
							<div>
								<h1 id="texth1">Today's Pick</h1>
								<p>오늘의 추천도서입니다.</p>
								<button class="btn btn-sm btn-outline-secondary" type="button"
									onclick="">더보기</button>
							</div>
						</div>
						<div class="col-xs-6">
							<div class="bookshelf container">
								<div class="row ml-5 mr-5">
									<div class="col-4 book">
										<a class="thumbnail_image shadow" href="#"> <img
											class="thumbnail" src="/img/main-ex/bookcover.jpg" alt="추천 1">
											<span class="border"></span>
										</a>
									</div>
									<div class="col-4 book">
										<a class="thumbnail_image shadow" href="#"> <img
											class="thumbnail" src="/img/main-ex/bookcover.jpg" alt="추천 2">
											<span class="border"></span>
										</a>
									</div>
									<div class="col-4 book">
										<a class="thumbnail_image shadow" href="#"> <img
											class="thumbnail" src="/img/main-ex/bookcover.jpg" alt="추천 3">
											<span class="border"></span>
										</a>
									</div>
								</div>
								<div class="row mb-4 ml-4 mr-4">
									<div class="rounded shelf shadow btom"></div>
								</div>

								<div class="row ml-5 mr-5">
									<div class="book col-4">
										<a class="thumbnail_image shadow" href="#"> <img
											class="thumbnail" src="/img/main-ex/bookcover.jpg" alt="추천 4">
											<span class="border"></span>
										</a>
									</div>
									<div class="col-4 book">
										<a class="thumbnail_image shadow" href="#"> <img
											class="thumbnail" src="/img/main-ex/bookcover.jpg" alt="추천 5">
											<span class="border"></span>
										</a>
									</div>
									<div class="col-4 book">
										<a class="thumbnail_image shadow" href="#"> <img
											class="thumbnail" src="/img/main-ex/bookcover.jpg" alt="추천 6">
											<span class="border"></span>
										</a>
									</div>
								</div>
								<div class="row mb-4 ml-4 mr-4">
									<div class="rounded shelf shadow btom"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.carousel-item -->
		</div>
		<!-- /.carousel-inner -->
		<a class="carousel-control-prev" href="#carousel" role="button"
			data-slide="prev"> <span class="carousel-control-prev-icon"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carousel" role="button"
			data-slide="next"> <span class="carousel-control-next-icon"
			aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>

	<div id="body-sub" class="container pl-5 pr-5 mb-5">
		<%
          	
 				if(mem_id == null) {
 					%><div></div>
		<%
 				}
 	
 				else {				
 					MemBean memBean = memMgr.getMember(mem_id);
 					String loaning = loanMgr.countLoaning(mem_id);
 					String loaned = loanMgr.countLoaned(mem_id);
 					String watch = watchMgr.countWatch(mem_id);
 					
 					//대출중인 도서 이미지 상위 3개(날짜기준)

 					Vector vLoaninfo = bookMgr.getLoan(mem_id, 3);
 					String loanImage[] = new String [3];
 					String loanId[] = new String [3];
 					if(vLoaninfo.size() == 0){
 						loanImage[0] = "noimage.png";
 						loanImage[1] = "noimage.png";
 						loanImage[2] = "noimage.png";
 						loanId[0] = "No Image";
 						loanId[1] = "No Image";
 						loanId[2] = "No Image";
 					}else if(vLoaninfo.size() == 1){
 						loanImage[1] = "noimage.png";
 						loanImage[2] = "noimage.png";
 						loanId[1] = "No Image";
 						loanId[2] = "No Image";
 					}else if(vLoaninfo.size() == 2){
 						loanImage[2] = "noimage.png";
 						loanId[2] = "No Image";
 					}
 					
 					for(int i = 0; i<vLoaninfo.size(); i++){
 						LoanBean loanBean = (LoanBean)vLoaninfo.get(i);
 						BookBean bookBean = bookMgr.getBook(loanBean.getId_num());
 						loanImage[i] = bookBean.getImage();
 						loanId[i] = bookBean.getId_num();
 					}
 					
 					//읽은 도서의 이미지 상위 3개
 					Vector vReturninfo = bookMgr.getReturn(mem_id, 3);
 					String returnImage[] = new String [3];
 					String returnId[] = new String[3];
 					if(vReturninfo.size() == 0){
 						returnImage[0] = "noimage.png";
 						returnImage[1] = "noimage.png";
 						returnImage[2] = "noimage.png";
 						returnId[0] = "No Image";
 						returnId[1] = "No Image";
 						returnId[2] = "No Image";
 					}else if(vReturninfo.size() == 1){
 						returnImage[1] = "noimage.png";
 						returnImage[2] = "noimage.png";
 						returnId[1] = "No Image";
 						returnId[2] = "No Image";
 					} else if(vReturninfo.size() == 2){
 						returnImage[2] = "noimage.png";
 						returnId[2] = "No Image";
 					}
 					for(int i = 0; i<vReturninfo.size(); i++){
 						LoanBean loanBean = (LoanBean)vReturninfo.get(i);
 						BookBean bookBean = bookMgr.getBook(loanBean.getId_num());
 						returnImage[i] = bookBean.getImage();
 						returnId[i] = bookBean.getId_num();
 					}
 					
 					
 					//위시리스트 도서 이지미 상위 3개
 					Vector vWatchinfo = watchMgr.getWatch3(mem_id);
 					String watchImage[] = new String [3];
 					String watchId[] = new String[3];
 					if(vWatchinfo.size() == 0){
 						watchImage[0] = "noimage.png";
 						watchImage[1] = "noimage.png";
 						watchImage[2] = "noimage.png";
 						watchId[0] = "No Image";
 						watchId[1] = "No Image";
 						watchId[2] = "No Image";
 					}else if(vWatchinfo.size() == 1){
 						watchImage[1] = "noimage.png";
 						watchImage[2] = "noimage.png";
 						watchId[1] = "No Image";
 						watchId[2] = "No Image";
 					} else if(vWatchinfo.size() == 2){
 						watchImage[2] = "noimage.png";
 						watchId[2] = "No Image";
 					}
 					for(int i = 0; i<vWatchinfo.size(); i++){
 						WatchBean watchBean = (WatchBean)vWatchinfo.get(i);
 						BookBean bookBean = bookMgr.getBook(watchBean.getBook_id());
 						watchImage[i] = bookBean.getImage();
 						watchId[i] = bookBean.getId_num();
 					}
 					
 					
 					//댜츌중인 책 이름과 갯수
 					LoanBean loan_bean = bookMgr.getLoannew(mem_id);   //대출한 도서(가장 오래된)의 아이디 가져오기(1개)
 					BookBean book_bean = bookMgr.getBook(loan_bean.getId_num());
 					String book_name = book_bean.getName(); 
 					String count = bookMgr.countLoan(mem_id); //대출 권수
 					int count_ = Integer.parseInt(count);
 					count_ = count_ -1;
 					
 					
 					
 					
 	%>
		<div class="row justify-content-md-center mb-5">
            <div id="userinfo" class="col-xs-3" style="width: 350px; background: #fff;">
                <div id="userinfo-status">
                    <p class="p-4">
                        <span id="status-emoji">🤔</span><br> <span>'<%=book_name %>'</span> 외 <span><%=count_ %></span>권<br>
                        연체까지 <span>0</span>일 남았어요!
                    </p>
                    <p style="height: 1px; background-color: lightgray; margin: 10px 100px;"></p>
                </div>
                <div class="img-wrapper mb-2">
                    <img id="userinfo-img" class="img-cover" src="/img/default/userImg/<%=memBean.getProfile() %>" alt="프로필사진">
                </div>
                <div id="userinfo-name" class="mt-2 mb-4">
                    <p><%=memBean.getMem_name() %></p>
                    <a href="#"><i class="fas fa-bell"> 0</i></a>
                </div>

                <div id="userinfo-btn" class="btn-group mb-3" role="group">
                    <button type="button" class="btn" onclick="location.href='../contents/MyPage.jsp'">내 서재</button>
                    <button type="button" class="btn ml-3" onclick="location.href='LogoutProc.jsp'">로그아웃</button>
                </div>
            </div>
            <div class="col-xs-9" style="width: 850px;">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#reading" role="tab">읽는 중인 책</a></li>
                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#read" role="tab">읽은 책</a></li>
                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#wish" role="tab">읽고 싶은 책</a></li>
                </ul>

                <div class="tab-content" style="background: #fff;">
                    <div class="tab-pane fade show active p-5" id="reading" role="tabpanel" aria-labelledby="readingList-tab">
                        <p>현재 대출 중인 책 : <%=loaning %></p>
                        <hr>
                        <div class="container">
                            <div class="row mt-5 ml-5 mr-5">
                                <div class="book col-4">
                                    <a class="thumbnail_image shadow" href="#">
                                        <img class="thumbnail" src="<%=new BucketManager().base64DownLoader(loanImage[0])%>" alt="<%=loanId[0] %>">
                                        <span class="border"></span>
                                    </a>
                                </div>
                                <div class="col-4 book">
                                    <a class="thumbnail_image shadow" href="#">
                                        <img class="thumbnail" src="<%=new BucketManager().base64DownLoader(loanImage[1])%>" alt="<%=loanId[1] %>">
                                        <span class="border"></span>
                                    </a>
                                </div>
                                <div class="col-4 book">
                                    <a class="thumbnail_image shadow" href="#">
                                        <img class="thumbnail" src="<%=new BucketManager().base64DownLoader(loanImage[2])%>" alt="<%=loanId[2] %>">
                                        <span class="border"></span>
                                    </a>
                                </div>
                            </div>
                            <div class="row mb-4 ml-4 mr-4">
                                <div class="rounded shelf shadow btom"></div>
                            </div>
                        </div>
                        <button class="btn btn-sm btn-outline-secondary float-right" type="button" onclick="">더보기</button>
                    </div>
                    <div class="tab-pane fade p-5" id="read" role="tabpanel" aria-labelledby="readList-tab">
                        <p>지금까지 읽은 책 : <%=loaned %></p>
                        <hr>
                        <div class="container">
                            <div class="row mt-5 ml-5 mr-5">
                                <div class="book col-4">
                                    <a class="thumbnail_image shadow" href="#">
                                        <img class="thumbnail" src="<%=new BucketManager().base64DownLoader(returnImage[0])%>" alt="<%=returnId[0] %>">
                                        <span class="border"></span>
                                    </a>
                                </div>
                                <div class="col-4 book">
                                    <a class="thumbnail_image shadow" href="#">
                                        <img class="thumbnail" src="<%=new BucketManager().base64DownLoader(returnImage[1])%>" alt="<%=returnId[1] %>">
                                        <span class="border"></span>
                                    </a>
                                </div>
                                <div class="col-4 book">
                                    <a class="thumbnail_image shadow" href="#">
                                        <img class="thumbnail" src="<%=new BucketManager().base64DownLoader(returnImage[2])%>" alt="<%=returnId[2] %>">
                                        <span class="border"></span>
                                    </a>
                                </div>
                            </div>
                            <div class="row mb-4 ml-4 mr-4">
                                <div class="rounded shelf shadow btom"></div>
                            </div>
                        </div>
                        <button class="btn btn-sm btn-outline-secondary float-right" type="button" onclick="">더보기</button>
                    </div>
                    <div class="tab-pane fade p-5" id="wish" role="tabpanel" aria-labelledby="wishList-tab">
                        <p>관심도서 : <%=watch %></p>
                        <hr>
                        <div class="container">
                            <div class="row mt-5 ml-5 mr-5">
                                <div class="book col-4">
                                    <a class="thumbnail_image shadow" href="#">
                                        <img class="thumbnail" src="<%=new BucketManager().base64DownLoader(watchImage[0])%>" alt="<%=watchId[0] %>">
                                        <span class="border"></span>
                                    </a>
                                </div>
                                <div class="col-4 book">
                                    <a class="thumbnail_image shadow" href="#">
                                        <img class="thumbnail" src="<%=new BucketManager().base64DownLoader(watchImage[1])%>" alt="<%=watchId[1] %>">
                                        <span class="border"></span>
                                    </a>
                                </div>
                                <div class="col-4 book">
                                    <a class="thumbnail_image shadow" href="#">
                                        <img class="thumbnail" src="<%=new BucketManager().base64DownLoader(watchImage[2])%>" alt="<%=watchId[2] %>">
                                        <span class="border"></span>
                                    </a>
                                </div>
                            </div>
                            <div class="row mb-4 ml-4 mr-4">
                                <div class="rounded shelf shadow btom"></div>
                            </div>
                        </div>
                        <button class="btn btn-sm btn-outline-secondary float-right" type="button" onclick="">더보기</button>
                    </div>
                </div>
            </div>
        </div>
        <%}
		%>
        <div class="row justify-content-md-center cv">
            <div id="calendar-view" class="col-xs-4 pt-5 mr-5" style="width: 450px"> <!--  style="width: 350px;" -->
                <jsp:include page="/Calendar.jsp" flush="false">
                	<jsp:param value="widget" name="view"/>
                </jsp:include>
            </div>

            <div class="col-xs-9" style="width: 800px;">
                <div class="row justify-content-md-center" id="qmenu">
                    <ul id="quick-menu" class="pt-5">
                        <li id="qitem1"><a href="#"><i class="fas fa-comment quick-menu-icon shadow-sm"></i><br>자주
                                묻는 질문</a></li>
                        <li id="qitem2"><a href="#"><i class="fas fa-info quick-menu-icon shadow-sm"></i><br>도서관
                                안내</a></li>
                        <li id="qitem3"><a href="#"><i class="fas fa-door-open quick-menu-icon shadow-sm"></i><br>시설대여</a></li>
                        <li id="qitem4"><a href="contents/WishBook.jsp"><i class="fas fa-book-open quick-menu-icon shadow-sm"></i><br>희망도서신청</a></li>
                    </ul>
                </div>
                <div class="row">
                    <div class="col" id="forumup"> <!-- col-xl-7 -->
                        <hr class="shadow-sm">
                        <div class="forum" id="forum">
                            <h1 class="menu-title">공지사항</h1>
                            <a class="fas fa-plus float-right" href="NoticeBoard.jsp"></a>
                            <%
                            	Vector vNotice = noticeMgr.getNoticeList5();
                            
                            %>
                            <table class="table table-striped table-hover table-notice-board">
                                <tbody>
                                <%for(int i = 0; i<vNotice.size(); i++){
                                	NoticeBean notBean = (NoticeBean)vNotice.get(i);
                                	String notice_date = notBean.getDate();
                                	
                                %>
                                    <tr>
                                        <td style="width: 10%"><%=i+1 %></td>
                                        <td style="width: 70%; cursor:pointer;" onClick="location.href='NoticeDetail.jsp?notice_id=<%=notBean.getNum()%>'"><%=notBean.getName() %></td>
                                        <td style="width: 20%"><%=notice_date.substring(0, 10) %></td>
                                    </tr>
                                <%}%>
                                 
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<jsp:include page="/Footer.jsp" flush="false" />
	<%
	if(mem_id!=null){
	%>	
		<div class="remove-modal">
			<jsp:include page="/contents/noticeModal.jsp" flush="false" />
		</div>
		<script>
		$("#myModal").modal();
		</script>
	<%
	}
	%>
</body>
</html>
