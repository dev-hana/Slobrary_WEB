<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>
<jsp:useBean id="memMgr" class="database.MemMgr" />
<jsp:useBean id="loanMgr" class="database.LoanMgr" />
<jsp:useBean id="watchMgr" class="database.WatchMgr" />
<%
String mem_id = (String)session.getAttribute("loginKey");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Slobrary</title>
    <link href="css/index.css?v=5" rel="stylesheet">
	<%@ include file="/CND.jsp" %>
</head>
<body class="bg-light">
    <header>
    <jsp:include page="Top.jsp" flush="false"/>
    </header>
    <div id="body-main" class="p-4">
        <div class="container">
            <div class="row justify-content-md-center">
           <%
          	
 				if(mem_id == null) {
 					%><div id="userinfo" class="col-xs-3 p-0 pt-4 pb-4"></div><%
 				}
 	
 				else {				
 					MemBean memBean = memMgr.getMember(mem_id);
 					String loaning = loanMgr.countLoaning(mem_id);
 					String loaned = loanMgr.countLoaned(mem_id);
 					String watch = watchMgr.countWatch(mem_id);
 			 %>
  
  				<div id="userinfo" class="col-xs-3 p-0 pt-4 pb-4">
                    <div class='bg-white rounded  shadow'>
                        <div id="userinfo-status" class="p-4 mb-3">
                            <p><span id="status-emoji">🤔</span><br>
                                <span>'책이름'</span> 외 <span>n</span>권<br>
                                연체까지 <span>0</span>일 남았어요!</p><br>
                        </div>
                        <div class="img-wrapper">
                            <img id="userinfo-img" class="img-cover" src="img/default/userImg/girl1.png" alt="프로필사진">
                        </div>
                        <div class="row mb-3 mt-4 pl-3 pr-3">
                            <div class="mt-4" style="width: 100%; text-align: center;">
                                <div id="userinfo-name" class="mt-2 mb-2">
                                    <p><%=memBean.getMem_name() %></p>
                                    <i class="fas fa-bell"> 0</i>
                                </div>
                                <div id="userinfo-btn" class="btn-group mb-3" role="group">
                                    <button type="button" class="btn" onclick="location.href='../contents/MyPage.jsp'">내 서재</button>
                                    <button type="button" class="btn ml-3"  onclick="location.href='LogoutProc.jsp'">로그아웃</button>
                                </div>
                            </div>
                        </div>

                        <div id="userinfo-history" class="row pl-3 pr-3">
                            <div class="col">
                                <p>읽는 중</p>
                                <p id="history-reading" class="history-num"><%=loaning %></p>
                            </div>
                            <div class="col">
                                <p>읽은 책</p>
                                <p id="history-read" class="history-num"><%=loaned %></p>
                            </div>
                            <div class="col">
                                <p>읽고싶어요</p>
                                <p id="history-wish" class="history-num"><%=watch %></p>
                            </div>
                        </div>
                    </div>
                </div>
  <%}%>
             <div id="carousel" class="col-xs-9 ml-5 carousel slide carousel-fade" data-ride="carousel" data-interval="6000">
        <ol class="carousel-indicators">
            <li data-target="#carousel" data-slide-to="0" class="active"></li>
            <li data-target="#carousel" data-slide-to="1"></li>
            <li data-target="#carousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <!-- 신간도서 -->
            <div class="carousel-item active">
                <div class="bookshelf container">
                    <div class="row">
                        <div class="book col-4">
                            <a class="thumbnail_image shadow" href="#">
                                <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="신간 1">
                                <span class="border"></span>
                            </a>
                        </div>
                        <div class="col-4 book">
                            <a class="thumbnail_image shadow" href="#">
                                <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="신간 2">
                                <span class="border"></span>
                            </a>
                        </div>
                        <div class="col-4 book">
                            <a class="thumbnail_image shadow" href="#">
                                <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="신간 3">
                                <span class="border"></span>
                            </a>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="rounded shelf shadow"></div>
                    </div>

                    <div class="row">
                        <div class="book col-4">
                            <a class="thumbnail_image shadow" href="#">
                                <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="신간 4">
                                <span class="border"></span>
                            </a>
                        </div>
                        <div class="col-4 book">
                            <a class="thumbnail_image shadow" href="#">
                                <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="신간 5">
                                <span class="border"></span>
                            </a>
                        </div>
                        <div class="col-4 book">
                            <a class="thumbnail_image shadow" href="#">
                                <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="신간 6">
                                <span class="border"></span>
                            </a>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="rounded shelf shadow"></div>
                    </div>
                </div>

                <div class="carousel-caption">
                    <div>
                        <h2>NEW</h2>
                        <p>We meticously build each site to get results</p>
                        <span class="btn btn-sm btn-outline-secondary">Learn More</span>
                    </div>
                </div>
            </div>
            <!-- 베스트셀러 -->
            <div class="carousel-item">
                <div class="bookshelf container">
                    <div class="row">
                        <div class="book col-4">
                            <a class="thumbnail_image shadow" href="#">
                                <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="베스트 1">
                                <span class="border"></span>
                            </a>
                        </div>
                        <div class="col-4 book">
                            <a class="thumbnail_image shadow" href="#">
                                <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="베스트 2">
                                <span class="border"></span>
                            </a>
                        </div>
                        <div class="col-4 book">
                            <a class="thumbnail_image shadow" href="#">
                                <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="베스트 3">
                                <span class="border"></span>
                            </a>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="rounded shelf shadow"></div>
                    </div>

                    <div class="row">
                        <div class="book col-4">
                            <a class="thumbnail_image shadow" href="#">
                                <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="베스트 4">
                                <span class="border"></span>
                            </a>
                        </div>
                        <div class="col-4 book">
                            <a class="thumbnail_image shadow" href="#">
                                <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="베스트 5">
                                <span class="border"></span>
                            </a>
                        </div>
                        <div class="col-4 book">
                            <a class="thumbnail_image shadow" href="#">
                                <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="베스트 6">
                                <span class="border"></span>
                            </a>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="rounded shelf shadow"></div>
                    </div>
                </div>

                <div class="carousel-caption">
                    <div>
                        <h2>BestSeller</h2>
                        <p>We meticously build each site to get results</p>
                        <span class="btn btn-sm btn-outline-secondary">Learn More</span>
                    </div>
                </div>
            </div>
            <!-- 오늘의 추천 책 -->
            <div class="carousel-item">
                <div class="bookshelf container">
                    <div class="row">
                        <div class="book col-4">
                            <a class="thumbnail_image shadow" href="#">
                                <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="추천 1">
                                <span class="border"></span>
                            </a>
                        </div>
                        <div class="col-4 book">
                            <a class="thumbnail_image shadow" href="#">
                                <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="추천 2">
                                <span class="border"></span>
                            </a>
                        </div>
                        <div class="col-4 book">
                            <a class="thumbnail_image shadow" href="#">
                                <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="추천 3">
                                <span class="border"></span>
                            </a>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="rounded shelf shadow"></div>
                    </div>

                    <div class="row">
                        <div class="book col-4">
                            <a class="thumbnail_image shadow" href="#">
                                <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="추천 4">
                                <span class="border"></span>
                            </a>
                        </div>
                        <div class="col-4 book">
                            <a class="thumbnail_image shadow" href="#">
                                <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="추천 5">
                                <span class="border"></span>
                            </a>
                        </div>
                        <div class="col-4 book">
                            <a class="thumbnail_image shadow" href="#">
                                <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="추천 6">
                                <span class="border"></span>
                            </a>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="rounded shelf shadow"></div>
                    </div>
                </div>

                <div class="carousel-caption">
                    <div>
                        <h2>Today's Pick</h2>
                        <p>We meticously build each site to get results</p>
                        <span class="btn btn-sm btn-outline-secondary">Learn More</span>
                    </div>
                </div>
            </div>
            <!-- /.carousel-item -->
        </div>
        <!-- /.carousel-inner -->
        <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div> 
    </div>
    </div>
    </div>

	<div id="body-sub" class="container pl-5 pr-5 mb-5">
    	<div class="row justify-content-md-center">
        	<div id="calendar-view" class="col-xs-3" style="width:350px;">
            	<jsp:include page="/Calendar.jsp" flush="false"/>
        	</div>

        	<div class="col-xs-9 pl-5" style="width:850px;">
            	<div class="row justify-content-md-center">
            		<ul id="quick-menu">
                		<li><a href="#"><i class="fas fa-comment quick-menu-icon shadow-sm"></i><br>자주 묻는 질문</a></li>
                		<li><a href="#"><i class="fas fa-info quick-menu-icon shadow-sm"></i><br>도서관 안내</a></li>
                		<li><a href="#"><i class="fas fa-door-open quick-menu-icon shadow-sm"></i><br>시설대여</a></li>
                		<li><a href="#"><i class="fas fa-book-open quick-menu-icon shadow-sm"></i><br>희망도서신청</a></li>
            		</ul>
            	</div>
        		<div class="row">
            		<div class="col">
                		<hr class="shadow-sm">
                		<div class="forum">
                			<h1 class="menu-title">공지사항</h1>
                			<a class="fas fa-plus float-right" href="#"></a>
                    		<table class="table table-striped table-hover table-notice-board">
                				<tbody>
      								<tr>
       				 					<td style="width: 10%">1</td>
        								<td  style="width: 70%">오늘의 공지사항</td>
        								<td style="width: 20%">2020.04.17</td>
      								</tr>
                    				<tr>
        								<td style="width: 10%">2</td>
        								<td  style="width: 70%">오늘의 공지사항</td>
        								<td style="width: 20%">2020.04.17</td>
      								</tr>
                  			  		<tr>
        								<td style="width: 10%">3</td>
        								<td  style="width: 70%">오늘의 공지사항</td>
        								<td style="width: 20%">2020.04.17</td>
      								</tr>
      								<tr>
        								<td style="width: 10%">4</td>
        								<td  style="width: 70%">오늘의 공지사항</td>
        								<td style="width: 20%">2020.04.17</td>
      								</tr>
      								<tr>
        								<td style="width: 10%">5</td>
        								<td  style="width: 70%">오늘의 공지사항</td>
        								<td style="width: 20%">2020.04.17</td>
      								</tr>
                       			</tbody>
                    		</table>
                		</div>
            		</div>
        		</div>
       	 	</div>
    	</div>
    </div>
    
    <jsp:include page="/Footer.jsp" flush="false"/>
</body>
</html>
