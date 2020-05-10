<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, database.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=1">
    <title>Slobrary</title>
    <link href="css/index.css?v=4" rel="stylesheet">
	<jsp:include page="/CND.jsp" flush="false"/>
    
    <script>
        //달력 https://jerryjerryjerry.tistory.com/26
        var today = new Date();
        var date = new Date();

        function prevCalendar() {
            today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
            buildCalendar();
        }

        function nextCalendar() {
            today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
            buildCalendar();
        }

        function buildCalendar() {
            var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
            var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
            var tbCalendar = document.getElementById("calendar");
            var tbCalendarYM = document.getElementById("tbCalendarYM");
            tbCalendarYM.innerHTML = (today.getMonth() + 1) + "월 도서관 일정"; //today.getFullYear() + "년 " 


            while (tbCalendar.rows.length > 2) {
                tbCalendar.deleteRow(tbCalendar.rows.length - 1);
            }
            var row = null;
            row = tbCalendar.insertRow();
            var cnt = 0;
            for (i = 0; i < doMonth.getDay(); i++) {
                cell = row.insertCell();
                cnt = cnt + 1;
            }
            /*달력 출력*/
            for (i = 1; i <= lastDate.getDate(); i++) {
                cell = row.insertCell();
                cell.innerHTML = i;
                cnt = cnt + 1;
                if (cnt % 7 == 1) {
                    cell.innerHTML = "<font color=#ee5522>" + i //일요일 표시 색
                }
                if (cnt % 7 == 0) {
                    cell.innerHTML = "<font color=#226dee>" + i //토요일 표시 색
                    row = calendar.insertRow();
                }
                if (today.getFullYear() == date.getFullYear() &&
                    today.getMonth() == date.getMonth() &&
                    i == date.getDate()) {
                    cell.bgColor = "#FAF58C"; //오늘 날짜 표시 색
                }
            }
        }
    </script>
