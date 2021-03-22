<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/admin.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<script src="/resources/js/scriptlet.js"></script>
<script src="/resources/js/jquery-3.5.1.min.js"></script>
<title>관리자 메인페이지</title>


<script type="text/javascript" language="javascript">
</script>
<style type="text/css">
        td{
            width: 30px;
            height: 30px;
            text-align: center;
            font-size: 20px;
            font-family: 굴림;
            border:2px border-color:#3333FF;
            border-radius: 8px;/*모서리 둥글게*/
        }
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
img#drImg {
    width: 100px;
}
span#desklet2 {
    display: flex;
}
div {
    width: max-content;
}

    </style>
</head>
<body>
	<div id="admin-box">
		<a id="little"> <img src="/resources/img/gtg_main.png">
		</a>
		<div class="admin_title">
			<h2 class="admin_btn1" id="RESERVELIST">예약리스트</h2>
		
		<button id="RESERVELIST" value="1234512350" onclick="reserveList(this)">자세히</button>
	
		
			<h2 class="admin_btn1" id="HPREVIEW" onClick="hpReview(this)">병원리뷰</h2>
			<h2 class="admin_btn1" id="SCHEDULEFORM" onClick="hpSch(this)"><input type="hidden" value="2" id="hpSch"></input>일정표</h2>
			<h2 class="admin_btn1" id="DRINFOS" onClick="set()">
				<input type="hidden" value="3" id="hpBasic"></input>기본
			</h2></div>
		<div id="desk" style="background-color: white; width:1900px; height:500px; margin-left:30px;">
			<div class="addstf" id="ROLL"
				style="font-size: 30px 1 px solid; width: 500px; height: 400px; text-align: center;">

				<div id="joinform" style="border: 1px;">
					<table style="font-size: 30px;">
						<tr>
							<td>직원이름</td>
							<td><input type="text" name="stfName"
								placeholder="직원이름을 입력해주세요"/></td>
						</tr>
						<tr>
							<td>직원아이디</td>
							<td><input type="text" name="stfCode"
								placeholder="직원아이디를 입력해주세요"/></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="stfPw"
								placeholder="비밀번호를 입력해주세요"/></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" id="pwCheck"
								placeholder="비밀번호 확인"  /></td>
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
								placeholder="핸드폰번호를 입력해주세요" ></td>
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
								placeholder="직원이름을 입력해주세요"  /></td>
						</tr>
						<tr>
							<td>직원아이디</td>
							<td><input type="text" name="stfCode"
								placeholder="직원아이디를 입력해주세요"  /></td>
						</tr>
						<tr>
							<td>비밀번호변경</td>
							<td><input type="password" name="stfPw"
								placeholder="비밀번호를 입력해주세요"  /></td>
						</tr>
						<tr>
							<td>비밀번호변경 확인</td>
							<td><input type="password" id="check"
								placeholder="비밀번호 확인" /></td>
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
		
				<div id="desk1" style="display:none;"></div>
				<div id="desk2" style="display:none;"></div>
				<div id="desk3" style="display:none;"></div>
		
				<div style="width:30%;" id="desklet1">
				<table id="calendar" border="3" align="center"  style="border-color:#3333FF; display:none; " >
    			<tr><!-- label은 마우스로 클릭을 편하게 해줌 -->
   			     <td><label onclick="prevCalendar()"><</label></td>
       			 <td align="center" id="tbCalendarYM" colspan="5">
      			  yyyy년 m월</td>
     			   <td><label onclick="nextCalendar()">></label></td>
			    </tr>
			    <tr>
			        <td align="center"><font color ="gold">일</font></td>
			        <td align="center" onClick="test(this)">월</td>
			        <td align="center" onClick="test(this)">화</td>
			        <td align="center" onClick="test(this)">수</td>
			        <td align="center" onClick="test(this)">목</td>
			        <td align="center" onClick="test(this)">금</td>
			        <td align="center" onClick="test(this)"><font color ="skyblue">토</font></td>
			    </tr> 
			</table>
			<div >
			<span id="desklet2"></span>
			</div>
			</div>
			<div id="desklet3"></div>
		</div>
				<div class="admin_title">
			<h2 class="admin_dtn2 " id="INSENROLLFORM" onClick="amupInfo(this)">관리자변경</h2>
			<h2 class="admin_dtn2" id="DRINFO" onClick="drupInfo(this)">의사정보추가변경</h2>
			<h2 class="admin_dtn2" id="HPINFO" onClick="hpupInfo(this)">병원정보변경</h2>
		</div>
		<div class="admin_title" id="desk_btn">
			<h3 class="admin_btn1 btn2" id="drSch" onClick="showHpDoc()" style="display:none" >의사 스케쥴</h3>
			<h3 class="admin_btn1 btn2" id="hpBreak" onClick="showHpSch()" style="display:none">병원 전체 휴진</h3>
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
		style="display: none; word-spacing: 2px; display: none; font-size: 30px; width: auto; position: inherit;">
		<table style="width:300px" id=drtable>
		<tr>
			<th id="RANK">직급</th>

			<th id="NAME">이름</th>
	
			<th id="ID">아이디</th>
		</tr>
		</table>
	</div>
		</div>
		
