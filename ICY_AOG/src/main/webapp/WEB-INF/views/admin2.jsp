<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/auth.css">
<link rel="icon" type="img/png" href="/resources/img/gtg.png">
<title>로그인페이지</title>
</head>
<body onLoad="init()">
	<div id="box">
		<a id="main_logo" href="start.jsp">
		   <img src="/resources/img/gtg_main.png"
			style="width: 5cm; height: 5cm; position: relative; left: 70px; top: 50px;">
		</a>
		
		<a id="ADMIN" href="/">
			<img src="/resources/img/hospital.png">
		</a>
		
		<input class="in" name="AInfo" id="id" type="text" placeholder="아이디를 입력해주세요." /><br />
		<input class="in" name="AInfo" id="pw" type="password" placeholder="비밀번호를 입력해주세요." /><br />
		<button class="main_btn" id="/" onclick="moveLogin()">로그인</button>
		<button class="main_btn" id="JOINFORM" onclick="moveJoin()">회원가입</button>
		<div class="snsapi">
		</div>
		<h3 id="FIND" onclick="member(this)">아이디/비밀번호 찾기</h3>
	</div>
</body>

<script>
	function moveLogin(){
		var id = document.getElementsByName("AInfo")[0];	
		var pw = document.getElementsByName("AInfo")[1];
		var logCode = document.createElement("input");
		logCode.name = "logCode";
		logCode.value = "A";
		id.name = "aId";
		pw.name = "aPw";
		
		var form = document.createElement("form");
// 		form.action = "LOGIN?aId="+id+"&aPw="+pw+"&logCode=A";
		form.action = "LOGIN"
		form.method = "post";
		
		form.appendChild(id);
		form.appendChild(pw);
		form.appendChild(logCode);
		
		document.body.appendChild(form);
		form.submit();
	}
	
	function moveJoin(){
		var form = document.createElement("form");
		form.action = "JOINFORM?&jCode=A";
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
	
	function init(){
		var msg = "${msg}";
	 	if (msg != ""){ 
			alert(msg);
			}
	}
	
// 	function member(obj) {
// 		var form = document.createElement("form");
// 		var c = c;
// 		form.action = obj.id+"?sCode=c";
// 		alert()
// 		alert(form.action);
// 		form.method = "post";
// 		document.body.appendChild(form);
// 		form.submit();
// 	}
	
</script>
</html>