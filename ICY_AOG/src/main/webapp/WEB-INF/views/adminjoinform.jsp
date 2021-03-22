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
		<input class="in2" id="hpCode" name="hpCode" type="hidden" maxlength=10 value='${param.aHpCode}${aHpCode}' /><br />
		<input class="in2" id="hpImg" name="hpImg" type="hidden" maxlength=10 value='${aHpImg}' /><br />
		
		<div class="div">
			<h2 class="auth_item1">
				<label for="pw">병원명</label>
			</h2>
			<input class="in2" id="hpName" name="hpName" type="text" value='${param.aHpName}' readonly /><br />
		</div>
		<div class="div">
			<h2 class="auth_item1">
				<label for="pw">병원주소</label>
			</h2>
				<input class="in2" type="text" name="hpAddr" id="hpAddr" value='${param.aHpAddr}' readonly ><br>
		</div>
		
		<div class="div">
			<h2 class="auth_item1">
				<label for="pw">병원 번호</label>
			</h2>
			<input class="in2" id="hpPhone" name="hpPhone" type="text" required placeholder="병원 전화번호를 입력해주세요." value="${aHpPhone}" /><br />
		</div>
		<form style="position: inline-block;" id="upload" action="uploadA" method="post" enctype="multipart/form-data">
			<div class="div">
			<h2 class="auth_item1">
				<label for="pw">병원이미지</label>
			</h2>
				<input style="height:42px;" class="in2" type="file" name='file'>
				<input type='submit' onClick="upload();" value="저장"></input>
			</div>
		</form>
		<div class="div">
			<h2 class="auth_item1">
				<label for="pw">주차</label>
			</h2>
			<input class="in5" type="radio" id="hpParkY" name="hpPark" value="Y">
 			<label for="Y">있음(Y)</label>
  			<input class="in5" type="radio" id="hpParkN" name="hpPark" value="N">
 			<label for="N">없음(N)</label><br>
		</div>
		<div class="div">
			<h2 class="auth_item1">
				<label for="pw">주변지하철</label>
			</h2>
			<input class="in2" id="hpSubway" name="hpSubway" type="text" required placeholder="주변 지하철역을 입력해주세요." /><br />
		</div>
		<div class="div">
			<h2 class="auth_item1">
				<label for="pw">해시태그</label>
			</h2>
			<input class="in3-1" id="hpHt1" name="hpHt1" type="text" placeholder="해시태그1" />
			<input class="in3-1" id="hpHt2" name="hpHt2" type="text" placeholder="해시태그2" />
			<input class="in3-1" id="hpHt3" name="hpHt3" type="text" placeholder="해시태그3" />
		</div>
		<div class="div">
			<h2 class="auth_item2">
				<label for="id">직원ID</label>
			</h2>
			<input class="in2" id="id" name="id" type="text" maxlength=20 required placeholder="아이디를 입력해주세요." /> <br />
		</div>
		<form action="" method=post onSubmit="return checkPw(this);">
		<div class="div">
			<h2 class="auth_item2">
				<label for="pw">비밀번호</label>
			</h2>
			<input class="in3" id="pw" type="password" name=pw1 minlength=4 maxlength=15 size=7 required placeholder="(4~15자리)" />
			<input class="in3" type="password" name=pw2 size=7 placeholder="재입력" />
			<input class="in4" name=b1 type=submit value="확 인">
		</div>
		</form> 
		<div class="div">
			<h2 class="auth_item2">
				<label for="rank">이름</label>
			</h2>
			<input class="in2" id="name" name="name" type="text" maxlength=5 placeholder="이름을 입력해주세요." /><br />
		</div>
		<div class="div">
			<h2 class="auth_item2">
				<label for="phone">핸드폰번호</label>
			</h2>
			<input class="in2" id="phone" name="phone" type="text" maxlength=11 placeholder=" 핸드폰번호를 입력해주세요." /> <br />
		</div>

			<div class="div">
			<h2 class="auth_item2">
				<label for="name">직급</label>
			</h2>
			<input class="in2" id="rank" name="rank" type="text" maxlength=5 required placeholder="직급을 입력해주세요." /><br />
			<button type="submit" id="JOIN" onclick="insJoin()">회원가입</button>
		</div>
		<input type="hidden" id="getHpInfo">
	</div>
	<div>${aHpImg}</div>
	<div>${aHpCode}</div>
</body>

