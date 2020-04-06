<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="beans.SignUpBean" %> 
<jsp:useBean id="userBean" class="db.UserMgr"/>
<% 	
	String email = "dd@gmail.com";  //(String)session.getAttribute("email");
	SignUpBean user = userBean.getUser(email);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<title>HashTag Search</title>
<style type="text/css">
	html,body {height:100%;}
	//** variables
$background: #f5f6fa;
$text: #9c9c9c;
$input-bg-color: #fff;
$input-text-color: #a3a3a3;
$button-bg-color: #7f8ff4;
$button-text-color: #fff;

//** root
:root {
	background: $background;
	color: $text;
	font: 1rem "PT Sans", sans-serif;
}

html,
body,
.container {
	height: 100%;
}

a {
	color: inherit;
	
	&:hover {
		color: $button-bg-color;
	}
}

//** helper
.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.uppercase {
	text-transform: uppercase;
}

//** button
.btn {
	display: inline-block;
	background: #FFDCDC;
	color: inherit;
	font: inherit;
	border: 0;
	outline: 0;
	padding: 0;
	transition: all 200ms ease-in;
	cursor: pointer;
	
	&--primary {
		background: #FFDCDC;
		color: $button-text-color;
		box-shadow: 0 0 10px 2px rgba(0, 0, 0, .1);
		border-radius: 2px;
		padding: 12px 36px;
		
		&:hover {
			background: darken($button-bg-color, 4%);
		}
		
		&:active {
			background: $button-bg-color;
			box-shadow: inset 0 0 10px 2px rgba(0, 0, 0, .2);
		}
	}
	
	&--inside {
		margin-left: -96px;
	}
}

//** form
.form {	
	&__field {
		width: 360px;
		background: #fff;
		color: $input-text-color;
		font: inherit;
		box-shadow: 0 6px 10px 0 rgba(0, 0, 0 , .1);
		border: 0;
		outline: 0;
		padding: 22px 18px;
	}
}
</style>
<script type="text/javascript"> 
//<![CDATA[
function calcHeight(){
 //find the height of the internal page

 var the_height=
 document.getElementById('the_iframe').contentWindow.
 document.body.scrollHeight;

 //change the height of the iframe
 document.getElementById('the_iframe').height=
 the_height;

 //document.getElementById('the_iframe').scrolling = "no";
 document.getElementById('the_iframe').style.overflow = "hidden";
}
//
</script>
</head>
<body>
<jsp:include page="../Top.jsp" flush="false"/>
 <!-- 검색바 -->
 <br><br><br>
       <div class="container">
		<div class="container__item" style="text-align: center;">
		<form class="form" method="get" action="HashTagList.jsp" target="list">
			<input type="text" class="form__field" placeholder="#해시태그" name="hashtag" size="40"/>
			<button style="background-color: #FFDCDC;" type="submit" class="btn btn--primary btn--inside uppercase">검색</button>
		</form>
		</div>
	<iframe id="the_iframe" onload="calcHeight();" name="list" title="hasttag 검색 결과" frameborder="0" scrolling="no" style="overflow-x:hidden; overflow:auto; width:100%; min-height:500px;"></iframe>
</body>
</html>