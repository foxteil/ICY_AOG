<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reserve.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>병원상세페이지</title>
</head>
<body>
	<div id="box">
		<a id="little">
      		<img src="/resources/img/gtg_main.png">
    	</a>
    	<a class="hpimage">
    		<img src="/resources/img/hpimage.png">
    	</a>
    	<div class="span-hplist" style="position: relative; top: 0px; padding: 9px 0px 38px 0px;">
		<span id="RESFORM" onclick="order(this)">
			<span class="hpname" style="position:relative; left:12px;">인천일보의원</span>
			<span class="hppart" style="position: relative;left: 93px;">이비인후과</span><br/>
			<span class="hptime"> ☎  032-439-0011</span><br/>
			<span class="hptime">--------------------------------------------------</span>
			<span class="hptime">
			<br>평일   09:00 - 21:00 | 토요일 09:00 - 17:00|
			<br>일요일 09:00 - 16:00 | 공휴일 09:00 - 16:00
			</span><br/>
			<span class="hptime">--------------------------------------------------</span>
			<span class="hptime"> 
			<br>인천 남동구 논고개로 121 <br>	 
			<img src="/resources/img/subway.png" style="width: 1.93cm;
    height: 0.7cm;
    position: relative;
    top: 14px;">인천 논현역 4번 출구에서 218m

			</span>
			</span>
		</div>
			<button class="btn" id="REVIEW" onclick="detail(this)">리뷰보러가기</button>
			<button class="btn" id="RESFORM" onclick="detail(this)">예약하기</button>
			<button class="btn" id="MAP" onclick="detail(this)">지도보기</button>
	</div>
</body>

<script>
	function detail(obj){
		var form = document.createElement("form");
		form.action = obj.id;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
		
	}
</script>
</html>