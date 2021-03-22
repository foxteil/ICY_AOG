<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.admin_dtn2 {
	background-color: gold;
	line-height: 2cm;
	margin: 10px;
	display: flex;
	padding: 21px;
	width: 11.0cm;
	height: 2cm;
	border-radius: 22px;
	position: relative;
	left: 41px;
	color: white;
	font-size: 34pt;
	text-align: center;
	font-weight: bold;
	display: none;
}

.stfupdate {
	
	line-height: 1cm;
	
	width: 3cm;
	border-radius: 22px;	
	left: 1000px;
	
	font-size: 18pt;

	font-weight: bold;
	display: none;
}

.admin_dtn3 {
	background-color: gold;
	line-height: 2cm;
	margin: 10px;
	display: flex;
	padding: 21px;
	width: 11.0cm;
	height: 2cm;
	border-radius: 22px;
	position: relative;
	left: 41px;
	color: white;
	font-size: 34pt;
	text-align: center;
	font-weight: bold;
	display: none;
}

.am {
	left: 164px;
	top: -30px;
	left: 164px;
	width: 1.5cm;
	height: 1cm;
	fontSize: 20px;
	backgroundColor: "#6182D6";
	fontWeight: "bolder";
	color: "White";
	margin: "0px 9px";
}

.admi {
	line-height: 2cm;
	margin: 10px;
	display: flex;
	height: 2cm;
	border-radius: 22px;
	position: relative;
	font-size: 18pt;
	text-align: center;
	border: 1px solid black;
	border-width: 3px thin;
	display: block;
}

}
.admin {
	position: relative;
	font-size: 34pt;
	text-align: center;
}

.addstf {
	display: none;
}
</style>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/admin.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>메인페이지</title>
</head>
<body>

	<div id="admin-box">

		<a id="little"> <img src="/resources/img/gtg_main.png">
		</a>
		<div class="admin_title">
			<h2 class="admin_btn1" id="RESERVELIST">예약리스트</h2>
			<h2 class="admin_btn1" id="HPREVIEW" onClick="doDisplay(this)">병원리뷰</h2>
			<h2 class="admin_btn1" id="SCHEDULEFORM" onClick="set1()">
				<input type="hidden" value="2" id="hpSch"></input>일정표
			</h2>
			<h2 class="admin_btn1" id="DRINFOS" onClick="set()">
				<input type="hidden" value="3" id="hpBasic"></input>기본
			</h2>
		</div>
		<div id="desk"
			style="background-color: white; width: 1900px; height: 500px; margin-left: 30px; display: inline-table;">
			<div class="addstf" id="ROLL"
				style="font-size: 30px 1 px solid; width: 500px; height: 400px; text-align: center;">

				<div id="joinform" style="border: 1px;">
					<table style="font-size: 30px;">
						<tr>
							<td>직원이름</td>
							<td><input type="text" name="stfName"
								placeholder="직원이름을 입력해주세요" ;  /></td>
						</tr>
						<tr>
							<td>직원아이디</td>
							<td><input type="text" name="stfCode"
								placeholder="직원아이디를 입력해주세요" ;  /></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="stfPw"
								placeholder="비밀번호를 입력해주세요" ; /></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" id="pwCheck"
								placeholder="비밀번호 확인" ; /></td>
						</tr>
						<tr>
							<td>직업</td>

							<td><select name="stfRank" style="font-size: 30px;">

									<option>==선택==</option>

									<option>의사</option>

									<option>원무과장</option>

									<option>간호사</option>

							</select></td>
						</tr>
						<tr>
							<td>핸드폰번호</td>
							<td><input name="stfPhone" type="text" name="user_num"
								placeholder="핸드폰번호를 입력해주세요"; ></td>
						</tr>
						<tr align="center">

							<td colspan="2">

								<button type="submit" onClick="submit()">등록</button>
								<button type="reset">취소</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
			
				<div id="adminCheck" style="display: inline-flex  ;">
					<h2 class="stfupdate" id="ENROLL">
						<input type="hidden" value="직원추가" onClick="addmin(this)"><img  src="resources/img/plus.png">
					</h2>
					<h2 class="stfupdate" id="DELENROLL">
						<input type="hidden" value="직원삭제" onClick="deletestf(this)" ><img  src="resources/img/manus.png">
					</h2>
					<h2 class="stfupdate" id="UPDATEROLL">
						<input type="hidden" value="직원변경" onClick="updatestf(this)"><img  src="resources/img/aaa.png">
					</h2>
				</div>
				
			
			
			
			<div id="pwupdate" style=" display:none ;">
					<table style="font-size: 30px;">					
						<tr>						
							<td>직원이름</td>
							<td><input type="text" name="stfName"
								placeholder="직원이름을 입력해주세요";  /></td>
						</tr>
						<tr>
							<td>직원아이디</td>
							<td><input type="text" name="stfCode"
								placeholder="직원아이디를 입력해주세요" ;  /></td>
						</tr>
						<tr>
							<td>비밀번호변경</td>
							<td><input type="password" name="stfPw"
								placeholder="비밀번호를 입력해주세요" ; /></td>
						</tr>
						<tr>
							<td>비밀번호변경 확인</td>
							<td><input type="password" id="check"
								placeholder="비밀번호 확인"; /></td>
						</tr>
						<tr>
							<td>직급변경</td>

							<td><select name="stfRank" style="font-size: 30px;">

									

									<option>의사</option>

									<option>원무과장</option>

									<option>간호사</option>

							</select></td>
							
						</tr>						

								
						
					</table>
					<button type="submit" onClick="sub()">등록</button>
								<button type="reset">취소</button>
				</div>
		</div>
		<div class="admin_title">
			<h2 class="admin_dtn2 " id="INSENROLLFORM" onClick="amupInfo(this)">관리자변경</h2>
			<h2 class="admin_dtn2" id="DRINFO" onClick="drupInfo(this)">의사정보추가변경</h2>
			<h2 class="admin_dtn2" id="HPINFO" onClick="hpupInfo(this)">병원정보변경</h2>
		</div>
	</div>
	
	
	<div class="admin_title">
		<h2 class="admin_dtn3 " id="kkk" onClick="amupInfo(this)">의사스케쥴</h2>
		<h2 class="admin_dtn3" id="ddd" onClick="drupInfo(this)">병원전체휴진</h2>
	</div>
	
	
	
 <div style="margin:10% 10% 10% 10%; display:none ;" id ="hpimage" >
         <!--  파일첨부 -->
         <form  action="/upload" method="post"  enctype="multipart/form-data">
             <input type="file" name="hpImg" img src="resources/img/search.png"/>
             <button class="btn btn-primary btn-sm"  type="button"	onClick="uploadClick()"  value="업로드"></button>
         </form>
     </div>
 
