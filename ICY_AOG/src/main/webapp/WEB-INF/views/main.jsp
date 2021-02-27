<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/auth.css">
<link rel="icon" type="image/png" href="img/gtg.png">
<title>로그인</title>
</head>
<body>
<div id="box">
<a id="main_logo" href="start.jsp"><img src="img/gtg_main.png" style="width: 5cm;height: 5cm; position:relative; left:70px; top:50px;"></a>
<input class="in" id="id" type="text" placeholder="아이디를 입력해주세요." /><br/>
<input class="in" id="pw" type="password" placeholder="비밀번호를 입력해주세요."/><br/>
<button class="main_btn" type="submit" onclick="login()">로그인</button><button class="main_btn" type="reset" onclick="join()">회원가입</button>
</div>
</body>

<script>
function login(){
	var form = document.createElement("form");
	form.action = "start.jsp";
	form.method = "post";
	document.body.appendChild(form);
	form.submit();
}

function join(){
	var form = document.createElement("form");
	form.action = "join.jsp";
	form.method = "post";
	document.body.appendChild(form);
	form.submit();
}
</script>
</html>