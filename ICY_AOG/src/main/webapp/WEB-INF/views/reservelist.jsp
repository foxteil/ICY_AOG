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


<script type="text/javascript" >
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
			<div id="desklet2"></div>
			</div>
			<div id="desklet3"></div>
			</div>
			</div>
			<input type="hidden" value="1234512349" id="hpCode">		
</body>

<script>
var cal = document.getElementById("calendar");
var jData ;
var hpCode=document.getElementById("hpCode").value;
var drCode="1234512351";
var hpCode="1234512349";

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

function alertt(day){
	let tr = document.createElement("table");
	
	let dayN = day;
	
		/* 병원 일정에서 넘어온 달력*/
	if(jData[0].TMCODE != null){
		alert(dayN.className+"병원일정에서 넘어옴");

		
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

/*시간을 받고 병원코드와 시간코드를 보내주어 해당 시간에 예약자들을 확인*/
function list (time){
	alert("list 진입");
	alert(time);
	let request = new XMLHttpRequest();
	request.onreadystatechange = function(){
		if(this.readyState == 4 && this.status ==200){
			
			let ljson = decodeURIComponent(request.response);
			alert(ljson);
			let relist = JSON.parse(ljson);
			
	};
	request.open("POST", "TIMELIST", true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	request.send("sCode=TIMELIST&hpCode="+hpCode+"&TMCODE="+time);
	}
}


function relistst(relist){
	alert("relistst 진입");
	let desklet3 = document.getElementById("desklet3");
	let table = document.createElement("table");
	table.className="relists";
	
	for(i=0;i<relist.length;i++){
		let tr = document.createElement("tr");
		let td = document.createElement("td");
		let div1 = document.createElement("div");
		
		div1.textContent = relist[i].FNAME + relist[i].FPHONE;
		alert(relist);
		
		td.appendChild(div1);
		tr.appendChild(td);
		table.appendChild(tr);
		
		table.appendChild(tr);
	}
	desklet3.appendChild(table);
}


/*예약 관련*/
function reserveList(reserver){
		
	let request = new XMLHttpRequest();
	request.onreadystatechange = function(){
		if(this.readyState == 4 && this.status ==200){
			let jsonData = decodeURIComponent(request.response);
			
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


</script>
</html>