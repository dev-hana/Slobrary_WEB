<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,mapAPI.Search,beans.SearchBean" %>
<jsp:useBean id="sBean" class="mapAPI.Search"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=29l6bd5p1p&callback=CALLBACK_FUNCTION"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=29l6bd5p1p&submodules=geocoder"></script>
	
	<meta charset="UTF-8">
	<title>리뷰 작성</title>
	<style>
		@charset "utf-8";

.star-input>.input, .star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	display: inline-block;
	vertical-align: middle;
	background: url('../../image/pageRes/grade_img.png') no-repeat;
}

.star-input {
	display: inline-block;
	white-space: nowrap;
	width: 225px;
	height: 40px;
	padding: 25px;
	line-height: 30px;
}

.star-input>.input {
	display: inline-block;
	width: 150px;
	background-size: 150px;
	height: 28px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.star-input>.input>input {
	position: absolute;
	width: 1px;
	height: 1px;
	opacity: 0;
}

star-input>.input.focus {
	outline: 1px dotted #ddd;
}

.star-input>.input>label {
	width: 30px;
	height: 0;
	padding: 28px 0 0 0;
	overflow: hidden;
	float: left;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: 0;
}

.star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	background-size: 150px;
	background-position: 0 bottom;
}

.star-input>.input>label:hover ~label {
	background-image: none;
}

.star-input>.input>label[for="p1"] {
	width: 30px;
	z-index: 5;
}

.star-input>.input>label[for="p2"] {
	width: 60px;
	z-index: 4;
}

.star-input>.input>label[for="p3"] {
	width: 90px;
	z-index: 3;
}

.star-input>.input>label[for="p4"] {
	width: 120px;
	z-index: 2;
}

.star-input>.input>label[for="p5"] {
	width: 150px;
	z-index: 1;
}

.star-input>output {
	display: inline-block;
	width: 60px;
	font-size: 18px;
	text-align: right;
	vertical-align: middle;
}
	</style>
</head>
<body>
	<%
		String check = (String) session.getAttribute("login");
		if(check==null)
			response.sendRedirect("../login/Login.jsp");
	%>
	<jsp:include page="../Top.jsp" flush="false"/>
	<div class="container-fluid">
		<br> <br> <br>
		<div class="row">
		<form method="get" action="ReviewWrite.jsp" enctype="multipart/form-data">
			<div id="map-view" class="col-sm-5" style="background-color: #B9314F;">
				<div id="map-search" style="background-color: #B9314F; padding: 10px;" class="input-group">
					<input type="text" name="input" class="form-control" placeholder="Search">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit"> <i class="glyphicon glyphicon-search"></i> </button>
					</div>
				</div>
				<div id="map" style="width:100%;height:650px;"></div>
			</div>
		</form>
		
		<form name="insert" method="post" action="ReviewWriteProc.jsp?flag=insert" enctype="multipart/form-data">
			<div class="col-sm-6" style="background-color: white;">
				<div class="input-group">
					<span class="input-group-addon">가게</span> 
					<input id="store" type="text" class="form-control" name="store">
				</div>
				<div class="input-group">
					<span class="input-group-addon">주소</span> 
					<input id="storeaddr" type="text" class="form-control" name="store_addr" >
				</div>
				<div class="star-input">
					<span class="input"> 
					<input type="radio" name="rating" value="1" id="p1"> <label for="p1">1</label> 
					<input type="radio" name="rating" value="2" id="p2"> <label for="p2">2</label> 
					<input type="radio" name="rating" value="3" id="p3"> <label for="p3">3</label> 
					<input type="radio" name="rating" value="4" id="p4"> <label for="p4">4</label>
					<input type="radio" name="rating" value="5" id="p5"> <label for="p5">5</label>
					</span>
					<output for="star-input">
						<b>0</b>점
					</output>
				</div>

				<div class="form-group">
					<label></label> <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
					<textarea class="form-control" rows="5" id="contents" name="contents" placeholder="내용을 입력해주세요"></textarea>
					<input type="file" name="image"><hr><br>
					<label></label> <label></label>
					<input type="text" class="form-control" id="hashtag" name="hashtag" placeholder="해시태그를 입력해주세요"><br>
					<label for="writer">작성자 : <b><%=session.getAttribute("email")%></b></label><br> 
					<input type="hidden" name="writer" value="<%=session.getAttribute("email")%>" >
					<input type="submit" class="btn btn-default" value="리뷰등록">&nbsp;&nbsp;&nbsp;
					<input type="reset" class="btn btn-default" value="다시쓰기">
				</div>
			</div>
		</form>
		</div>
	</div>
