<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/auth.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>로그인</title>
</head>
<body>
	<div id="box">
		<a id="main_logo" href="start.jsp"><img src="/resources/img/gtg_main.png"
			style="width: 5cm; height: 5cm; position: relative; left: 70px; top: 50px;"></a>
		<button class="find">아이디찾기</button>
		<button class="find">비밀번호찾기</button>
		<button class="login" id="LOGIN" onclick="member(this)">로그인하러가기</button>
	</div>
</body>

<script>
	function member(obj) {
		var form = document.createElement("form");
		form.action = obj.id;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
</script>
</html>