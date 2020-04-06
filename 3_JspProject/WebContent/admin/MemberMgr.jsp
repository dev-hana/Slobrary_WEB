<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Theme Made By www.w3schools.com -->
    <title>관리자 페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="admin.css">
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
    <%@ include file="Top.jsp" %>
    
    <div class="jumbotron">
        <h1>회 원  관 리</h1>
    </div>
    <input type="text" class="form-control" id="searchID" onkeyup="searchFunction()" placeholder="ID로 검색">
    <div id="contents" class="container-fluid">
        <table id="userInfo" class="table">
            <thead>
                <tr>
                	<th>No.</th>
                    <th>ID</th>
                    <th>Password</th>
                    <th>가입날짜</th>
                    <th>비고</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>narae</td>
                    <td>1234</td>
                    <td>2019.07.01</td>
                    <td><input type="button" class="btn" data-toggle="modal" data-target="#usermod-modal" value="수정">
                        <input type="button" class="btn" value="탈퇴"></td>
                </tr>
            </tbody>
        </table>
        <hr>
        <div class="text-center">
            <ul class="pagination">
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
            </ul>
        </div>
    </div>
<br>
    
    <div id="usermod-modal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">회원 정보</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="id">Id : </label>
                            <input type="text" class="form-control" id="id">
                        </div>
                        <div class="form-group">
                            <label for="pw">비밀번호 : </label>
                            <input type="text" class="form-control" value="1234" id="pw">
                        </div>
                        <div class="form-group">
                            <label for="nick">닉네임 : </label>
                            <input type="text" class="form-control" id="nick">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">수정</button>    
                </div>    
            </div>
        </div>
    </div>
   

    
    <script>
        $(document).ready(function() {
            // Add smooth scrolling to all links in navbar + footer link
            $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
                // Make sure this.hash has a value before overriding default behavior
                if (this.hash !== "") {
                    // Prevent default anchor click behavior
                    event.preventDefault();

                    // Store hash
                    var hash = this.hash;

                    // Using jQuery's animate() method to add smooth page scroll
                    // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                    $('html, body').animate({
                        scrollTop: $(hash).offset().top
                    }, 900, function() {

                        // Add hash (#) to URL when done scrolling (default click behavior)
                        window.location.hash = hash;
                    });
                } // End if
            });
        })
    </script>

</body>
</html>