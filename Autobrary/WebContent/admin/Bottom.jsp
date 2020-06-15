<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>

#footer_nav ul li {
  display:inline;
  list-style-type:none;
  margin:0px 21px;
  padding:0px;
  height:30px;
  cursor:pointer;
}
#footer_nav {margin-left:10px;}

footer p {text-align:center;}

footer > span {margin-left:600px;}

footer {
  clear:both;
  font-size:13px;
  height:140px;
  position:relative;
  top:-50px;
}
#abc {
  float:right;
  padding-right: 300px;
}
#ab{
  color:rgb(4, 39, 89);
}
</style>

<div id="footer_nav" style="margin-top: 140px;">
	<ul>
		<a href=""><li>회사 소개</li></a>
		<a href=""><li>제휴</li></a>
		<a href=""><li>개인정보 보호 정책</li></a>
		<p id='abc'>
			<b>&nbsp ⓒ Copyright </b> <b id='ab'> &nbsp slobrary.com</b>
		</p>
	</ul>
</div>