<script>
	function upload(){
		alert("upload펑션 작동");
		
		var hpCode = document.getElementsByName("hpCode")[0];
		hpCode.name = "aHpCode";
		var hpName = document.getElementsByName("hpName")[0];
		hpName.name ="aHpName";
		var hpAddr = document.getElementsByName("hpAddr")[0];
		hpAddr.name = "aHpAddr";
		var hpPhone = document.getElementsByName("hpPhone")[0];
		hpPhone.name ="aHpPhone";
		
		var form = document.getElementById("upload");
		
		form.appendChild(hpCode);
		form.appendChild(hpName);
		form.appendChild(hpAddr);
		form.appendChild(hpPhone);
		
		document.body.appendChild(form);
		form.submit();
		return false;
	}
   
	function insJoin() {
		//required 유효성검사..모두 입력되었다면 else구문 넘어가서 관리자 회원가입 기능(db insert)실행.
		var inpHpPhone = document.getElementById("hpPhone");
		var inpHpSubway = document.getElementById("hpSubway");
		var inpId = document.getElementById("id");
		var inpPw = document.getElementById("pw");
		var inpRank = document.getElementById("rank");

		if (!inpHpPhone.checkValidity()) {
			alert("병원 번호를 입력해주세요.");
			return false;
		} else if (!inpHpSubway.checkValidity()) {
			alert("주변 지하철역을 입력해주세요.");
			return false;
		} else if (!inpId.checkValidity()) { 
			alert("직원ID를 입력해주세요.");
			return false;
		} else if (!inpPw.checkValidity()) {
			alert("비밀번호를 입력해주세요.");
			return false;
		} else if (!inpRank.checkValidity()) {
			alert("직급을 입력해주세요.");
			return false;
		} else {
			//HS 테이블 update
			var hpCode = document.getElementsByName("hpCode")[0];
			var hpParking = document.getElementsByName("hpPark");
			
			let isPark ;
			for (i=0;i<hpParking.length;i++){
				if(hpParking[i].checked){
					isPark = hpParking[i].value;
				}
			}
			var hpImg = document.getElementsByName("hpImg")[0];
			
			//SC 테이블 insert 
			var hpAddr = document.getElementsByName("hpAddr")[0];
			var hpName = document.getElementsByName("hpName")[0];
			var hpSubway = document.getElementsByName("hpSubway")[0];
			let scInfo = hpAddr.value +" "+ hpName.value+" " + hpSubway.value;
			
			//HP 테이블 update
			var hpPhone = document.getElementsByName("hpPhone")[0];
			
			//HT 테이블 insert
			var hpHt1 = document.getElementsByName("hpHt1")[0];
			var hpHt2 = document.getElementsByName("hpHt2")[0];
			var hpHt3 = document.getElementsByName("hpHt3")[0];
			let HtInfo = hpHt1.value +" "+ hpHt2.value+" " + hpHt3.value;
			
			//STF 인서트
			var id = document.getElementsByName("id")[0];
			var pw = document.getElementsByName("pw1")[0];
			var rank = document.getElementsByName("rank")[0];
			var phone = document.getElementsByName("phone")[0];
			var name = document.getElementsByName("name")[0];
			var jCode = document.createElement("input");
			jCode.value = "A";
			jCode.name = "jCode";
			jCode.type = "hidden";
			
			var ahp = document.createElement("input");
			ahp.name="aHpPark";
			ahp.type="hidden";
			ahp.value= isPark;
			
			hpCode.name = "aHpCode";
			hpName.name = "aHpName";
			hpAddr.name = "aHpAddr";
			hpPhone.name = "aHpPhone";
			hpImg.name = "aHpImg";
			
			hpSubway.name ="aHpSubway";
			hpHt1.name = "aHpHt1";
			hpHt2.name = "aHpHt2";
			hpHt3.name = "aHpHt3";

			id.name = "aId";
			pw.name = "aPw";
			name.name = "aName";
			phone.name = "aPhone";
			rank.name = "aRank";

			var form = document.createElement("form");
			form.action = "AJOIN";
			form.method = "post";

			form.appendChild(hpCode);
			form.appendChild(hpName);
			form.appendChild(hpAddr);
			form.appendChild(hpPhone);
			form.appendChild(hpImg);
			form.appendChild(ahp); // 주차장 Y N 라디오선택
			form.appendChild(hpSubway);
			form.appendChild(hpHt1);
			form.appendChild(hpHt2);
			form.appendChild(hpHt3);

			form.appendChild(jCode);
			form.appendChild(id);
			form.appendChild(pw);
			form.appendChild(name);
			form.appendChild(phone);
			form.appendChild(rank);

			document.body.appendChild(form);
			form.submit();
 		} //else 구문 끝
	}
	let tf ;
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