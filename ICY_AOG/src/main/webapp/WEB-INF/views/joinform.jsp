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
<!-- 		<h1 class="auth_title"> -->
<!-- 			<label>회원가입</label> -->
<!-- 		</h1> -->
		<br />
		<div class="div">
			<h2 class="auth_item1">
				<label for="id">아이디</label>
			</h2>
			<input id="id" type="text" name="id" maxlength=15 placeholder="아이디를 입력해주세요."  /> <br />
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
				<label for="name">이름</label>
			</h2>
			<input id="name" type="text" name="name" maxlength=5 placeholder="이름을 입력해주세요." /><br />
		</div>
		
		<form action="" method=post name=InputForm onSubmit="return check(this);">
			<div class="div">
				<h2 class="auth_item1">
					<label for="jumin">주민번호</label>
				</h2>
				 <input maxlength=6 name=idnum1 size=6 placeholder="생년월일">
				 <input type="password" maxlength=7 name=idnum2 size=7 placeholder="뒷자리">
				 <input name=b1 type=submit value="확 인">
			</div>
		</form>
		
		<div class="div">
			<h2 class="auth_item1">
				<label for="phone">핸드폰번호</label>
			</h2>
			<input id="phone" type="text" name="phone" maxlength=11 placeholder="핸드폰번호를 입력해주세요." /> <br />
		</div>

	

		<div class="div">
			<h2 class="auth_item1">
				<label for="addr">주소</label>
			</h2>
			<input id="addr" type="text" name="addr" maxlength=100 placeholder="주소를 입력해주세요." /> <br />
		</div>
		
		<button id="JOIN" onclick="insJoin()">회원가입</button>
	</div>
</body>

<script>
	function insJoin(){
		var id = document.getElementsByName("id")[0];
		var pw = document.getElementsByName("pw1")[0];
		var name = document.getElementsByName("name")[0];
		var jumin = document.getElementsByName("idnum1")[0];
		var phone = document.getElementsByName("phone")[0];
		var addr = document.getElementsByName("addr")[0];
		var jCode = document.createElement("input");
			jCode.value = "U";
			jCode.name = "jCode";
		var juminSum = document.getElementsByName("idnum1")[0].value +
						document.getElementsByName("idnum2")[0].value;
			jumin.value = juminSum;
			jumin.name = "mJumin";
			id.name = "mId";
			pw.name = "mPw";
			name.name = "mName";
			phone.name = "mPhone";
			addr.name = "mAddr";
		
		var form = document.createElement("form");
// 		form.action = "JOIN?&jCode=U&mId="+id+"&mPw="+pw+"&mName="+name+"&mJumin="+jumin
// 					  +"&mPhone="+phone+"&mAddr="+addr;
		form.action = "JOIN";
		form.method = "post";
		
		form.appendChild(id);
		form.appendChild(pw);
		form.appendChild(name);
		form.appendChild(jumin);
		form.appendChild(phone);
		form.appendChild(addr);
		form.appendChild(jCode);
		
		document.body.appendChild(form);
		form.submit();
	}
	
	function checkPw(it){
		if(it.pw1.value == it.pw2.value){
			alert("비밀번호가 일치합니다.");
			return false;
		}else{
			alert("비밀번호가 일치하지않습니다. 올바르게 입력해주세요.");
			return false;
		}
	}
	
	function check(it){
		idnum=it.idnum1.value + it.idnum2.value;
		if(idnum_chk(idnum)){
			alert("주민번호가 틀리거나 입력하지 않았습니다.! 확인바랍니다.");
			it.idnum1.focus();
			return false;
		}
		alert("주민등록 번호가 확인 되었습니다.")
		return false;
	}
	function idnum_chk(it){
		idnumtot = 0;
		idnumadd = "234567892345";
		
		for(i=0;i<12;i++){
			idnumtot = idnumtot + parseInt(it.substring(i,i+1))
						* parseInt(idnumadd.substring(i,i+1));
		}
		idnumtot = 11 -(idnumtot%11);
		if(idnumtot==10){
			idnumtot=0;
		}else if(idnumtot==11){
			idnumtot=1;
		}
		if(parseInt(it.substring(12,13))!=idnumtot){
			return true;
		}
	}
</script>
</html>