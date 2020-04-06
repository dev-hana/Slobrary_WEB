<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, db.*, beans.*"%>
<jsp:useBean id="reviewMgr" class="db.ReviewMgr" />
<!DOCTYPE html>
<html>
<head>
    <!-- Theme Made By www.w3schools.com -->
    <title>리뷰 상세보기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
    	.input-group {
    		margin-bottom : 30px;
    	}
    </style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="60" style="padding-top:70px">
   <%@ include file="Top.jsp" %>
<% 
	String num = request.getParameter("no");
	ReviewBean vResult= reviewMgr.getReview(num);
%>
    <div id="contents" class="container" style="margin = 0px 400px 0px 400px">
    	<div style="text-align:center; padding:50px; border-bottom: 1px solid; border-top:1px solid; margin-bottom:30px" >
        <h1>리뷰 # <%=num %></h1>
    	</div>
    	<button type="button" onclick="back()" class="btn btn-default pull-right">뒤로</button>
			<input type="button" onclick="delReview(<%=num%>)" class="btn btn-default" value="삭제">
        	<br><br><br>
        	<form method="post" action="ReviewProc.jsp?flag=update" enctype="multipart/form-data">
                        <div class="input-group">
                        	<input type="hidden" name="no" value="<%=num%>">
							<span class="input-group-addon">가게</span> 
							<input id="store" type="text" disabled="disabled" class="form-control" name="store" value="<%=vResult.getStore()%>">
						</div>
						<div class="input-group">
							<span class="input-group-addon">주소</span> 
							<input id="store_addr" type="text" disabled="disabled" class="form-control" name="store_addr" value="<%=vResult.getStore_addr()%>">
						</div>
						<div class="input-group" style="text-align:center">
							<span class="input-group-addon">별점</span>
							<span class="form-control">
							<% 	int rate = vResult.getRating(); 
								String checked = "";
								for(int i=1; i<6; i++) {
								if (i == rate)
									checked = "checked";
								else 
									checked = "";
							%>
								<input type="radio" name="rating" value="<%=i%>" id="p<%=i%>" <%=checked%>> <label for="p<%=i%>"><%=i%></label> 
							<% 
								}
							%>
							</span>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">제목</span> 
								<input id="title" type="text" class="form-control" name="title" value="<%=vResult.getTitle()%>">
							</div>
							<div class="input-group">
								<span class="input-group-addon">내용</span> 
								<textarea class="form-control" rows="5" id="contents" name="contents"><%=vResult.getContents()%></textarea>
							</div>
							<div class="input-group">
								<span class="input-group-addon">이미지</span> 
								<input id="image" type="file" class="form-control" name="image" value="<%=vResult.getImage()%>">
							</div>
							<label></label> <label></label>
							<div class="input-group">
								<span class="input-group-addon">해시태그</span> 
								<input id="hashTag" type="text" class="form-control" name="hashtag" value="<%=vResult.getHashtag()%>">
							</div>
							<div class="input-group">
								<span class="input-group-addon">작성자</span> 
								<input id="writer" type="text" class="form-control" name="writer" value="<%=vResult.getWriter()%>">
							</div><div class="input-group">
								<span class="input-group-addon">작성일</span> 
								<input id="date" type="text" class="form-control" name="date" value="<%=vResult.getDate()%>">
							</div>
							<div style="text-align:center">
								<input type="submit" onclick="update()" class="btn btn-default" value="수정">&nbsp;&nbsp;&nbsp;
								<input type="reset" class="btn btn-default" value="초기화">&nbsp;&nbsp;&nbsp;
							</div>
						</div>
                    </form>
                </div>

    
    <script>
        function back(){
        	var result = confirm("정말 뒤로 가시겠습니까?");
			if (result) location.href="ReviewMgr.jsp";
        };
        
        function delReview(no){
        	var result = confirm("정말 삭제하시겠습니까?");
			if (result) location.href="ReviewProc.jsp?no="+no+"&flag=delete";
        };
    </script>

</body>
</html>