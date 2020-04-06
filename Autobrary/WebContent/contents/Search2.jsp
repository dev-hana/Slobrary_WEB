<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Select-Boxes</title>
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Lato|Quicksand'>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css'>
<link rel="stylesheet" href="../css/Search2.css"> 
<link href="../html/index.css" rel="stylesheet">

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="author" content="colorlib.com">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,600,700" rel="stylesheet" />
    <link href="../css/test.css" rel="stylesheet" />

    <!-- 웹폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400&display=swap&subset=korean" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cinzel+Decorative:900&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script> <!-- 아이콘 라이브러리-->
    <!-- 부트스트랩 4 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    

</head>
<body>
<div>
<form>
<div style="text-align:center">
  <div style="display: inline-block" class="sel sel--black-panther">
  <select name="select-profession" id="select-profession">
  	<option value="" disabled>검색옵션</option>
    <option value="title">도서명</option>
    <option value="author">저자</option>
    <option value="publisher">출판사</option>
  </select>
</div>
	
  <div style="display: inline-block" class="p-2 bg-white rounded rounded-pill shadow-sm mb-4 w-50">
     <div class="input-group">
         <input type="search" placeholder="도서 검색 (책 이름, 작가명, 출판사명)" aria-describedby="button-addon" class="form-control border-0 bg-white">
             <div class="input-group-append">
               <button id="button-addon" type="submit" class="btn btn-link"><i class="fa fa-search"></i></button>
             </div>
         </div>
  </div>
  <jsp:include page="check.jsp" flush="false"/>
</div>


</form>
</div>







 <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
 <script src="../js/Search2.js"></script>

</body>
</html>
