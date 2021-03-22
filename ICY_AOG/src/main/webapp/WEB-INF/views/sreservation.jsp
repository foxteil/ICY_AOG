<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/reserve.css">
<link rel="icon" type="image/png" href="img/gtg.png">
<title>회원가입</title>
</head>
<body>
	<div id="box">
		<a href="https://www.icia.co.kr/"><img src="img/gtg.png"
			style="width: 1.85cm; height: 1.85cm;" alt=""></a>
			<select name="object">
				<option value="object">대상선택</option>
				<option value="first">월요일</option>
				<option value="second">화요일</option>
				<option value="third">수요일</option>
				<option value="fourth">목요일</option>
				<option value="fifth">금요일</option>
			</select>
		<div class="select">날짜 선택</div><div class="select">시간 선택</div>
		<div class="select">최근 방문</div><div class="select">병원 선택</div>
		
		<div class="submit" onclick="reserve()">예약</div>
	</div>
</body>

<script>
	function reserve() {
		var form = document.createElement("form");
		form.action = "finish.jsp";
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}

	
</script>
</html>