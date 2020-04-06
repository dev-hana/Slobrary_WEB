<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Stylish HTML Form Checkbox using CSS and Font Awesome</title>
    <meta charset="utf-8">
    <link href="https://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- 그림자 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <style>
    
::-moz-selection {
 background: white;
}

::selection { background: white; }

@-webkit-keyframes 
icon-beat {  0% {
 -webkit-transform: scale(2);
 -ms-transform: scale(2);
 transform: scale(2);
}
 100% {
 -webkit-transform: scale(1);
 -ms-transform: scale(1);
 transform: scale(1);
}
}

span{
	font-size:12px;
}

@keyframes 
icon-beat {  0% {
 -webkit-transform: scale(2);
 -ms-transform: scale(2);
 transform: scale(2);
}
 100% {
 -webkit-transform: scale(1);
 -ms-transform: scale(1);
 transform: scale(1);
}
}

* {
  -webkit-box-sizing: content-box;
  -moz-box-sizing: content-box;
  box-sizing: content-box;
}

label {
  position: relative;
  padding: 0.5rem 1rem;
  line-height: 28px;
  font-weight: normal;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
}

label:last-of-type { margin-right: 1rem; }

label i {
  display: inline-block;
  height: 25px;
  position: relative;
  top: 6px;
  font-style: normal;
  color: #ccc;
}

label span {
  display: inline-block;
  margin-left: 5px;
  line-height: 25px;
  color: gray;
}

input[type="radio"],
input[type="checkbox"] { display: none; }

input[type="radio"] + i:before,
input[type="checkbox"] + i:before {
  font-family: 'FontAwesome';
  font-size: 20px;
  height: 15px;
  width: 15px;
  display: inline-block;
}

input[type="radio"]:checked + i,
input[type="checkbox"]:checked + i {
  position: relative;
  -webkit-animation: icon-beat 0.1s ease;
  animation: icon-beat 0.1s ease;
}

input[type="radio"]:checked + i + span,
input[type="checkbox"]:checked + i + span {
  -webkit-transition: all 0.1s ease;
  transition: all 0.1s ease;
}

input[type="radio"] + i:before { content: "\f10c"; }

input[type="radio"]:checked + i:before { content: "\f111"; }

input[type="radio"]:checked + i + span,
input[type="radio"]:checked + i:before { color: #A593E0; }

input[type="checkbox"] + i:before { content: "\f096"; }

input[type="checkbox"]:checked + i:before { content: "\f046"; }

input[type="checkbox"]:checked + i + span,
input[type="checkbox"]:checked + i:before { color: #A593E0; }

.checktitle{
	border-bottom: 1px solid #A593E0;
	width: 300px;
}
.cbox1{
	height: 150px;
	width: 500px;
	display:inline-block;
}

.cbox2{
	height: 150px;
	width: 250px;
	display:inline-block;
}
</style>
</head>
<body>
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
  <input type="checkbox" name="category" id="check-one" value="역사"/>
  <i></i> <span>역사</span> 
  </label>
  
  </div>
  
  <div class="cbox2 shadow-sm">
  	<span class="checktitle">국내외 분류</span><br>
  	<label>
  	<input type="radio" name="area" value="전체"/>
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
</body>
</html>