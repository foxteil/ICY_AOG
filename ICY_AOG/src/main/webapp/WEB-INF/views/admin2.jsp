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
		
		<input class="in" name="AInfo" id="hpCode" type="text" placeholder="병원코드를 입력해주세요." /><br />
		<input class="in" name="AInfo" id="id" type="text" placeholder="아이디를 입력해주세요." /><br />
		<input class="in" name="AInfo" id="pw" type="password" placeholder="비밀번호를 입력해주세요." /><br />
		<button class="main_btn" id="/" onclick="moveLogin()">로그인</button>
		<button class="main_btn" id="JOINFORM" onclick="openPopUp()">회원가입</button>
		<div class="snsapi">
		</div>
		<h3 id="FIND" onclick="member(this)">아이디/비밀번호 찾기</h3>
	</div>
</body>

<script>
	function moveLogin(){
		var hpCode = document.getElementsByName("AInfo")[0];	
		var id = document.getElementsByName("AInfo")[1];	
		var pw = document.getElementsByName("AInfo")[2];
		var logCode = document.createElement("input");
		logCode.name = "logCode";
		logCode.value = "A";
		hpCode.name = "aHpCode";
		id.name = "aId";
		pw.name = "aPw";
		
		var form = document.createElement("form");
// 		form.action = "LOGIN?aId="+id+"&aPw="+pw+"&logCode=A";
		form.action = "LOGIN"
		form.method = "post";
		
		form.appendChild(hpCode);
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
	
	function openPopUp(){ //병원관리자 회원가입 클릭시! 병원 검색창뜨는 팝업창
// 		datem = day;
// 		alert(day);
		window.name = "admin2"; //부모창 이름 설정
// 		var popUrl = "resTime?sCode=resTime&hpCode="+HPCODE+"&day="+day;	//팝업창에 출력될 페이지 URL
		var popUrl = "POPUPHPSEARCHFORM?&jCode=A";	//팝업창에 출력될 페이지 URL
		var popOption = "width=700, height=600, , resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
			window.open(popUrl,"popuphpsearch",popOption);
	}
	
	function init(){
		var msg = "${msg}";
	 	if (msg != ""){ 
			alert(msg);
			}
	}
</script>
</html>