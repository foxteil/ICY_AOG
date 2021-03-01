<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reserve.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>메인페이지</title>
</head>
<body>
	<div id="box">
		<button class="btn" id="main" onclick="reserve(this)">로그아웃</button>
		<a id="main_logo" href="start.jsp"> <img src="/resources/img/gtg_main.png"
			style="width: 5cm; height: 5cm; position: relative; left: -8px; top: 80px;">
		</a>
		<div class="res">
		<h2 class="reserve" id="LSEARCH" onclick="reserve(this)"> 
			지역선택
		</h2>
		<div class="partform">
		<h5 class="part" id="PART" onclick="reserve(this)">이비인후과</h5>
		<h5 class="part" onclick="reserve(this)">정형외과</h5>
		<h5 class="part" onclick="reserve(this)">안  과</h5> <br/>
		<h5 class="part" onclick="reserve(this)">통증의학과</h5>
		<h5 class="part" onclick="reserve(this)">내  과</h5>
		<h5 class="part" onclick="reserve(this)">치  과</h5>
		<h5 class="part" onclick="reserve(this)">기  타</h5>
		</div>
		<h2 class="reserve" id="ORDER" onclick="reserve(this)">
			예약하러가기
		</h2>
		</div>
		
		<div class="mypage">
		<h2 class="my" id="RESCHECK" onclick="reserve(this)"> 
			예약<br/>확인
		</h2>
		<h2 class="my" id="BOOKMARKFORM" onclick="reserve(this)">
			관심<br/>병원
		</h2>
		<h2 class="my" id="MYPAGEFORM" onclick="reserve(this)">
			MY
		</h2>
		</div>
	</div>
</body>

<script>
	function reserve(opt) {
		var form = document.createElement("form");
		form.action = opt.id;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}

	
</script>
</html>