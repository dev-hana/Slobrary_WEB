<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서등록</title>
<style>
table.type03 {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
  margin : 20px 10px;
}
table.type03 th {
    width: 147px;
    padding: 30px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;

}
table.type03 td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
.btn {background-color:#042759;font-weight:bold;color:#FFFFFF;border: none;border-radius:5px;}
input[type=text]{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
</style>
</head>
<body>
<%@ include file="Top.jsp" %> 
<%@ include file="Bookside.jsp" %>

<form name="redForm" method="post" action="BookRegProc.jsp" enctype="multipart/form-data">
<table class="type03" style="margin-left:auto; margin-right:auto;">
    <tr>
        <th scope="row">등록번호</th>
        <td><input type="text" name="id_num" placeholder="예: ED3211"></td>
    </tr>
     <tr>
        <th scope="row">자료유형</th>
        <td><input type="text" name="type" placeholder="예: 단행본"></td>
    </tr>
     <tr>
        <th scope="row">도서 이름</th>
        <td><input type="text" name="name" placeholder="도서 이름을 입력하세요"></td>
    </tr>
     <tr>
        <th scope="row">저자</th>
        <td><input type="text" name="author" placeholder="작가 이름을 입력하세요"></td>
    </tr>
     <tr>
        <th scope="row">출판사</th>
        <td><input type="text" name="publisher" placeholder="출판사를 입력하세요"></td>
    </tr>
    <tr>
        <th scope="row">발행사항</th>
        <td><input type="text" name="issue" placeholder="예: 서울: 이후, 2002. "></td>
    </tr>
    <tr>
        <th scope="row">형태사항</th>
        <td><input type="text" name="form" placeholder="127 p, ; 21nm."></td>
    </tr>
     <tr>
        <th scope="row">ISBN</th>
        <td><input type="text" name="isbn" placeholder="ISBN"></td>
    </tr>
     <tr>
        <th scope="row">분류기호</th>
        <td><input type="text" name="class_id" placeholder="180"></td>
    </tr>
     <tr>
        <th scope="row">언어</th>
        <td><input type="text" name="language" placeholder="한국어"></td>
    </tr>
     <tr>
        <th scope="row">소장처</th>
        <td><input type="text" name="collector" placeholder="도서관/../"></td>
    </tr>
     <tr>
        <th scope="row">청구기호</th>
        <td><input type="text" name="sign" placeholder="183.4 나821ㅁ"></td>
    </tr>
     <tr>
        <th scope="row">도서상태</th>
        <td><input type="text" name="status" placeholder="예약중"></td>
    </tr>
     <tr>
        <th scope="row">이미지</th>
        <td>
        <input style="padding:30px;" type="file" name="image">
        </td>
    </tr>
</table>
<div style="text-align:center;">
<input type="submit" class="btn" value="추가">
</div>
</form>
</body>
</html>