</body>

<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>

var mapOptions = {
		center: new naver.maps.Point(309944, 552085),
	    zoom: 2,
		
	    mapTypes: new naver.maps.MapTypeRegistry({
            'normal': naver.maps.NaverMapTypeOption.getNormalMap({
                projection: naver.maps.TM128Coord
            }),
            'terrain': naver.maps.NaverMapTypeOption.getTerrainMap({
                projection: naver.maps.TM128Coord
            }),
            'satellite': naver.maps.NaverMapTypeOption.getSatelliteMap({
                projection: naver.maps.TM128Coord
            }),
            'hybrid': naver.maps.NaverMapTypeOption.getHybridMap({
                projection: naver.maps.TM128Coord
            })
        }),
        mapTypeControl: true
		};
		
var map = new naver.maps.Map('map', mapOptions);

var position;
var marker;
var x, y, vti, vrad;
var info;
var contentString;
var infoWindow;
var markers = [];
var infoWindows = [];
var str=[];

var vvti = [];
var vvrad = [];

<%
SearchBean myInfo = new SearchBean();
String ins;
int siz=0;
if(request.getParameter("input") != null){
	ins = request.getParameter("input");
	Vector<SearchBean> in = sBean.searchf(ins);
	siz = in.size();
	String[] content = new String[siz];
	for(int i=0;i<in.size();i++){
		myInfo=in.get(i);%>	
		x=<%=myInfo.getMx()%>;
		y=<%=myInfo.getMy()%>;
		
		vti="<%=myInfo.getTi()%>";
		vrad="<%=myInfo.getRad()%>";
		info = vti+" | "+vrad;
		
		contentString = info;
		
		//document.write(contentString);
		
		position = new naver.maps.Point(x, y);

		marker = new naver.maps.Marker({
			position: position,
			map: map
		});
		
		infoWindow = new naver.maps.InfoWindow({
			content: contentString
		});
		vvti.push(vti);
		vvrad.push(vrad);
		markers.push(marker);
		infoWindows.push(infoWindow);
		<%
	}
	%>
	function getClickHandler(seq) {
	    return function(e) {
	        var marker = markers[seq],
	            infoWindow = infoWindows[seq];

	        if (infoWindow.getMap()) {
	            infoWindow.close();
	        } else {
	            infoWindow.open(map, marker);
	            document.insert.store.value=vvti[seq];
	            document.insert.storeaddr.value=vvrad[seq];
	        
	            
	        }
	    }
	}

	for (var i=0, ii=markers.length; i<ii; i++) {
	    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
	}
	
	<%
}%>

var starRating = function(){
	var $star = $(".star-input"),
	    $result = $star.find("output>b");
		
	  	$(document)
		.on("focusin", ".star-input>.input", 
			function(){
	   		 $(this).addClass("focus");
	 	})
			 
	   	.on("focusout", ".star-input>.input", function(){
	    	var $this = $(this);
	    	setTimeout(function(){
	      		if($this.find(":focus").length === 0){
	       			$this.removeClass("focus");
	     	 	}
	   		}, 100);
	 	 })
	  
	    .on("change", ".star-input :radio", function(){
	    	$result.text($(this).next().text());
	  	})
	    .on("mouseover", ".star-input label", function(){
	    	$result.text($(this).text());
	    })
	    .on("mouseleave", ".star-input>.input", function(){
	    	var $checked = $star.find(":checked");
	    		if($checked.length === 0){
	     	 		$result.text("0");
	   		 	} else {
	     	 		$result.text($checked.next().text());
	    		}
	  	});
	};

	starRating();

	var shopName = document.getElementById("shop-name");
	var shopAddr = document.getElementById("shop-addr");
	shopName.readOnly=true;
	shopAddr.readOnly=true;
</script>
</html>