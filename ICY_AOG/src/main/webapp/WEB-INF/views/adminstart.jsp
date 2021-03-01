<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/admin.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>메인페이지</title>
</head>
<body>
	<div id="admin-box">
		<a id="little"> <img src="/resources/img/gtg_main.png">
		</a>
		<div class="admin_title">
			<h2 class="admin_btn1" id="RESERVELIST">예약리스트</h2>
		
		<button id="RESERVELIST" onclick="order(this)">자세히</button>
	</div>
			<h2 class="admin_btn1" id="HPREVIEW" onClick="doDisplay(this)">병원리뷰</h2>
			<h2 class="admin_btn1" id="SCHEDULEFORM" onClick="doDisplay(this)">일정표</h2>
			<h2 class="admin_btn1" id="DRINFO" onClick="doDisplay(this)">기본</h2>
		</div>
		<div class="span-hplist"></div>
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
	function doDisplay(){
		var con = document.getElementById("list");
		con.style.display="blcok";
		if(con.style.display=='none'){
			con.style.display=  'block';
		}else{
			con.style.display = 'none';
		}
	}
	
</script>
</html>