<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/reserve.css">
<link rel="icon" type="image/png" href="img/gtg.png">
<title>메인페이지</title>
</head>
<body>
	<div id="box">
		<button class="btn" type="reset" onclick="logout()">로그아웃</button>
		<a id="main_logo" href="start.jsp"> <img src="img/gtg_main.png"
			style="width: 5cm; height: 5cm; position: relative; left: -8px; top: 80px;">
		</a>
		<div class="res">
		<h2 class="reserve" onclick="simple()"> 
			간편<br/>예약
		</h2>
		<h2 class="reserve" onclick="normal()">
			일반<br/>예약
		</h2>
		<h2 class="reserve" onclick="bookmark()">
			관심<br/>병원
		</h2>
		</div>
		
		<div class="mypage">
		<h2 class="my" onclick="check()"> 
			예약<br/>확인
		</h2>
		<h2 class="my" onclick="review()">
			후기<br/>작성
		</h2>
		<h2 class="my" onclick="mypage()">
			MY
		</h2>
		</div>
	</div>
</body>

<script>
	function simple() {
		var form = document.createElement("form");
		form.action = "sreservation.jsp";
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}

	function normal() {
		var form = document.createElement("form");
		form.action = "reservation.jsp";
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
	function bookmark() {
		var form = document.createElement("form");
		form.action = "interest.jsp";
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
	function check() {
		var form = document.createElement("form");
		form.action = "check.jsp";
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}

	function review() {
		var form = document.createElement("form");
		form.action = "review.jsp";
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
	function mypage() {
		var form = document.createElement("form");
		form.action = "mypage.jsp";
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
	function logout() {
		var form = document.createElement("form");
		form.action = "main.jsp";
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
</script>
</html>