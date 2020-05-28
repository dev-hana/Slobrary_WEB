<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=1">
    <title>Slobrary - 공지사항</title>
     <%@ include file="/CND.jsp" %>
<style>
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
        	padding-bottom: 10px;
        	border-bottom: 1px solid white;
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
            padding-top: 50px; 
            padding-left: 50px;
        }
        
        #content h1 {
        	font-size: 2em;
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
        <div style="margin: 0px 150px;">
    <div class="wrapper mt-5">
        <nav id="sidebar" class="p-4 pt-5 mr-4">
            <div class="sidebar-header mb-5">
                <h1>안내사항</h1>
            </div>
            <ul class="sidebar-menu list-unstyled components mb-5">
                <li class="active"><a href="#">공지사항</a></li>
                <li><a href="#">도서관 일정</a></li>
            </ul>
        </nav>
        <div id="content">
                <h1 class="mb-4">공지사항</h1>
            <table class="table table-striped table-hover table-notice-board">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>작성자</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>오늘의 공지사항</td>
                        <td>2020.04.17</td>
                        <td>0</td>
                    </tr>
                    <tr onClick="">
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
                    <tr>
                        <td>3</td>
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
            <div class="mt-5" style="margin-left: 250px;">
            <nav aria-label="Page navigation">
            	<ul class="pagination justify-content-center">
            		<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
            		<li class="page-item active"><a class="page-link" href="#">1<span class="sr-only">(current)</span></a></li>
            		<li class="page-item"><a class="page-link" href="#">2</a></li>
            		<li class="page-item"><a class="page-link" href="#">3</a></li>
            		<li class="page-item"><a class="page-link" href="#">다음</a></li>
            	</ul>
            </nav>
            <form class="form-inline justify-content-center">
            	<select class="custom-select">
            		<option value="all" selected>전체</option>
            	</select>
            	<input type="text" class="form-control">
            	<button type="submit" class="btn btn-outline-secondary">검색</button>
            </form>
            </div>
        </div>
</body>
</html>