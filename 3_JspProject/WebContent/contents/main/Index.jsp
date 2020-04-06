<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.util.*, db.*, beans.*"%>
 <jsp:useBean id="reviewMgr" class="db.ReviewMgr"/>
 <jsp:useBean id="userMgr" class="db.UserMgr"/>
<!DOCTYPE html>
<html>
<head>
    <!-- Theme Made By www.w3schools.com -->
    <title>Bootstrap Theme Company Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="Index.css?new">
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
    <%
    	request.setCharacterEncoding("UTF-8");
    	String loginUserEmail = (String) session.getAttribute("email");
    	boolean isLogin=true;
		if (loginUserEmail == null) isLogin=false;
		else {
			SignUpBean user = userMgr.getUser(loginUserEmail);
		}
		
		Vector vResult= reviewMgr.getReviewList(3);
	%>
    <!-- 메뉴바 -->
    <jsp:include page="../Top.jsp" flush="false"/>
    <!-- 메인컨텐츠 -->
    <div class="jumbotron">
    	<% if (isLogin)  {%>
            <h3 class="text-center">환영합니다!</h3><br>
        <% } else { %>
        	<h3 class="text-center">처음이신가요?</h3><br>
        <% } %>
        
        <div id="info" class="container text-center">
            <img src="../../image/pageRes/index_res1.png">
            <img src="../../image/pageRes/index_res2.png">
            <div>
                맛있는 음식을 먹고 리뷰를 남겨보세요!<br>
                다른 사람의 리뷰에 공감할 수 있습니다.
            </div>
            <br>
            <% if (isLogin)  {%>
            	<button type="button" onclick="location.href='../review/ReviewWrite.jsp'" class="btn btn-success">리뷰 쓰러가기!</button>
        	<% } else { %>
        		<button type="button" onclick="location.href='../login/Signup.jsp'" class="btn btn-success">지금 시작하기!</button>
        	<% } %>
        </div>
    </div>

    <div class="container">
        <h3>리뷰 랭킹 Top 3</h3><hr>
        <!-- Indicators -->
    <div id="reviewCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#reviewCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#reviewCarousel" data-slide-to="1"></li>
            <li data-target="#reviewCarousel" data-slide-to="2"></li>
        </ol>
        
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
        <% 	ReviewBean review = new ReviewBean();
        	String isActive = "active";
        	for (int i=0; i<3; i++) {
        		try {
        			review = (ReviewBean)vResult.get(i); 
        			if (i>0) isActive = "";
        %>
            <div class="item <%=isActive%>">
                <div>
                    <b><%=review.getStore()%></b>&nbsp;&nbsp;&nbsp;<%=review.getStore_addr()%>
                    <img class="pull-right" src="../../image/reviewDB/<%=review.getImage()%>">
                    <h3><%=review.getTitle()%></h3>
                    <h4><%
                    	int rate = review.getRating();
                    	for (int j=0; j<rate; j++)
                    		out.print("★");
                    	%>
                    </h4>
                    <div id="content"><%=review.getContents()%></div><br>
                    <span><kbd>#</kbd><%=review.getHashtag()%></span>
                    <span class="pull-right">♥ <%=review.getHeart_cnt()%>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                </div>
            </div>
           <%
        	}catch (Exception e){ %>
        		<div class="item active">
        			<h3>등록된 리뷰가 없어요 ㅠㅠ 리뷰를 등록해주세요</h3>
        		</div>
        	<% 	
        	}
        	}
           %>
        </div>
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#reviewCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#reviewCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
        </div>
    </div>
        
    <!-- 서브 컨텐츠 -->
    <br><br><br>
    <div id="contents" class="container">
        	<h3>오늘은 여기 어떠세요?</h3><hr>
        <%
        	Random rand = new Random();
        	int randNum = rand.nextInt(ReviewMgr.getCount());
        	ReviewBean store = reviewMgr.getStore(randNum);
        	if (store == null) {
        		out.println("등록된 리뷰가 없어서 추천해드릴수없어요 ㅠㅠ");
        	}else {
        %>
            <div class="text-center">
                <img class="float-right" style="width: 200px;" src="../../image/reviewDb/<%=store.getImage()%>">
                <div><h3><%=store.getStore()%></h3>
                    <p><%=store.getStore_addr()%></p></div>
            </div>
        </div>
        <%} %>
<br>

        <jsp:include page="../Bottom.jsp" flush="false"/>
        

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

            $(window).scroll(function() {
                $(".slideanim").each(function() {
                    var pos = $(this).offset().top;

                    var winTop = $(window).scrollTop();
                    if (pos < winTop + 600) {
                        $(this).addClass("slide");
                    }
                });
            });
        })
    </script>

</body></html>