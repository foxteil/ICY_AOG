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
		<br />
		<div class="div">
			<h2 class="auth_item1">
				<label for="id">아이디</label>
			</h2>
			<input class="in2" id="id" type="text" name="id" maxlength=15 required placeholder="아이디를 입력해주세요." value="${mId}" /> <br />
		</div>
		
		<form action="" method=post onSubmit="return checkPw(this);">
		<div class="div">
			<h2 class="auth_item1">
				<label for="pw">비밀번호</label>
			</h2>
			<input class="in3" id="pw" type="password" name=pw1 minlength=4 maxlength=15 size=7 required placeholder="(4~15자리)" />
			<input class="in3" type="password" name=pw2 size=7 placeholder="재입력" />
			<input class="in4" name=b1 type='submit' value="확 인">
		</div>
		</form> 
		
		<div class="div">
			<h2 class="auth_item1">
				<label for="name">이름</label>
			</h2>
			<input class="in2" id="name" type="text" name="name" maxlength=5 required placeholder="이름을 입력해주세요." /><br />
		</div>
		
		<form action="" method=post name=InputForm onSubmit="return check(this);">
			<div class="div">
				<h2 class="auth_item1">
					<label for="jumin">주민번호</label>
				</h2>
				 <input class="in3" id="jumin1" maxlength=6 name=idnum1 size=6 required placeholder="생년월일">
				 <input class="in3" id="jumin2" type="password" maxlength=7 name=idnum2 size=7 required placeholder="뒷자리">
				 <input class="in4" name=b1 type=submit value="확 인">
			</div>
		</form>
		
		<div class="div">
			<h2 class="auth_item1">
				<label for="phone">핸드폰번호</label>
			</h2>
			<input class="in2" id="phone" type="text" name="phone" maxlength=11 required placeholder="핸드폰번호를 입력해주세요." /> <br />
		</div>

		<div class="div">
			<h2 class="auth_item1">
				<label for="addr">주소</label>
			</h2>
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" name="addr" id="sample6_postcode" placeholder="우편번호">
				<input type="text" name="addr1" id="sample6_address" required placeholder="주소"><br>
				<input type="text" name="addr2" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text" name="addr3" id="sample6_extraAddress" placeholder="참고항목">
		</div>
		<br><br><br><br><br> 
		<div class="div">
			<a class="auth_item1" href="http://localhost/JOINFORM2">세대원추가</a>
			<br>
		</div>
		
		<button id ='uploadBtn' type=submit id="JOIN" onclick="insJoin();">회원가입</button>
	</div>
</body>

<script>	
	function insJoin(){
		//requierd 유효성검사..모두 입력되었다면 else구문 넘어가서 회원가입 기능(db insert)실행.
		var inpId = document.getElementById("id");
		var inpPw = document.getElementById("pw");
		var inpName = document.getElementById("name");
		var inpJumin1 = document.getElementById("jumin1");
		var inpJumin2 = document.getElementById("jumin2");
		var inpPhone = document.getElementById("phone");
		var inpAddr = document.getElementById("sample6_address");
		
		if(!inpId.checkValidity()){
			alert("아이디를 입력해주세요.");
			return false;
		}else if(!inpPw.checkValidity()){
			alert("비밀번호를 입력해주세요.");
			return false;
		}else if(!inpName.checkValidity()){
			alert("이름을 입력해주세요.");
			return false;
		}else if(!inpJumin1.checkValidity()){
			alert("주민번호 앞자리를 입력해주세요.");
			return false;
		}else if(!inpJumin2.checkValidity()){
			alert("주민번호 뒷자리를 입력해주세요.");
			return false;
		}else if(!inpPhone.checkValidity()){
			alert("핸드폰 번호를 입력해주세요.");
			return false;
		}else if(!inpAddr.checkValidity()){
			alert("주소를 입력해주세요.");
			return false;
		}else{
			var fName = document.createElement("input");
				fName.value = "${fName}";
				fName.name = "fName";
			var fJumin = document.createElement("input");
				fJumin.value = "${fJumin}";
				fJumin.name = "fJumin";
			var fPhone = document.createElement("input");
				fPhone.value = "${fPhone}";
				fPhone.name = "fPhone";
			var fAddr = document.createElement("input");
				fAddr.value = "${fAddr}";
				fAddr.name = "fAddr";
				
			var id = document.getElementsByName("id")[0];
			var pw = document.getElementsByName("pw1")[0];
			var name = document.getElementsByName("name")[0];
			var jumin = document.getElementsByName("idnum1")[0]; // 생년월일
			var phone = document.getElementsByName("phone")[0];
			var addr = document.getElementsByName("addr")[0];
			var jCode = document.createElement("input");
				jCode.value = "U";
				jCode.name = "jCode";
			var img = document.createElement("input");
			jCode.value = "${savedName}";
			jCode.name = "aHpImg";
	// 개인정보법으로 인하여 주민번호 앞자리만 넘기고 뒷자리는 시퀀스로 대체한다.
	// 		var jumin = document.getElementsByName("idnum1")[0].value 
	// 		var juminSum = document.getElementsByName("idnum1")[0].value +
	// 						document.getElementsByName("idnum2")[0].value;
	// 			jumin.value = juminSum;
			jumin.name = "mJumin";
			id.name = "mId";
			pw.name = "mPw";
			name.name = "mName";
			phone.name = "mPhone";
			addr.name = "mAddr";
				
			var addrSum = document.getElementsByName("addr1")[0].value + ", "
						+ document.getElementsByName("addr2")[0].value
						+ document.getElementsByName("addr3")[0].value;
			addr.value = addrSum;
				
			var form = document.createElement("form");
			form.action = "JOIN";
			form.method = "post";
			form.enctype = "multipart/form-data";
			
			form.appendChild(fName);
			form.appendChild(fJumin);
			form.appendChild(fPhone);
			form.appendChild(fAddr);
			
			form.appendChild(id);
			form.appendChild(pw);
			form.appendChild(name);
			form.appendChild(jumin);
			form.appendChild(phone);
			form.appendChild(addr);
			form.appendChild(jCode);
			form.appendChild(img);
			
			document.body.appendChild(form);
			form.submit();
 		}
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
<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</html>