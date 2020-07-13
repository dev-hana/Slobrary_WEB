<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.body {font-family: "Lato", sans-serif;  }
.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #042759;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}
.sidenav a {
    padding: 50px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #FFFFFF;
    display: block;
    transition: 0.3s;
}
.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
<div class="body">
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="Notice.jsp">공지사항</a>
  <a href="WishMgr.jsp">희망도서</a>
  <a href="#">일정</a>
  <a href="Admin.jsp">관리자</a>
</div>

<span style="font-size:30px;cursor:pointer; padding-left:50px;" onclick="openNav()">&#9776; 설정</span>
</div>

<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>