</head>
<body class="bg-light">
    <header>
    <jsp:include page="Top.jsp" flush="false"/>
    </header>
    <div id="body-main" class="p-4">
        <div class="container">
            <div class="row justify-content-md-center">
           <%@ include file="MemberInfo.jsp" %>
                <div data-ride="carousel" class="col-md-8 ml-5 carousel slide carousel-fade" id="carousel-bookshelf">
                    <ol class="carousel-indicators">
                        <li class="active" data-slide-to="0" data-target="#carousel-bookshelf"></li>
                        <li data-slide-to="1" data-target="#carousel-bookshelf"></li>
                        <li data-slide-to="2" data-target="#carousel-bookshelf"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div id="bookshelf-today" class="col bookshelf">
                                <p id="bookshelf-title">todAy's pick</p>
                                <div class="row bookshelf-level">
                                    <div class="col">
                                        <div class="thumbnail_image shadow">
                                            <img class="thumbnail" src="img/main-ex/bookcover.jpg" alt="오늘의 추천 책">
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="thumbnail_image shadow">
                                            <img class="thumbnail" src="img/main-ex/bookcover.jpg" alt="오늘의 추천 책">
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="thumbnail_image shadow">
                                            <img class="thumbnail" src="img/main-ex/bookcover.jpg" alt="오늘의 추천 책">
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="row rounded shelf shadow">
                                    </div>
                                </div>
                                <div class="row bookshelf-level">
                                    <div class="col">
                                        <div class="thumbnail_image shadow">
                                            <img class="thumbnail" src="img/main-ex/bookcover.jpg" alt="오늘의 추천 책">
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="thumbnail_image shadow">
                                            <img class="thumbnail" src="img/main-ex/bookcover.jpg" alt="오늘의 추천 책">
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="thumbnail_image shadow">
                                            <img class="thumbnail" src="img/main-ex/bookcover.jpg" alt="오늘의 추천 책">
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="row rounded shelf shadow">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="col bookshelf">
                                <p id="bookshelf-title">bestseller</p>
                                <div class="row bookshelf-level">
                                    <div class="col">
                                        <div class="thumbnail_image shadow">
                                            <img class="thumbnail" src="img/main-ex/bookcover2.jpg" alt="오늘의 추천 책">
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="thumbnail_image shadow">
                                            <img class="thumbnail" src="img/main-ex/bookcover2.jpg" alt="오늘의 추천 책">
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="thumbnail_image shadow">
                                            <img class="thumbnail" src="img/main-ex/bookcover2.jpg" alt="오늘의 추천 책">
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="row rounded shelf shadow">
                                    </div>
                                </div>
                                <div class="row bookshelf-level">
                                    <div class="col">
                                        <div class="thumbnail_image shadow">
                                            <img class="thumbnail" src="img/main-ex/bookcover2.jpg" alt="오늘의 추천 책">
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="thumbnail_image shadow">
                                            <img class="thumbnail" src="img/main-ex/bookcover2.jpg" alt="오늘의 추천 책">
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="thumbnail_image shadow">
                                            <img class="thumbnail" src="img/main-ex/bookcover2.jpg" alt="오늘의 추천 책">
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="row rounded shelf shadow">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="col bookshelf">
                                <p id="bookshelf-title">new</p>
                                <div class="row bookshelf-level">
                                    <div class="col">
                                        <div class="thumbnail_image shadow">
                                            <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="오늘의 추천 책">
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="thumbnail_image shadow">
                                            <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="오늘의 추천 책">
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="thumbnail_image shadow">
                                            <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="오늘의 추천 책">
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="row rounded shelf shadow">
                                    </div>
                                </div>
                                <div class="row bookshelf-level">
                                    <div class="col">
                                        <div class="thumbnail_image shadow">
                                            <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="오늘의 추천 책">
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="thumbnail_image shadow">
                                            <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="오늘의 추천 책">
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="thumbnail_image shadow">
                                            <img class="thumbnail" src="img/main-ex/bookcover3.jpg" alt="오늘의 추천 책">
                                            <span class="border"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="row rounded shelf shadow">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <a data-slide="prev" role="button" href="#carousel-bookshelf" class="carousel-control-prev">
                        <span aria-hidden="true" class="carousel-control-prev-icon"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a data-slide="next" role="button" href="#carousel-bookshelf" class="right carousel-control-next">
                        <span aria-hidden="true" class="carousel-control-next-icon"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>

            </div>
        </div>
    </div>

    <div id="body-sub" class="row justify-content-md-center">
        <div id="calendar-view" class="col-md-3 p-0">
            <table id="calendar" class="table table-borderless shadow-sm">
                <thead class="shadow-sm">
                    <tr>
                        <td><label onclick="prevCalendar()"><i class="fas fa-chevron-left"></i></label></td>
                        <td align="center" id="tbCalendarYM" colspan="5">
                            yyyy년 m월</td>
                        <td><label onclick="nextCalendar()"><i class="fas fa-chevron-right"></i>

                            </label></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td align="center">일</td>
                        <td align="center">월</td>
                        <td align="center">화</td>
                        <td align="center">수</td>
                        <td align="center">목</td>
                        <td align="center">금</td>
                        <td align="center">토</td>
                    </tr>
                    <script language="javascript" type="text/javascript">
                        buildCalendar();
                    </script>
                    <tr id="calendar-caption">
                        <td colspan="7">오늘 휴관일 행사일</td>
                    </tr>
                </tbody>

            </table>
        </div>

        <div class="col-md-6">
            <div class="row m-auto">
            <ul id="quick-menu">
                <li><i class="fas fa-comment quick-menu-icon shadow-sm"></i><br>자주 묻는 질문</li>
                <li><i class="fas fa-info quick-menu-icon shadow-sm"></i><br>도서관 안내</li>
                <li><i class="fas fa-door-open quick-menu-icon shadow-sm"></i><br>시설대여</li>
                <li><i class="fas fa-book-open quick-menu-icon shadow-sm"></i><br>희망도서신청</li>
            </ul>
            </div>
        <div class="row">
            <div class="col">
                <hr class="shadow-sm">
                <div class="forum">
                <p class="menu-title">공지사항 <i class="fas fa-plus float-right"></i></p>
                    <table class="table">
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
                        </tbody>
                    </table>
                </div>
                
            </div>
        </div>
        </div>
    </div>
</body>
</html>s
