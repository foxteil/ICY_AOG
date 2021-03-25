<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reserve.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>회원가입</title>
</head>
<body onLoad="init()">
	<div id="box">
		<a id="little">
      		<img src="/resources/img/gtg_main.png">
   	    </a>
   	     <div class="span-hplist" style="width: 8.15cm;
    height: 6.64cm;
    position: relative;
    left: 5px;">
		<h1 class="finish_title">
			<label>예약접수완료</label>
		</h1>
		<div id="reserve" ></div>

		 </div>
		 
		<button class="res_btn" id="RESCHECK" onclick="reserve(this)">예약내역 확인하러가기</button>
		<button class="res_btn" id="/" onclick="reserve(this)">처음화면으로 돌아가기</button>
	</div>
</body>

<script>
var reInfo = JSON.parse('${gInfo}');



function init(){
	let res =  document.getElementById("reserve");
	
	let hpName = document.createElement('div');
	hpName.innerHTML = reInfo[0].hName;
	
	hpName.className = "reInfo";
	res.appendChild(hpName);
	alert(hpName);
	
	let drsDate = document.createElement('div');
	drsDate.innerHTML =reInfo[0].drDate;
	
	drsDate.className = "reInfo";
	res.appendChild(drsDate);
	
	let Name = document.createElement('div');
	Name.innerHTML =reInfo[0].fName;
	
	Name.className = "reInfo";
	res.appendChild(Name);
	
	
}



	function reserve(obj) {
		var form = document.createElement("form");
		form.action = obj.id;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
</script>
</html>