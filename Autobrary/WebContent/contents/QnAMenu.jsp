<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#sidebar a, #sidebar a:hover, #sidebar a:focus {
    color: #1d2129;
    text-decoration: none;
    transition: all 0.3s;
}
/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */
#sidebar {
	color: #1d2129;
}

.overlay {
	position: fixed;
	width: 100vw;
	height: 100vh;
	background: rgba(0, 0, 0, 0.7);
	z-index: 998;
	display: none;
}

#sidebar .sidebar-header {
	display: none;
}

#sidebar ul li a {
	padding: 10px;
	font-size: 1.1em;
	display: block;
	border-left: 3px solid #e9ebee;
}

#sidebar ul li a:hover {
	border-left: 3px solid #009688;
	color: #1d2129;
	background: #fff;
}

#sidebar ul li.active>a, a[aria-expanded="true"] {
	border-left: 3px solid #009688;
	color: #1d2129;
	background-color: #fff;
}

#sidebar ul li .active>a {
	color: #009688;
}

a[data-toggle="collapse"] {
	position: relative;
}

a[aria-expanded="false"]::before, a[aria-expanded="true"]::before {
	content: '\e259';
	display: block;
	position: absolute;
	right: 20px;
	font-family: 'Glyphicons Halflings';
	font-size: 0.6em;
}

a[aria-expanded="true"]::before {
	content: '\e260';
}

ul ul a {
	font-size: 0.9em !important;
	padding-left: 30px !important;
}

/*Botao menu sidebar*/
#sidebarCollapse {
	display: none;
}
/* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */
@media ( max-width : 768px) {
  #sidebar a {
    color: #fff;
  }
  #sidebar ul li.active>a, a[aria-expanded="true"] {
	color: #1d2129 !important;
	background-color: #fff;
}
	#sidebar {
		margin-left: -250px;
		width: 250px;
		color: #fff;
		background: #009688;
		overflow-y: scroll;
		box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.2);
		position: fixed;
		top: 0;
		left: -250px;
		height: 100vh;
		z-index: 999;
	}
	#sidebar.active {
		margin-left: 0;
		left: 0;
	}
	#sidebar .sidebar-header {
		display: block;
		padding: 20px;
	}
	#sidebar ul li a, #sidebar ul li a:hover, #sidebar ul li.active>a, a[aria-expanded="true"] a:visited
		{
		border-left: none;
	}
}
</style>
<script>

</script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
<div class="col-sm-3 col-md-3">
    <nav id="sidebar">
                <ul class="list-unstyled components">
                    <li>
                        <a href="#">회원문의</a>
                    </li>
                    <li>
                        <a href="#">자료이용문의</a>
                    </li>
                    <li>
                        <a href="#">시설 및 기타</a>
                    </li>
                </ul>

                
            </nav>

  </div>
</body>
</html>