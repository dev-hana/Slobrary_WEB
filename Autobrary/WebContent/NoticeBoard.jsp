<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=1">
    <title>Slobrary - 공지사항</title>
     <jsp:include page="CND.jsp" flush="false"/>
<style>
        * {
    font-family: 'Noto Sans KR', sans-serif;
}
        .wrapper {
            display: flex;
            width: 100%;
            align-items: stretch;
        }

        #sidebar {
            min-width: 250px;
            max-width: 250px;
            background: #866ec7;
            color: #fff;
            transition: all .3s;
            position: relative;
        }
        
        .sidebar-header {
        }
        
        .sidebar-menu li{
            padding: 10px 0px;
            font-size: 1.2em;
        }
        
        .sidebar-menu li a {
            color: #fff;
            text-decoration: none;
        }
        
        #content {
            width: 100%;
            padding: 10px 20px;
        }
        
        .table-notice-board {
        }
        
        .table-notice-board th:nth-child(2){
            width: 70%;
        }
    </style>
</head>

<body>
	<header>
    <jsp:include page="Top.jsp" flush="false"/>
    </header>
    <div id="body-main" class="p-4">
        <div class="container">
    <div class="wrapper">
        <nav id="sidebar" class="mt-5 p-4 pt-5">
            <div class="sidebar-header mb-5">
                <h1>안내사항</h1>
            </div>
            <ul class="sidebar-menu list-unstyled components mb-5">
                <li class="active"><a href="#">공지사항</a></li>
                <li><a href="#">도서관 일정</a></li>
            </ul>
        </nav>
        <div id="content">
        	<div class="mt-5 pt-2">
                <h3>공지사항</h3>
            </div>
            <table class="table table-striped table-hover table-notice-board">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>날짜</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>오늘의 공지사항</td>
                        <td>2020.04.17</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>오늘의 공지사항</td>
                        <td>2020.04.17</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>오늘의 공지사항</td>
                        <td>2020.04.17</td>
                        <td>0</td>
                    </tr>
                </tbody>
            </table>
            </div>
            </div>
        </div>
    </div>
</body>
</html>