<div id="Ypark" style="font-size: 50px; display:none    ; float: right;">		
		<p>병원주차장 변경</p>
		<p>
		주차장 있음
		<input type="radio" name="hpParks" style="width:30px;height:30px;border:1px;" value="Y">
		</p>
		<p>
			주차장 없음 
			<input type="radio" name="hpParks" checked="checked" style="width:30px;height:30px;border:1px;" value="N">
		</p>
		<button type="submit" onClick="YandNpark()" style="font-size: 40px;">등록</button>
		<button type="reset" style="font-size: 40px;">취소</button>
</div>
	
	<div id="info"
		style="display: none; word-spacing: 200px; display: none; font-size: 30px; width: auto; position: inherit;">
		<table>
		<tr>
			<th>직급</th>
			<td id="RANK"></td>
		</tr>

		<tr>
		
			<th style="font-size:40px;">이름</th>
			<td id="NAME" value="이름"></td>
		</tr>

		<tr>
			<th>아이디</th>
			<td id="ID"></td>

		</tr>
		</table>
	</div>
	
	
	
	


	

	 
	
</body>
		

<script>
//직원변경 전송
function sub(){ 
	
let a=document.getElementsByName("stfName")[1];
 let b=document.getElementsByName("stfCode")[1];
 let c=document.getElementsByName("stfPw")[1];
 let d=document.getElementsByName("stfRank")[1];
 let c1=document.getElementById("check")[0];
if(c!=c1){
	alert("비밀번호를 확인해주세요");
	return false;
}else
	alert("비밀번호일치");
	return true;
	let form = document.createElement('form');
	form.action = "UPDATESTF?&hpCode=1234512350";
	
	form.method = "POST";
	document.body.appendChild(form);
	form.appendChild(a);
	form.appendChild(b);
	form.appendChild(c);
	form.appendChild(d);
	
	form.submit();
}

