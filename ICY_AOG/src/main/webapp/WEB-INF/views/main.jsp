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
		
		<a id="ADMIN" href="ADMIN">
			<img src="/resources/img/client.png">
		</a>
		
		<input class="in" name="MInfo" id="id" type="text" placeholder="아이디를 입력해주세요." /><br />
		<input class="in" name="MInfo" id="pw" type="password" placeholder="비밀번호를 입력해주세요." /><br />
		<button class="main_btn" id="/" onclick="moveLogin()">로그인</button>
		<button class="main_btn" id="JOINFORM" onclick="moveJoin()">회원가입</button>
		<div class="snsapi">
		<a id="KAKAOLOG" onclick="member(this)"><img src="/resources/img/kakao.png"></a>
		<a id="NAVERLOG" onclick="member(this)"><img src="/resources/img/naver.png"></a>
		<a id="FACEBOOKLOG" onclick="member(this)"><img src="/resources/img/facebook.png"></a>
		<a class="snslogin">SNS로 로그인</a>
		</div>
		<h3 id="FIND" onclick="member(this)">아이디/비밀번호 찾기</h3>
	</div>
</body>

<script>
	function moveLogin(){
		var mId = document.getElementsByName("MInfo")[0];
		var mPw = document.getElementsByName("MInfo")[1];
		var logCode = document.createElement("input");
		logCode.name = "logCode";
		logCode.value= "U";
		mId.name = "mId";
		mPw.name ="mPw";
		
		var form = document.createElement("form");
		//form.action = "LOGIN?mId="+id+"&mPw="+pw+"&logCode=U";
		form.action = "LOGIN";
		form.method = "post";
		
		form.appendChild(mId);
		form.appendChild(mPw);
		form.appendChild(logCode);
		
		document.body.appendChild(form);
		form.submit();
	}
	
	function moveJoin(){
		var form = document.createElement("form");
		form.action = "JOINFORM?&jCode=U";
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