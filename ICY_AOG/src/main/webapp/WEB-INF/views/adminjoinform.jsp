<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/auth.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>회원가입페이지</title>
</head>
<body>
	<div id="box">
		<a href="https://www.icia.co.kr/"><img src="/resources/img/gtg.png"
			style="width: 1.85cm; height: 1.85cm;" alt=""></a>
		<h1 class="auth_title">
			<label>회원가입</label>
		</h1>
		<br />
		<div class="div">
			<h2 class="auth_item1">
				<label for="pw">사업자번호</label>
			</h2>
			<input id="hpCode" name="hpCode" type="text" maxlength=10 placeholder="사업자번호를 입력해주세요." /><br />
		</div>
		<div class="div">
			<h2 class="auth_item1">
				<label for="id">직원ID</label>
			</h2>
			<input id="id" name="id" type="text" maxlength=20 placeholder="아이디를 입력해주세요." /> <br />
		</div>
		<form action="" method=post onSubmit="return checkPw(this);">
		<div class="div">
			<h2 class="auth_item1">
				<label for="pw">비밀번호</label>
			</h2>
			<input type="password" name=pw1 minlength=4 maxlength=15 size=7 placeholder="(4~15자리)" />
			<input type="password" name=pw2 size=7 placeholder="재입력" />
			<input name=b1 type=submit value="확 인">
		</div>
		</form> 
		<div class="div">
			<h2 class="auth_item1">
				<label for="rank">직급</label>
			</h2>
			<input id="rank" name="rank" type="text" maxlength=5 placeholder="직급을 입력해주세요." /><br />
		</div>
		<div class="div">
			<h2 class="auth_item1">
				<label for="phone">핸드폰번호</label>
			</h2>
			<input id="phone" name="phone" type="text" maxlength=11 placeholder=" 핸드폰번호를 입력해주세요." /> <br />
		</div>
		<div class="div">
			<h2 class="auth_item1">
				<label for="name">이름</label>
			</h2>
			<input id="name" name="name" type="text" maxlength=5 placeholder="이름을 입력해주세요." /><br />
		</div>
		
		<button id="JOIN" onclick="insJoin()">회원가입</button>
	</div>
</body>

<script>

	function insJoin(){
		var hpCode = document.getElementsByName("hpCode")[0];
		var id = document.getElementsByName("id")[0];
		var pw = document.getElementsByName("pw1")[0];
		var rank = document.getElementsByName("rank")[0];
		var phone = document.getElementsByName("phone")[0];
		var name = document.getElementsByName("name")[0];
		var jCode = document.createElement("input");
			jCode.value = "A";
			jCode.name = "jCode";
			
			hpCode.name = "aHpCode";
			id.name = "aId";
			pw.name = "aPw";
			rank.name = "aRank";
			phone.name = "aPhone";
			name.name = "aName";
		
		var form = document.createElement("form");
		form.action = "AJOIN";
		form.method = "post";
		
		form.appendChild(hpCode);
		form.appendChild(id);
		form.appendChild(pw);
		form.appendChild(rank);
		form.appendChild(phone);
		form.appendChild(name);
		form.appendChild(jCode);
		
		document.body.appendChild(form);
		form.submit();
	}
	
	function checkPw(it) {
		if (it.pw1.value == it.pw2.value) {
			alert("비밀번호가 일치합니다.");
			return false;
		} else {
			alert("비밀번호가 일치하지않습니다. 올바르게 입력해주세요.");
			return false;
		}
	}
</script>
</html>