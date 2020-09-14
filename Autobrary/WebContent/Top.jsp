<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memMgr" class="database.MemMgr" />
<%
String mem_id = (String)session.getAttribute("loginKey");
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=1">
	<title>Slobrary</title>
	<link href="/css/top.css" rel="stylesheet">
	<!-- 웹폰트 -->
	<link href="https://fonts.googleapis.com/css?family=Major+Mono+Display&display=swap" rel="stylesheet">
	<jsp:include page="/CND.jsp" flush="false" />
			
</head>

<body>
    <header>
        <div class="logo_aria">
            <a href="/" class="logo">
                <h1>sloBrArY</h1>
            </a>

            <form method="get" action="" class="search_bar">
                <i class="fas fa-search" aria-hidden="true"></i>
                <input type="text">
            </form>
        </div>

        <nav class="main_nav">
            <a href="/" class="logo_sticky sr-only">
                sloBrArY
            </a>
            <ul>
                <li class="dropdown">
                    <a href="#" class="dropdown-btn">
                      	도서검색
                        <i class="fas fa-sort-down" aria-hidden="true"></i>
                    </a>
                    <ul class="dropdown-content">
                        <li>
                            <a href="/contents/SearchPage.jsp">
                                	도서검색
                            </a>
                        </li>
                        <li>
                            <a href="/contents/SearchPage.jsp?contentPage=BookList.jsp?type=best">
                                	베스트셀러
                            </a>
                        </li>
                        <li>
                            <a href="/contents/SearchPage.jsp?contentPage=BookList.jsp?type=new">
                                	신간도서
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-btn">
                        	안내사항
                        <i class="fas fa-sort-down" aria-hidden="true"></i>
                    </a>
                    <ul class="dropdown-content">
                        <li>
                            <a href="/NoticeBoard.jsp">
                                	공지사항
                            </a>
                        </li>
                        <li>
                            <a href="/CalendarPage.jsp">
                                	도서관 일정
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-btn">
                        	도서관 서비스
                        <i class="fas fa-sort-down" aria-hidden="true"></i>
                    </a>
                    <ul class="dropdown-content">
                        <li>
                            <a href="/contents/WishBookPage.jsp">
                                	희망 도서
                            </a>
                        </li>
                        <li>
                            <a href="" class="btn disabled">
                                	문화 행사
                            </a>
                        </li>
                        <li>
                            <a href="" class="btn disabled">
                                	시설 이용
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-btn">
                        	커뮤니티
                        <i class="fas fa-sort-down" aria-hidden="true"></i>
                    </a>
                    <ul class="dropdown-content">
                        <li>
                            <a href="/contents/community/ReviewPage.jsp">
                                	도서 별점
                            </a>
                        </li>
                        <li>
                            <a href="/contents/community/BookDiaryPage.jsp">
                                	독서 일기
                            </a>
                        </li>
                        <li>
                            <a href="/contents/community/BookReportPage.jsp">
                                	독후감
                            </a>
                        </li>
                        <li>
                            <a href="/contents/community/CommunityPage.jsp">
                                	자유 게시판
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-btn">
                        	이용안내
                        <i class="fas fa-sort-down" aria-hidden="true"></i>
                    </a>
                    <ul class="dropdown-content">
                        <li>
                            <a href="/html/infoPage.html">
                                	도서관 소개
                            </a>
                        </li>
                        <li>
                            <a href="/contents/QnAPage.jsp">
                                	자주 묻는 질문
                            </a>
                        </li>
                    </ul>
                </li>
        <%
            if(mem_id == null) {
        %>
                <li>
                    <a href="/Login.jsp">로그인</a>
                </li>
                <li>
                    <a href="/Signup.jsp">회원가입</a>
                </li>
        <%
            } else {
        %>
                <li>
                    <a href="/contents/MyPage.jsp">마이페이지</a>
                </li>
                <li>
                    <a href="/LogoutProc.jsp">로그아웃</a>
                </li>
        <%
            }
        %>
                <li class="mobile mobile_menu">
                    <button type="button" onclick="mobileMenuClickHandler()">
                        <i class="fa fa-bars"></i>
                    </button>
                </li>
            </ul>
        </nav>
    </header>

    <script>
        var navbar = document.querySelector(".main_nav");
        var logo = document.querySelector(".logo_sticky");
        var sticky = navbar.offsetTop;

        function scrollHandler() {
            if (window.pageYOffset >= sticky) {
                navbar.classList.add("sticky")
                logo.classList.remove("sr-only");
            } else {
                navbar.classList.remove("sticky");
                logo.classList.add("sr-only");
            }
        }

        function mobileMenuClickHandler() {
            if ($('.main_nav').hasClass('responsive')) {
                navbar.classList.remove("responsive");
            } else {
                navbar.classList.add("responsive");
            }
        }

        window.addEventListener("scroll", scrollHandler);
    </script>
</body>
</html>