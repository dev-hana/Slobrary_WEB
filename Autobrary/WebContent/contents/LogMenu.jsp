<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CND.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
  font-family: 'Open Sans', sans-serif;
  font-weight: 300;
}
#tab-button {
  table-layout: fixed;
  width: 100%;
  margin: 0;
  padding: 0;
  list-style: none;
}
#tab-button li {
  display: table-cell;
  width: 20%;
}
#tab-button li a {
  display: block;
  padding: .5em;
  background: #eee;
  border: 1px solid #ddd;
  text-align: center;
  color: #000;
  text-decoration: none;
}
#tab-button li:not(:first-child) a {
  border-left: none;
}
#tab-button li a:hover,
#tab-button .is-active a {
  border-bottom-color: transparent;
  background: #fff;
}

.tab-button-outer {
  display: none;
}
.tab-contents {
  margin-top: 20px;
}
@media screen and (min-width: 76px) {
  .tab-button-outer {
    position: relative;
    z-index: 2;
    display: block;
  }
  .active, .a:hover {
  border-bottom-color: transparent;
  background: #fff;
}
}
</style>
</head>
<body>

  <div class="tab-button-outer">
    <ul class="nav nav-tabs" id="tab-button">
      <li ><a href="MyPage.jsp?CONTENTPAGE=LogList.jsp?type=review">나의 리뷰</a></li>
      <li><a href="MyPage.jsp?CONTENTPAGE=LogList.jsp?type=diary">독서 일기장</a></li>
      <li><a href="#">게시글</a></li>
    </ul>
  </div>

</body>
</html>