//직원변경 폼 불러오기 
function updatestf(){	
var con=confirm("직원정보 변경페이지로 이동하시겠습니까?");
if (con==true) {
    alert('이동합니다.');
    
 }
 else {
   
    return false;
 }
	document.getElementById("ENROLL").style.display = "none";
	let stfCode="staff06";
	document.getElementById("info").style.display = "none";
 	document.getElementById("pwupdate").style.display ="block";
 	
 		
          
     
   
 }



// 업로드 
function uploadClick(){
  	let  hpimage = document.getElementsByName = ("hpImg")[0];
	let form = document.createElement('form');
	form.action = "UPDATEHP";
	form.method = "POST";
	document.body.appendChild(form);
	alert(hpimage);
	form.appendChild(hpimage);

	form.submit();
}

//병원주차 전송
	function YandNpark() {
		var radio_btn = document.getElementsByName("hpParks");

		let a = document.createElement("input");
		a.name = "hpPark";
		//라디오 버튼이 체크되었나 확인하기 위한 변수
		var radio_btn_check = 0;
		for (var i = 0; i < radio_btn.length; i++) {
			//만약 라디오 버튼이 체크가 되어있다면 true
			if (radio_btn[i].checked == true) {
				//라디오 버튼 값
				alert(radio_btn[i].value);
				//라디오 버튼이 체크되면 radio_btn_check를 1로 만들어준다.
				radio_btn_check++;
				a.value = radio_btn[i].value;
			}
		}

		if (radio_btn_check == 0) {
			alert("라디오 버튼을 선택해주세요");
			return;
		}

		let form = document.createElement('form');
		form.action = "HPINFOFORM?hpCode=1234512351";
		form.method = "POST";
		document.body.appendChild(form);
		form.appendChild(a);

		form.submit();

	}
	//직원등록 전송
	function submit() {
		
		let a = document.getElementsByName("stfRank")[0];
		let b = document.getElementsByName("stfName")[0];
		let c = document.getElementsByName("stfPw")[0];
		let c1=document.getElementById("pwCheck")[0];
		if(b=b){
		 alert("직원아이디 중복입니다 다른 아이디를 이용해주세요");
		 return false;
		}else{
		
			return true;	
		}
		
		if( c != c1 ) {
	        alert("비밀번호가 일치 하지 않습니다");
	        return false;
	      } else{
	        alert("비밀번호가 일치합니다");
	        return true;
	      }

	    
		let d = document.getElementsByName("stfCode")[0];
		let e = document.getElementsByName("stfPhone")[0];

		let form = document.createElement('form');

		form.action = "ROLL?hpCode=1234512350";
		form.method = "POST";
		document.body.appendChild(form);
		form.appendChild(a);
		form.appendChild(b);
		form.appendChild(c);
		form.appendChild(d);
		form.appendChild(e);

		form.submit();

	}

	//직원등록폼 버튼 

	function addmin() {
		var con=confirm("직원 등록 페이지로 이동하시겠습니까?");
		if (con==true) {
		    alert('이동합니다.');
		    
		 }
		 else {
		   
		    return false;
		 }
		stf = document.getElementById("desk");
		document.getElementById("joinform");

		stf.appendChild(joinform);

		document.getElementById("info").style.display = "none";
		document.getElementById("ENROLL").style.display = "none";
		document.getElementById("UPDATEROLL").style.display = "none";
		document.getElementById("DELENROLL").style.display = "none";
		document.getElementById("kkk").style.display = 'none';
		document.getElementById("ddd").style.display = 'none';

	}

	function set1() {

		document.getElementById("SCHEDULEFORM").addEventListener("click",
				displayDate1);

	}
	
	function displayDate1() {
		let a = document.getElementById("INSENROLLFORM");
		a.style.display = 'none';
		document.getElementById("DRINFO").style.display = 'none';
		document.getElementById("HPINFO").style.display = 'none';
		document.getElementById("kkk").style.display = 'block';
		document.getElementById("ddd").style.display = 'block';
		document.getElementById("ENROLL").style.display = "none";
		document.getElementById("UPDATEROLL").style.display = "none";
		document.getElementById("DELENROLL").style.display = "none";
		document.getElementById("ROLL").style.display = "none";
	}

	function set() {
		document.getElementById("DRINFOS").addEventListener("click",
				displayDate);

	}
	function displayDate() {
		document.getElementById("INSENROLLFORM").style.display = 'block';
		document.getElementById("DRINFO").style.display = 'block';
		document.getElementById("HPINFO").style.display = 'block';

		document.getElementById("kkk").style.display = 'none';
		document.getElementById("ddd").style.display = 'none';

	}
	//의사정보 = 이미지,예약가능인원,
