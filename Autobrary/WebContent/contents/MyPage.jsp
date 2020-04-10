<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    
    
<title>Insert title here</title>
<style>
.box{
	width: 500px;
	height: 200px;
	float:left;
	margin: 0 auto;
}
.listbox{
	width: 800px;
	height: auto;
}
img{
	width:100px;
	height:100px;
}
.item{
display: inline-block;
}
.b1{
display: inline-block;
}

</style>
</head>
<body>
	<div style="text-align: center">
	<div class="b1">
	<div class="box shadow-sm p-3 mb-5 bg-white rounded">
		<div class="item">
			<img style="margin-bottom: 90px;" class="rounded-circle" src="../img/profile.jpg">
		</div>
		<div class="item" style="text-align: right; margin-left: 90px; margin-top: 20px">
			<table>
				<tr>
					<td>양지현님</td>
				</tr>
				<tr>
					<td>didwlgus@naver.com</td>
				</tr>
				<tr>
					<td><br><button type="submit" class="btn">개인정보수정</button></td>
				</tr>
			</table>
		</div>
		</div>
	</div>
	</div>
	<div>
	<br>
	<div class="container" style="margin: 0 auto;">
      <div class="row">
        <div class="col">
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link text-muted active" data-toggle="tab" href="#">대출도서</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-muted" data-toggle="tab" href="#">연체도서</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-muted" data-toggle="tab" href="#">희망도서</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-muted" data-toggle="tab" href="#">관심도서</a>
              </li>
            </ul>
        </div>
      </div>
    </div>

    <!-- 메뉴 선택시 출력화면 -->
    <div id="contentPage">
    	
    </div>
    </div>
</body>
</html>