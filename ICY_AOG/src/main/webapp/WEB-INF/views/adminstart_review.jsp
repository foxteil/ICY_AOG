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

	
				<div id="desk1" style="display:none;"></div>
				<div id="desk2" style="display:none;"></div>
				<div id="desk3" style="display:none;"></div>
		
				<div style="width:30%;" id="desklet1">
			<div >
			<span id="desklet2"></span>
			</div>
			</div>
			<div id="desklet3"></div>
		</div>
			
		</div>
		
</body>

<script>
var cal = document.getElementById("calendar");
var jData ;

var hpCode="${aHpCode}"; //병원 코드
var rInfo = '${rList}'; //해당 병원 리뷰
 rList = JSON.parse(rInfo);




let msg = '${msg}';
if (msg == ''){
	
}else{
	alert(msg);
}

var days ;
var D= new Array();
var count = 0;

function hpReview(info){
 			let div2 = document.getElementById("desk2");
 			
 			let d1 = document.getElementById("desk1");
			let d3 = document.getElementById("desk3");
			let dl2 = document.getElementById("desklet2");
			d1.style="display:none";
			d3.style="display:none";
 			div2.style="display:block";

 			for(i=0;i<rList.length;i++){
 				let d2 = document.createElement("div");
 				let inp2 = document.createElement("div");
 				inp2.textContent=rList[i].rvDate+" 리뷰 :" +rList[i].rvId+" 평점 :" +rList[i].rvGrade +" 코멘트"+rList[i].rvComment;
 				d2.appendChild(inp2);
 				div2.appendChild(d2);
 			}
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
function reserve(info){
	let form = document.createElement('form');
	let urls = "?sCode="+info.id+"&hpCode="+hpCode;
	
	form.action = info.id+urls;
	form.method="POST";	

	document.body.appendChild(form);
	
	form.submit();
}




</script>
</html>