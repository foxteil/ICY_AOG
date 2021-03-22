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
<body onLoad="init();">
	<div id="box2" >
	<br>
		<div>
			<input class="in2" id="word" name="word" type="text" placeholder="병원명을 입력해주세요.">
			<input id="word" name="word" type="hidden">
			<input class="in4" type=submit onClick="searchHp()" value="검 색">
			
		</div>
		<br>
		
	</div>
	<input type="button" onClick="moveAJoin()" value='선택완료'>
	
</body>

<script type="text/javascript">
var sInfo = JSON.parse('${hpList}');
function init(){
	//alert('${hpList}');
	let table = document.createElement('table');
	let div = document.getElementById('box2');
	
	for(i=0;i<sInfo.length;i++){
		let tr = document.createElement('tr');
		let td = document.createElement('td');
		let td2 = document.createElement('td');
		let check = document.createElement('input');
		let label = document.createElement('label');
		
		td.className="hpName";
		td2.className="hpAddr";
		
		check.id=i;
		check.type="radio";
		check.name = "check";
		check.value= sInfo[i].aHpCode;
		
		label.style.cursor="pointer";
		tr.appendChild(check);
		td.innerHTML = sInfo[i].aHpName;
		td2.innerHTML = sInfo[i].aHpAddr;
		
		td.style.width = "200px";
		
		tr.appendChild(td);
		tr.appendChild(td2);
		label.appendChild(tr);
		table.appendChild(label);
	}
	div.appendChild(table);
}
function moveAJoin(){ 
	var hpInf = document.getElementsByName("check");
	var hpName = document.getElementsByClassName("hpName");
	var hpAddr = document.getElementsByClassName("hpAddr");

	var test ;
	for(i=0;i<sInfo.length;i++){
		if (hpInf[i].checked == true) { //radio 체크했으면 true
			hpCode = hpInf[i].value;
			hpName = hpName[i].innerHTML; //안되면 textContent 써보기!
			hpAddr = hpAddr[i].innerHTML;
			
			test = hpCode+":"+hpName+ ":" + hpAddr;
			} 
		}
	var testArray = test.split(":");
	alert(testArray[0]+":"+testArray[1]+":"+testArray[2]); // 0:병원코드  1:병원이름  2:병원주소
	
	//부모창 페이지(admin2.jsp)를 바꿔준다.get방식으로 병원코드, 병원이름, 병원주소 를 넘긴다.
	opener.location.href='JOINFORM?jCode=A&aHpCode='+testArray[0]+'&aHpName='+testArray[1]+'&aHpAddr='+testArray[2];
	window.close();
}

function searchHp(){ 
	var word = document.getElementsByName("word")[0];
	var word2 = document.getElementsByName("word")[1];
	
	var wordValue = document.getElementsByName("word")[0].value;
	var wordArray = wordValue.split(" ");
	
	word.value = wordArray[0]; 
	word2.value = wordArray[1];
	
	word.name = "mWord";
	word2.name = "mWord2";
	
	var form = document.createElement("form");
	form.action = "POPUPHPSEARCH";
	form.method = "post";
	
	form.appendChild(word);
	form.appendChild(word2);
	document.body.appendChild(form);
	form.submit();
}

</script>
</html>