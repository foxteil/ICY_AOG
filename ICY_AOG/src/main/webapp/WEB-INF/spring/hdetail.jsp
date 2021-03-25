<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reserve.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>병원상세페이지</title>
</head>
<body onLoad=init()>

	<div id="box">
		<a id="little">
      		<img src="/resources/img/gtg_main.png">
    	</a> 
    	<div id="detailList"></div>
<!-- 		<img src="/resources/img/subway.png" style="width: 1.93cm; -->
<!--      height: 0.7cm; -->
<!--      position: relative; --> 
<!--     top: 14px;">인천 논현역 4번 출구에서 218m -->
		
		
			<button class="btn" id="REVIEW" onclick="detail(this)">리뷰보러가기</button>
			<button class="btn" id="RESFORM" onclick="reserve(this)">예약하기</button>
			<button class="btn" id="MAP" >지도보기</button>
		</div>
<button class ="btn" id="START" onclick="click()">MAIN</button>
<button class="btn" id="MYPAGE" onclick="click()">MYPAGE</button>
</body>

<script>

let map; 
let detail;
let re;
function init(){
	alert('${hdInfo}');
	 detail = document.getElementById("detailList");
	let hdetail= JSON.parse('${hdInfo}');
	alert(hdetail);
	let dImage= document.createElement('div');
	dImage.textContent=hdetail[0].hpImage;
	dImage.style.width="8.64cm";
	dImage.style.height="4.8cm";
	dImage.style.left="8px";
	dImage.style.position="relative";
	dImage.className = "hdetail";
	detail.appendChild(dImage);
	
	let hpName = document.createElement('span');
	hpName.textContent = hdetail[0].hpName;
	hpName.classNma = "hdetail";
	hpName.style.position="relative";
	detail.appendChild(hpName);
	
	let paName = document.createElement('span');
	paName.textContent =hdetail[0].paName;
	paName.className = "hdetail";
	paName.style.position="relative";
	detail.appendChild(paName);
	
	
	let hPhone =document.createElement('span');
	hPhone.textContent = hdetail[0].hpPhone;
	hPhone.className = "hdetail";
	hPhone.style.position="relative";
	detail.appendChild(hPhone);
	
	
	let addr = document. createElement('span');
	addr.textContent = hdetail[0].hpAddr;
	addr.className =  "hdetail";
	addr.style.position="relative";
	detail.appendChild(addr);
	
 	map = document.getElementById("MAP");
 	map.addEventListener('click',function(){mapview(hdetail[0].hpCode);});
 	
//  	re = document. getElementById("RESFORM");
//  	re.addEventListener('click',function(){reserve(hdetail[0].hpCode);});
}
	function reserve(obj){
		let info = JSON.parse('${hdInfo}');
		alert(info[0].bkList);
		alert("reserve function :"+obj.id);
		var form=document.createElement("form");
		let res = document.createElement("input");
		res.name = "hpCode";
		res.value=info.hpCode;
		res.type = "button";
		form.action = "RESFORM?hpCode="+info[0].hpCode+"&Id="+info[0].bkList;
		form.method = "post";
		
		form.appendChild(res);
		document.body.appendChild(form);
		
		form.submit();
		
	}
	
	function mapview(obj){
		
	
		//alert(obj);
		var form=document.createElement("form");
		let hpost = document.createElement("input");
		hpost.name = "hpCode";
		hpost.value=obj;
		hpost.type = "button";
		form.action = "MAP?hpCode="+obj;
		form.method = "post";
		
		form.appendChild(hpost);
		document.body.appendChild(form);
		detail.appendChild(map);
		form.submit();
	}
	

	
</script>   
</html>