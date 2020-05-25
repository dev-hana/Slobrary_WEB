<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
a{
  text-decoration :none;
  color : #042759;
 }
a:hover{color : #1E90FF;}
li{
  display : inline;
  border-left : 1px solid #999;
  font: bold 20px Dotum;
  padding : 0 50px;
}
#index{
  padding-top : 10px;
}
ul li:first-child{border-left :none;}
</style>

<div style="text-align:center;">
	<ul id="index">
          <li><a href="NoticeAll.jsp" >전체공지</a></li>
          <li><a href="NoticeMine.jsp" >나의공지</a></li>
          <li><a href="NoticeWrite.jsp" >등록</a></li>
      </ul>
</div>
