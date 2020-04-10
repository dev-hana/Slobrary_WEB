<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Select-Boxes</title>
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Lato|Quicksand'>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css'>
<link rel="stylesheet" href="../css/SearchPage.css"> 
<link href="../html/index.css" rel="stylesheet">

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="author" content="colorlib.com">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,600,700" rel="stylesheet" />
    
    <link href="https://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

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
<form action="SearchResult.jsp" method="post" target="list">
<div style="text-align:center">
  <div style="display: inline-block" class="sel sel--black-panther">
  <select name="keyoption" id="select-profession">
  	<option value="all">검색옵션</option>
  	<option value="all">전체</option>
    <option value="title">도서명</option>
    <option value="author">저자</option>
    <option value="publisher">출판사</option>
  </select>
</div>
	
  <div style="display: inline-block" class="p-2 bg-white rounded rounded-pill shadow-sm mb-4 w-50">
     <div class="input-group">
         <input name="keyword" type="search" placeholder="도서 검색 (책 이름, 작가명, 출판사명)" aria-describedby="button-addon" class="form-control border-0 bg-white">
             <div class="input-group-append">
               <button id="button-addon" onclick="iframeshow()" type="submit" class="btn btn-link"><i class="fa fa-search"></i></button>
             </div>
         </div>
  </div>
  <div style="text-align:center">
  <div class="cbox1 shadow-sm">
  	<span class="checktitle">도서분류</span><br>
  	
  	<label>
  	<input type="checkbox" name="category" value="층류"/>
  	<i></i> <span>층류</span> 
  	</label>
  	
  <label>
  <input type="checkbox" name="category" value="철학"/>
  <i></i> <span>철학</span> 
  </label>
  
  <label>
  <input type="checkbox" name="category" value="종교"/>
  <i></i> <span>종교</span> 
  </label>
  
  <label>
  <input type="checkbox" name="category" value="사회과학"/>
  <i></i> <span>사회과학</span> 
  </label>
  
  <label>
  <input type="checkbox" name="category" value="자연과학"/>
  <i></i> <span>자연과학</span> 
  </label>
  
  <label>
  <input type="checkbox" name="category" value="기술과학"/>
  <i></i> <span>기술과학</span> 
  </label>
  
  <label>
  <input type="checkbox" name="category" value="예술"/>
  <i></i> <span>예술</span> 
  </label>
  
  <label>
  <input type="checkbox" name="category" value="언어"/>
  <i></i> <span>언어</span> 
  </label>
  
  <label>
  <input type="checkbox" name="category" value="문학"/>
  <i></i> <span>문학</span> 
  </label>
  
  <label>
  <input type="checkbox" name="category" value="역사"/>
  <i></i> <span>역사</span> 
  </label>
  
  </div>
  
  <div class="cbox2 shadow-sm">
  	<span class="checktitle">국내외 분류</span><br>
  	<label>
  	<input type="radio" checked="checked" name="area" value="전체"/>
  	<i></i> <span>전체</span>
	</label>
	<label>
  	<input type="radio" name="area" value="국내"/>
  	<i></i><span>국내도서</span>
	</label>
	<label>
  	<input type="radio" name="area" value="국외"/>
  	<i></i><span>국외도서</span>
	</label>
  </div>
  </div>
</div>


</form>
</div>
<br><br>
<iframe id="the_iframe" onload="calcHeight();" name="list" title="도서검색결과" frameborder="0" scrolling="no" style="display:none; overflow-x:hidden; overflow:auto; width:100%;"></iframe>



 <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
 <script src="../js/SearchPage.js"></script>

</body>
</html>
