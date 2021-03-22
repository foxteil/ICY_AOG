<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d26c5a8417f44d5be7c3762fdf3c5e80"></script>

<title>Insert title here</title>
</head>
<body>
<div id="map" style="width:500px; height:400px;"></div>
</body>
<script>
alert('${mapInfo}');
		var container = document.getElementById('map');
		let mapview= JSON.parse('${mapInfo}');
	 	mapOption={
	 			center:new kakao.maps.LatLng(33.450701, 126.570667),
	 			level:3
	 	};
	 	var map = new kakao.maps.Map(mapContainer, mapOption);
	 	var geocoder = new kakao.maps.services.Geocoder();
	 	
	 	geocoder.addressSearch(mapview[0].hpAddr,function(result, status){
	 		if (status === kakao.maps.services.Status.OK) {

	 	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	 	        
	 	       var marker = new kakao.maps.Marker({
	 	            map: map,
	 	            position: coords
	 	        });
	 	       
	 	      var infowindow = new kakao.maps.InfoWindow({
	 	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+mapview[0].hpName+'</div>'
	 	        });
	 	        infowindow.open(map, marker);
	 	       map.setCenter(coords);
	 	    } 
	 	});    
	 	
	
		
	</script>
</html>