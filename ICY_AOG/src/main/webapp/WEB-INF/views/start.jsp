<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/resources/css/reserve.css">
	<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
	<title>메인페이지</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	

<title>메인페이지</title>		
</head>
<body  onLoad=init()>
	                                                                                                               
	<br>
	<br>			
	<div>
		<button class="btn" id="main" onclick="reserve(this)">로그아웃</button>
		<a id="main_logo" href="start.jsp"> <img src="/resources/img/gtg_main.png"
			style="width: 5cm; height: 5cm; position: relative; left: -45px; ">
		</a>
		
    	<select name="siName" id="si" style=" top: 50px;" onchange="guCheck(this)">
           <option value="지역" class="doctor-select" >지	  역 </option>     
        </select>       		
		<select name="guName" id="gu" style=" top: 50px;" onchange= "optionClick(this)">
           <option value="시군구" class="doctor-select" >시  군   구</option>
         
        </select>   
		<h2 class="reserve" id="ORDER" onclick="reserve(this)" style="cursor : pointer">
			예약하러가기
		</h2>
		<div class="mypage">
		<h2 class="my" id="RESCHECK" onclick="rescheck(this)"> 
			예약<br/>확인
		</h2>
		<h2 class="my" id="BOOKMARKFORM" onclick="bookmarklist(this)">
			관심<br/>병원
		</h2>
		<h2 class="my" id="MYPAGEFORM" onclick="mypage(this)">
			MY
		</h2>   
		<h2 class="my" id="RDETAIL" onclick="rdetail()"> 
			예약<br/>상세 (임시)
		</h2>
		</div>
	</div>
	


</body>

<script>
 
var idInfo = "${idInfo}";



function init(){
	
 
	var LInfo = JSON.parse('${sInfo}'); 
	
	if(LInfo[0].siName != null){
		let selection = document.getElementById('si');
		
	for(i=0;i<LInfo.length;i++){
		let options = document.createElement('option');
		
		options.value = LInfo[i].siName;
		options.innerHTML = LInfo[i].siName;
		
		selection.appendChild(options);
		}
	}
	
	
}

function guCheck(opt){
	
	
    var objSel = document.getElementById("gu");
    //alert(objSel.options[i].text +"//"+ objSel.options[i].value +"//"+ i);
    for(i=objSel.length; i>=0; i--){
      objSel.options[i]=null;
    }
	
	let gInfo;
	let sele= document. getElementById('si');
	
	let request = new XMLHttpRequest();
	 request.onreadystatechange = function(){
		 if(this.readyState == 4 && this.status == 200){
			 let jsonData = decodeURIComponent(request.response);
			 gInfo = JSON.parse(jsonData); 
			
			
			 if(gInfo[0].guName != null){
					let selection = document.getElementById('gu');
					
				for(i=0;i<gInfo.length;i++){
					let options = document.createElement('option');
					options.value = gInfo[i].guName;
					options.innerHTML = gInfo[i].guName;
					
					selection.appendChild(options);
					}
				}
		 }
	 };
	 request.open("POST", "GU",true);
	 request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	 request.send("sCode=GU&siNumber="+sele.value);
	

	
	 
	
	
}
let local;
let postnum;
let GuName;
function optionClick(opt){//구선택 
	
	
	local = document.getElementById("gu");
	let gu2 =local.value;
	GuName=gu2;
	
	
	let request = new XMLHttpRequest();
	 request.onreadystatechange = function(){
		 if(this.readyState == 4 && this.status == 200){
			 let jsonData = decodeURIComponent(request.response);
			postnum = JSON.parse(jsonData); 
			 
			 
			 let poin = document.createElement("input");
				poin.name = "post";
				//poin.value=po[].value;
				
		 }
	 };

	 request.open("POST", "GU2",true);
	 request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	 request.send("sCode=GU2&guName="+gu2);
	
}

function reserve(obj) {//예약하러가기 눌럿을때 
	

	let order =document.getElementById("ORDER");
	var form = document.createElement("form");	
	let id = document.createElement("Input");
	id.name = "Id";
	id.value = idInfo;
	id.type= "text";
	
	let gu = document.createElement("Input");
	gu.name = "guName";
	gu.value = GuName;
	gu.type = "text";

	
	form.action = "ORDER";
	form.method = "post";
	
	form.appendChild(id);
	form.appendChild(gu);
	document.body.appendChild(form);
	form.submit();  

	
}

function rescheck(obj) {
	var form = document.createElement("form");
	
	let id = document.createElement("Input");
	id.name = "Id";
	id.value = idInfo;
	form.appendChild(id);
	
	form.action = "RESCHECK";
	form.method = "post";

	document.body.appendChild(form);
	form.submit();
}

function bookmarklist() {
	var form = document.createElement("form");
	let id = document.createElement("Input");
	id.name = "Id";
	id.value = idInfo;
	form.appendChild(id);
	
	form.action = "BOOKMARKFORM";
	form.method = "post";
	document.body.appendChild(form);
	form.submit();
	
}

function mypage(obj) {
	var form = document.createElement("form");
	let id = document.createElement("Input");
	id.name = "Id";
	id.value = idInfo;
	form.appendChild(id);
	
	form.action = "MYPAGEFORM";
	form.method = "post";
	document.body.appendChild(form);
	form.submit();

}

</script>
</html>