</body>

<script>
var cal = document.getElementById("calendar");
var jData ;

var hpCode="${aHpCode}"; //병원 코드

let msg = '${msg}';
if (msg == ''){
	
}else{
	alert(msg);
}
/*의사 스케쥴 변경 시작*/
 let doctors ;
function showHpDoc(){
	let request = new XMLHttpRequest();
	request.onreadystatechange = function(){
		if(this.readyState == 4 && this.status ==200){
			
			let docInfo = decodeURIComponent(request.response);
			alert(docInfo);
			doctors = JSON.parse(docInfo);
			
			
			
			for(i=0;i<doctors.length;i++){
				let desk = document.getElementById("desk");
				let doc = document.createElement("div");
				let data = doctors[i].drCode;
				doc.innerHTML = "Dr."+doctors[i].drName;
				
				doc.onclick = function() {showDrs(data)};
				desk.appendChild(doc);
			}
		}
	};
	request.open("POST", "SHOWDOC", true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	request.send("sCode=SHOWDOC&hpCode="+hpCode);
}
/*의사 스케쥴 표시*/
function showDrs(drcode){
	
	let request = new XMLHttpRequest();
	request.onreadystatechange = function(){
		if(this.readyState == 4 && this.status ==200){
			
			let drsInfo = decodeURIComponent(request.response);
			alert(drsInfo);
			doctors = JSON.parse(drsInfo);
			let drsDate = '${getDrsDay}';
			let drsDate2 = '${getDrsDay2}';
			showDRSsch(doctors);
			
		}
	};
	request.open("POST", "SHOWDOCTIME", true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	request.send("sCode=SHOWDOCTIME&hpCode="+hpCode+"&DRSdrCode="+drcode);
	
	
}

function showDRSsch(drsInfo){
	let desk2 = document.getElementById('desk2');
	desk2.style.display="block";
	for(i=0;i<drsInfo.length;i++){
		let div = document.createElement('div');
		div.innerHTML = drsInfo[i].drsDate+"일 / 가능인원"+drsInfo[i].drsAvail+"명 / 시간대 "+drsInfo[i].STIME;
		desk2.appendChild(div);
	}

}


/* 달력*/
function test(date){
	alert(date.textContent);
}
function showHpSch(jData){
	cal.style="display:block";
	buildCalendar();//
}

function reserveCal(jData){
	cal.style="display:block";
	buildCalendar();

	}
var days ;
var D= new Array();
var count = 0;

function alertt(day){
	//let tr = document.createElement("table");
	
	let dayN = day;
	let ddd ="0";
	if(dayN.className<10){
		ddd+=dayN.className;
		alert("ddd :"+ddd);
	}else{
		ddd=dayN.className;
		alert("ddd :"+ddd);
	}
	
	
		/* 병원 일정에서 넘어온 달력*/     
	if(jData[0].TMCODE != null){
		alert(dayN.className+"병원일정에서 넘어옴");
		dayN.bgColor = "#BE81F7";
		days=ddd;
		
		D[count]=days;
		count++;
		
		if(i==32){
			i+=1;
			let inp1 = document.createElement("input");
			inp1.type="button";
			inp1.value="휴진설정";
			inp1.onclick=function() {hpBreak()};
			let desk3 = document.getElementById("desk3");
			let div = document.createElement("div");
			div.appendChild(inp1);
			desk3.appendChild(div);
		}
// 		days[count]=days[i];
// 		count++;
		alert("days :"+days);
	
// 		window.name = "HPSCP"; //부모창 이름 설정
// 		var popUrl = "HPSCCHANGE?sCode=HPSCCHANGE&hpCode="+hpCode;	//팝업창에 출력될 페이지 URL
// 		var popOption = "width=400, height=400, , resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
// 			window.open(popUrl,"HPSCCHANGE",popOption);
		
		/* 예약자 리스트에서 넘어온 달력*/
	}else if(jData[0].REYEAR != null){
		alert(dayN.className+"예약자 리스트에서 넘어옴");
		
				/*색깔 입히기*/
			for(i=0;i<jData.length;i++){
				if(dayN.className == parseInt(jData[i].REDAY)){
				dayN.bgColor = "#FAF58C";
			}
		}
				let g = 0;
				let desklet2 = document.getElementById("desklet2");
				let table = document.createElement("table");
				table.className="retimetb";

			alert("비교전 확인 :"+ dayN.className);
		
				for(i=0;i<jData.length;i++){
					if(dayN.className == parseInt(jData[i].REDAY)){	
					
					let tr = document.createElement("tr");
					let td = document.createElement("td");
					let tmcode= jData[i].RETIME;
					
					td.innerHTML=jData[i].RESTART;
					td.id= i;
					td.addEventListener('click',function(){list(tmcode);});
					tr.appendChild(td);	
					
					table.appendChild(tr);

				}
			}
			desklet2.appendChild(table);
			alert("alertt 끝");
	}
}
function hpBreak(){
	for(i=0;i<D.length;i++){
		alert(D[i]);
	}
	let request = new XMLHttpRequest();
	request.onreadystatechange = function(){
		if(this.readyState == 4 && this.status ==200){
			
			let ljson = decodeURIComponent(request.response);
			alert(ljson);
		
		}
	};
	request.open("POST", "HPBREAK", true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	request.send("sCode=HPBREAK&hpCode="+hpCode+"&hpBrDay="+D);
	
}

/*시간을 받고 병원코드와 시간코드를 보내주어 해당 시간에 예약자들을 확인*/
function list (time){
	alert("list 진입");

	let request = new XMLHttpRequest();
	request.onreadystatechange = function(){
		if(this.readyState == 4 && this.status ==200){
			
			let ljson = decodeURIComponent(request.response);
			alert(ljson);
			let relist = JSON.parse(ljson);
			relistst(relist);
		}
	};
	request.open("POST", "RELIST", true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	request.send("sCode=RELIST&hpCode="+hpCode+"&TMCODE="+time);
	
}


function relistst(relist){
	alert("relistst 진입");
	let desklet3 = document.getElementById("desklet2");
	let table = document.createElement("table");
	table.className="relists";
	
	for(i=0;i<relist.length;i++){
		let tr = document.createElement("tr");
		let tr2 = document.createElement("tr");
		let tr3 = document.createElement("tr");
		let td = document.createElement("td");
		let td2 = document.createElement("td");
		let td3 = document.createElement("td");
		let inp1 = document.createElement("input");
		let inp2 = document.createElement("input");
		let div1 = document.createElement("div");
		let div2 = document.createElement("div");
		let div3 = document.createElement("div");
		let fajumin = relist[i].FAJUMIN.replace("+년","년");
		fajumin = fajumin.replace("년+","년 ");
		fajumin = fajumin.replace("월+","월 ");
		
		let jmin = relist[i].JUMIN;
		let DRCODE= relist[i].drCode;
		let TMCODE = relist[i].TMCODE;
		
		div3.style.border="1px solid black";
		div1.textContent ="예   약   자   | "+ relist[i].FNAME+"님 (" + relist[i].FPHONE+") ";
		div2.textContent ="생년월일 | "+ fajumin;
		inp1.type="button";
		inp1.value="예약 승인";
		inp1.onclick=function() {regist(jmin, DRCODE, TMCODE)};
		
		inp2.type="button";
		inp2.value="예약 취소";
		inp2.onclick=function() {cancle(jmin, DRCODE, TMCODE)};
		
		td.appendChild(div1);
		td2.appendChild(div2);
		td3.appendChild(inp1);
		td3.appendChild(inp2);
		tr.appendChild(td);
		tr2.appendChild(td2);
		tr3.appendChild(td3);
		div3.appendChild(tr);
		div3.appendChild(tr2);
		div3.appendChild(tr3);
		table.appendChild(div3);
	}
	desklet3.appendChild(table);
}
/*예약 상태 변경*/
function regist(jumin,DRCODE,TMCODE){

	let form = document.createElement("form");
	let inp1 = document.createElement("input");
	let inp2 = document.createElement("input");
	let inp3 = document.createElement("input");
	let inp4 = document.createElement("input");
	
	inp1.name="FAJUMIN";
	inp1.value=jumin;
	inp1.type="hidden";
	
	inp2.name="hpCode";
	inp2.value=hpCode;
	inp2.type="hidden";
	
	inp3.name="drCode";
	inp3.value=DRCODE;
	inp3.type="hidden";
	
	inp4.name="TMCODE";
	inp4.value=TMCODE;
	inp4.type="hidden";
	 
	let urls = "&FAJUMIN="+jumin+"&hpCode="+hpCode+"&drCode="+DRCODE+"&TMCODE="+TMCODE;

	let request = new XMLHttpRequest();
	request.onreadystatechange = function(){
		if(this.readyState == 4 && this.status ==200){
			
			let ljson = decodeURIComponent(request.response);
			alert(ljson);
			
		
		}
	};
	request.open("POST", "RESERVECHECK", true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	request.send("sCode=RESERVECHECK"+urls);
	
	
	
// 	form.appendChild(inp1);
// 	form.appendChild(inp2);
// 	form.appendChild(inp3);
// 	form.appendChild(inp4);
// 	document.body.appendChild(form);
		
// 	form.action="RESERVECHECK?sCode=RESERVECHECK";
// 	form.method="POST";
	
	
// 	form.submit();
	
}
/*예약 거절 */
function cancle(jumin,DRCODE,TMCODE){

	let form = document.createElement("form");
	let inp1 = document.createElement("input");
	let inp2 = document.createElement("input");
	let inp3 = document.createElement("input");
	let inp4 = document.createElement("input");
	
	inp1.name="FAJUMIN";
	inp1.value=jumin;
	inp1.type="hidden";
	
	inp2.name="hpCode";
	inp2.value=hpCode;
	inp2.type="hidden";
	
	inp3.name="drCode";
	inp3.value=DRCODE;
	inp3.type="hidden";
	
	inp4.name="TMCODE";
	inp4.value=TMCODE;
	inp4.type="hidden";
	 
	let urls = "&FAJUMIN="+jumin+"&hpCode="+hpCode+"&drCode="+DRCODE+"&TMCODE="+TMCODE;

	let request = new XMLHttpRequest();
	request.onreadystatechange = function(){
		if(this.readyState == 4 && this.status ==200){
			
			let ljson = decodeURIComponent(request.response);
			alert(ljson);
			
		
		}
	};
	request.open("POST", "REJECTU", true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	request.send("sCode=REJECTU"+urls);
}


/*예약 관련*/
function reserveList(reserver){
		
	let request = new XMLHttpRequest();
	request.onreadystatechange = function(){
		if(this.readyState == 4 && this.status ==200){
			let jsonData = decodeURIComponent(request.response);
			alert(jsonData);
			var rjson = JSON.parse(jsonData);
			
			jData = rjson;
			
			let div1 = document.getElementById("desk1");
			div1.style="display:block";
			
			let d2 = document.getElementById("desk2");
			let d3 = document.getElementById("desk2");
			let dl2 = document.getElementById("desklet2");
			d2.style="display:none";
			d3.style="display:none";
			
			cal.style="display:none";
			
			
			try{
				d2.removeChild(inp2);
				d3.removeChild(inp3);
			}catch (e){
				
			}
			
 			for(i=0;i<rjson.length;i++){
 				
 				let d1 = document.createElement("div");
 				let inp1 = document.createElement("div");
// 				inp1.textContent=rjson[i].REYEAR+"년 " +rjson[i].REMONTH+"월 " +rjson[i].REDAY +"일 ";
 				d1.appendChild(inp1);
 				div1.appendChild(d1);
 			}
 			reserveCal(jData);
		}
	};
	
	request.open("POST", "RESERVELIST", true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	request.send("sCode=RESERVELIST&hpCode="+hpCode);
	}

function hpReview(info){
	alert(info.id);
	let form = document.createElement('form');
	let URLS="?sCode="+info.id+"&hpCode="+hpCode;
	form.action = info.id+URLS;
	form.method="POST";
	document.body.appendChild(form);
	
	form.submit();
// 	request.open("POST", info.id, true);
// 	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
// 	request.send("sCode="+info.id+"&hpCode="+hpCode);
}
/*병원 스케쥴*/
function hpSch(info){
	let form = document.createElement('form');
	let urls = "?sCode="+info.id+"&hpCode="+hpCode;
	
	form.action = info.id+urls;
	form.method="POST";	

	document.body.appendChild(form);
	
	form.submit();
}


/* 상혁쓰 파트*/
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
				displayDate());

	}
	function displayDate() {
		document.getElementById("INSENROLLFORM").style.display = 'block';
		document.getElementById("DRINFO").style.display = 'block';
		document.getElementById("HPINFO").style.display = 'block';
		try{
		document.getElementById("kkk").style.display = 'none';
		document.getElementById("ddd").style.display = 'none';
		}catch(e){
			
		}
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
				bc.style.fontSize = "10px";
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

					in1.style.fontSize = "15px";

					let in3 = document.createElement("input");
					in3.type = "number";
 					in3.style.fontSize = "15px";
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
			
				let stf = document.getElementById("desk");
				x = document.getElementById("info").style.display = "block";
				
				
				let rank = document.getElementById("RANK");	
				let name = document.getElementById("NAME");
				let id = document.getElementById("ID");
				
				for (i = 0; i < rjson.length; i++) {
					a = document.createElement('div');
					aa = document.createElement('div');
					aaa = document.createElement('div');
					e=document.createElement("button");

					a.style.width = " 800px";
					a.style.height = "50px";
			
					let bc ="NAME: "+rjson[i].stfName;
					let bd = "ID.CODE: "+rjson[i].stfCode;
					let b = "RANK: "+rjson[i].stfRank;
					a.textContent = b;
					aa.textContent = bc;
					aaa.textContent = bd;
					rank.appendChild(a);
					name.appendChild(aa);
					id.appendChild(aaa);
					
					stf.appendChild(info);
					
// 					info.appendChild(a);
	
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