function drupInfo(opt) {

		var drPart = "14";
		var hpCode = "1234512350";

		var hpTmcode = "b";

		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				console.log(jsonData);
				alert(jsonData);
				let i;
				var rjson = JSON.parse(jsonData);
				let bc = document.createElement("button");
				bc.style.fontSize = "50px";
				bc.textContent = "확인";
		let	asd =document.getElementById("info");
		
		document.getElementById("Ypark").style.display = "none";
				for (i = 0; i < rjson.length; i++) {
					let div = document.getElementById("desk");
					let b = document.createElement("div");
					b.className = [i];
					//b.style.display="none";
					let c = document.createElement('div');
					let a = document.createElement("div");
					let in1 = document.createElement("button");

					in1.className = "button" + [ i ];
					in1.addEventListener('click', function() {
						UPDR();
					});

					in1.style.fontSize = "50px";

					let in3 = document.createElement("input");
					in3.type = "number";
 					in3.style.fontSize = "30px";
					in3.id = "drlimit";
//					in3.style.display = "none";
					let in2 = document.createElement("img");
 					in2.src = "/resources/img/doctor.png";
 					in2.name = "drImg";
 					in2.id = "drImg";
					//in2.style.display = "none";

					in1.textContent = rjson[i].drName;
					in2.textContent = rjson[i].drImg;
					in3.value = rjson[i].drsLimit;

					c.appendChild(in1);
					b.appendChild(in2);
					b.appendChild(in3);
					div.appendChild(a);
					div.appendChild(b);
					div.appendChild(c);
					div.appendChild(bc);
				
				}

			}
			;

		};

		request.open("POST", "DRINFO", true)
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=DRINFO&drPart=" + drPart + "&hpCode=" + hpCode
				+ "&hpTmcode=" + hpTmcode);

	}
	//병원 정보
	function hpupInfo(opt) {
		var hpCode = "3179029191";

		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				console.log(jsonData);
				alert(jsonData);
				document.getElementById("joinform").style.display = "none";
				document.getElementById("info").style.display = "none";
				document.getElementById("ENROLL").style.display = "none";
				document.getElementById("UPDATEROLL").style.display = "none";
				document.getElementById("DELENROLL").style.display = "none";
				document.getElementById("Ypark").style.display = "block";
				document.getElementById("hpimage").style.display = "block";
				let rjson = JSON.parse(jsonData);

				let div = document.getElementById("desk");
				
				
				Ypark.texContent = rjson[0].hpPark;

				div.appendChild(Ypark);
				div.appendChild(hpimage);

			}

		};
		request.open("POST", "HPINFO", true)
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=HPINFO&hpCode=" + hpCode);

	}
	//관리자 정보
	function amupInfo() {
		var hpCode = "1234512350";
		var stfName = "이현서";
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				console.log(jsonData);
				alert(jsonData);
				let rjson = JSON.parse(jsonData);

				alert(rjson[1].stfRank);
				document.getElementById("ENROLL").style.display = "block";
				document.getElementById("ENROLL").addEventListener("click",
						addmin);
				document.getElementById("UPDATEROLL").style.display = "block";
				document.getElementById("UPDATEROLL").addEventListener("click",
						updatestf);
				document.getElementById("DELENROLL").style.display = "block";
			
				document.getElementById("Ypark").style.display = "none";
				var e = document.getElementById("adminCheck");
			
				stf = document.getElementById("desk");
				x = document.getElementById("info").style.display = "block";
				
				for (i = 0; i < rjson.length; i++) {

					a = document.createElement('div');
					e=document.createElement("button");

					a.style.width = " 800px";
					a.style.height = "100px";
			
					let bc ="NAME:"+""+ rjson[i].stfName;
					
					let bd = "ID.CODE:"+rjson[i].stfCode;
					let b = "RANK:"+rjson[i].stfRank;
					a.textContent = b + bc + bd ;
					
					stf.appendChild(info);
					
					info.appendChild(a);

				}

			}

		};
		request.open("POST", "INSENROLLFORM", true)
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=INSENROLLFORM&hpCode=" + hpCode + "&stfName="
				+ stfName);
	}

</script>
</html>