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
			<h2 class="admin_btn1" id="SETTINGFORM" onclick="reserve(this)">예약리스트</h2>
		
	
		
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
var rInfo = '${rList}';
rList = JSON.parse(rInfo);

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
		alert("i 카운트="+i);
		if(i==32){
			i+=1;
			let inp1 = document.createElement("input");
			inp1.type="button";
			inp1.value="휴진설정";
			inp1.onclick=function() {hpBreak()};
			let desk3 = document.getElementById("desk");
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
function reserve(info){
	let form = document.createElement('form');
	let urls = "?sCode="+info.id+"&hpCode="+hpCode;
	
	form.action = info.id+urls;
	form.method="POST";	

	document.body.appendChild(form);
	
	form.submit();
}

function hpReview(info){
	alert(info.id);
	let form = document.createElement('form');
	let URLS="?sCode="+info.id+"&hpCode="+hpCode;
	form.action = info.id+URLS;
	form.method="POST";
	document.body.appendChild(form);
	
	form.submit();
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



/*병원 스케쥴    SCHEDULEFORM  */
function hpSch(info){       

			jData = rList;

	let show = document.getElementsByClassName("btn2")[0];
	let show2 = document.getElementsByClassName("btn2")[1];
	show.style="display:flex";
	show2.style="display:flex";

	
}






</script>
</html>