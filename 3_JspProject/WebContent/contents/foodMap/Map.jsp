<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,mapAPI.Search,beans.SearchBean" %>
<jsp:useBean id="sBean" class="mapAPI.Search"></jsp:useBean>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <title>맛집 지도</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=29l6bd5p1p&callback=CALLBACK_FUNCTION"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=29l6bd5p1p&submodules=geocoder"></script>
    
    
</head>
<body>
<jsp:include page="../Top.jsp" flush="false"/>
 <!-- 검색바 -->
 <br><br><br>
    <div id="searchBar" class="container-fluid">
        <form method="get" action="Map.jsp">
            <div class="input-group">
                <input type="text" name="input" class="form-control" size="50" placeholder="검색어를 입력해주세요" required>
                <div class="input-group-btn">
                    <button type="submit" class="btn btn-danger">검색 </button>
                </div>
            </div>
        </form>
    </div>
    
<br>

<%
String contentPage = request.getParameter("CONTENTPAGE");
%>


<div id="map" style="width:100%;height:650px;"></div>
<%
if(request.getParameter("input") !=null){%>
<div id="_panel" style="display: inline-block; position: relative; z-index: 1;margin: 20px 0 0 20px;font-size: 12px;">
	<div id="guide" style="display: inline-block;border: 1px solid #b4b4b4;border-radius: 4px;padding: 8px;background: #fff;">
	<jsp:include page="MapProc.jsp"/>
	</div>
</div>
<% }
%>


<script>

//처음 지정한 위치
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
		
		document.write(contentString);
		
		position = new naver.maps.Point(x, y);

		marker = new naver.maps.Marker({
			position: position,
			map: map
		});
		
		infoWindow = new naver.maps.InfoWindow({
			content: contentString
		});
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
	        }
	    }
	}

	for (var i=0, ii=markers.length; i<ii; i++) {
	    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
	}
	
	<%
}%>



</script>

</body>
</html>