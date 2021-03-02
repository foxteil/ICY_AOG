<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/auth.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>회원가입</title>
</head>
<body>
<div id="box">
<a href="https://www.icia.co.kr/"><img src="img/gtg.png" style="width: 1.85cm;height: 1.85cm;" alt="" ></a>
<h1 class="auth_title"><label>회원가입</label></h1><br/>
<div class="div">
<h2 class="auth_item1"><label  for="id">아이디</label></h2><input id="id" type="text" placeholder="아이디를 입력해주세요." /> <br/>
</div>
<div class="div">
<h2 class="auth_item1"><label for="pw">비밀번호</label></h2><input id="pw" type="password" placeholder="비밀번호를 입력해주세요."/><br/>
</div>
<div class="div">
<h2 class="auth_item1"><label for="pw2">비밀번호</label></h2><input id="pw2" type="password" placeholder="비밀번호를 확인해주세요."/><br/>
</div>
<div class="div">
<h2 class="auth_item1"><label for="name">이름</label></h2><input id="name" type="text" placeholder="이름을 입력해주세요."/><br/>
</div>
<div class="div">
<h2 class="auth_item1"><label for="phone">핸드폰번호</label></h2><input id="phone" type="text" placeholder="핸드폰번호를 입력해주세요."/> <br/>
</div>
<div class="div">
<h2 class="auth_item1"><label for="jumin">주민번호</label></h2><input id="jumin" type="text" placeholder="주민등록번호를 입력해주세요."/><br/>
</div>
<div class="div">
<h2 class="auth_item1"><label for="addr">주소</label></h2><input id="addr" type="text" placeholder="주소를 입력해주세요."/> <br/>
</div>
<button type="submit" onclick="join()">확인</button><button type="reset" onclick="reset()">취소</button>
</div>
</body>

<script>
function join(){
	var form = document.createElement("form");
	form.action = "main.jsp";
	form.method = "post";
	document.body.appendChild(form);
	form.submit();
}

function reset(){
	var form = document.createElement("form");
	form.action = "join.jsp";
	form.method = "post";
	document.body.appendChild(form);
	form.submit();
}
</script>
</html>