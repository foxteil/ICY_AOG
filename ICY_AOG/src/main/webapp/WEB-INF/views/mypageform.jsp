<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/mypage.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@100&display=swap');
</style>
<title>예약리스트</title>
</head>
<bodY onLoad="init()">
${msg }
	<div id="box">
		<a id="little"> <img src="/resources/img/gtg_main.png">
		</a>
		<div id="upInfo" style="display: block">
			<div style="display: inline-flex; position: relative; top: 59px;">
				<div class="mypage-info" id="UPMINFORM" onclick="updateClick(this)"><img src="/resources/img/user-icon.png"></div>
				<div class="mypage-info" id="REVIEW" onclick="reviewCheck(this)"><img src="/resources/img/review-icon.png"></div>
			</div>
		</div>
		<div id="uppw" style="display: block">
			<div class="span-hplist"
				style="width: 8.5cm;height: 16.74cm;position:absolute ;left: 17px;top: 18px;"
				>
				<div id="Member"></div>
				<div id="Family"></div>
				
	</div>
	</div>
	</div>
	
</body>

<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function init(){
	if("${msg}"==""){
		
	}else{
	alert("${msg}");
	}
}

let idInfo = '${idInfo}';

	function updateClick(mid) {
		
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				//console.log(jsonData);
				let json = jsonData;
				let info = JSON.parse(jsonData);
				console.log(info.Password)
				pw = info.Password
				//alert(pwjson);
				mid = idInfo;
				
				var inputpw = prompt("비밀번호 확인","");
				//alert(pw);
				if(inputpw== pw){
				divClick(mid);
				}else{
					alert("비밀번호를 다시 확인해주세요");
				}
			}
		};
		request.open("POST", "PWCONFIRM", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("id=" + idInfo);
		
		//console.log(info.Password);
	}
		
	function Postcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	
	function divClick(mid) {
		//서버전송
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				let info = JSON.parse(jsonData);
				console.log(info);
				minfo(info);
			}
		};
		request.open("POST", "UPMINFORM", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("id=" + idInfo);
	}
	let list;
	let phone;
	let name;
	//let addr;
	let albtn;
	let upbtn;
	let pwbtn;
	
	let id;
	let option;
	let label1;
	let postnum ;
	let post;
	let label2;
	let addr1;
	let label3;
	let addr2;
	let label4;
	let addr3;
	let addrDiv;
	let memberDiv;
	function minfo(jsonData) {
	
		let upminform = document.getElementById("UPMINFORM");
		let rescheck = document.getElementById("REVIEW");
		upminform.style.display = "none";
		rescheck.style.display = "none";
		let info =jsonData;
		let member = document.getElementById("Member");
		list = document.createElement('div');
		list.innerHTML= info.Id + "님의 회원정보";
		memberDiv = document.createElement('div');
		
		list.className = "title";
		list.style.cursor = "pointer";
		list.style.textAlign = "center";
		list.style.fontSize = "26px";
		list.style.fontWeight = "bolder";
		list.style.color = "#203A7B";
		
		
		phone = document.createElement('Input');
		phone.placeholder = info.Phone;
		phone.style.cursor = "pointer";
		phone.value = info.Phone;
		phone.name="info";
		phone.className="mypage-list";
		phone.addEventListener('keypress', function() {
			onlyNumber();
		});
		
		/* phone.style.cursor = "pointer";
		phone.style.width = "8cm";
		phone.style.height = "0.9cm";
		phone.style.borderRadius = "15px";
		phone.style.textAlign = "center";
		phone.style.fontSize = "20px";
		phone.style.border = "none";
		phone.style.margin = "5px 0px"; */
		phone.required = "required";
		
		name = document.createElement('Input');
		name.placeholder = info.Name;
		name.style.cursor = "pointer";
		name.value = info.Name;
		name.name="info";
		name.className="mypage-list";
		
		/* name.style.cursor = "pointer";
		name.style.width = "8cm";
		name.style.height = "0.9cm";
		name.style.borderRadius = "15px";
		name.style.textAlign = "center";
		name.style.fontSize = "20px";
		name.style.border = "none";
		name.style.margin = "5px 0px";
		name.required = "required"; */
		
		/*새로추가*/
		label1 = document.createElement('label');
		postnum = document.createElement('Input');
		post = document.createElement('Input');
		label2 = document.createElement('label');
		addr1 = document.createElement('Input');
		label3 = document.createElement('label');
		addr2 = document.createElement('Input');
		label4 = document.createElement('label');
		addr3 = document.createElement('Input');
		addrDiv = document.createElement('Div');
		/*여기까지*/
		
		alert("info.Addr.split: "+info.Addr);
		let splAddr = info.Addr.split("$");
		
		alert("splAddr1 :"+splAddr);
		/* addr = document.createElement('Input');
		addr.placeholder = info.Addr;
		addr.style.cursor = "pointer";
		addr.value = info.Addr;
		addr.name="info";
		addr.style.margin = "5px 0px"; */
		
		/*추가 및 변경*/
		
		/* addr.style.cursor = "pointer";
		addr.style.width = "8cm";
		addr.style.height = "0.9cm";
		addr.style.borderRadius = "15px";
		addr.style.textAlign = "center";
		addr.style.fontSize = "20px";
		addr.style.border = "none";
		addr.style.position = "relative";
		addr.style.top = "116px" */
		
		
		
	/* 	<p><label>우편번호 : 
	        <input type="text" size="5" maxlength="5" name="address1" id="sample6_postcode" placeholder="우편번호">
	        <input type="button" value="우편번호 검색" onclick="sample6_execDaumPostcode()">
	         </label></p>
	        <p><label>주소 : <input type="text" name="address1" id="sample6_address" placeholder="주소"></label></p>
	        <p><label>상세주소 : <input type="text" name="address2" id="sample6_detailAddress" placeholder="상세주소"></label></p>
	         */
		postnum.type = "text";
		postnum.size = "5";
		postnum.maxLength = "5";
		postnum.name = "address1"
		postnum.id = 'sample6_postcode';
		postnum.placeholder = "우편번호";
		postnum.textContent = postnum.value;
		postnum.readOnly = "true";
		postnum.value = splAddr[0];
		
		postnum.style.cursor = "pointer";
		postnum.style.width = "4cm";
		postnum.style.height = "0.9cm";
		postnum.style.borderRadius = "15px";
		postnum.style.textAlign = "center";
		postnum.style.fontSize = "20px";
		postnum.style.border = "1px solid #A4ADED";
		postnum.style.margin = "5px 0px";
		postnum.style.fontFamily="'Noto Sans KR', sans-serif";
		post.style.lineHeight = "0.9cm";
		postnum.required = "required";
		
		post.type = "button";
		post.value = "우편번호 검색";
		post.addEventListener('click', function() {Postcode();});
		post.style.cursor = "pointer";
		post.style.width = "4cm";
		post.style.height = "0.9cm";
		post.style.borderRadius = "15px";
		post.style.textAlign = "center";
		post.style.fontSize = "20px";
		post.style.border = "none";
		post.style.margin = "5px";
		post.style.fontFamily="'Noto Sans KR', sans-serif";
		post.required = "required";
		post.style.backgroundColor = "darkgray";
		post.style.lineHeight = "0.9cm";
		
		label1.id = "label1";
		label1.style.display = "flex";
		addr1.type = "text";
		addr1.name = "address1";
		addr1.id = 'sample6_address';
		addr1.placeholder = "주소";
		addr1.readOnly = "true";
 		addr1.style.cursor = "pointer";
		addr1.style.width = "8cm";
		addr1.style.height = "0.9cm";
		addr1.style.borderRadius = "15px";
		addr1.style.textAlign = "center";
		addr1.style.fontSize = "20px";
		addr1.style.border = "none";
		addr1.style.margin = "5px 0px";
 		addr1.required = "required";
		addr1.className="mypage-list";
		
		alert("스플릿 전 sqlAddr :"+splAddr[1]);
		let splAddr1 = splAddr[1].split("+");
		for(j=0;j<splAddr1.length;j++){
		addr1.textContent +=((j!=0)?" ":"")+splAddr1[j];
		addr1.value += ((j!=0)?" ":"")+splAddr1[j];
		}
		label2.id = "label2";		
		addr1.style.width = "291px;"
		
		addr2.type = "text";
		addr2.name = "address2";
		addr2.id = 'sample6_detailAddress';
		addr2.placeholder = "상세주소";
		addr2.textContent = addr2.value;
		addr2.className="mypage-list";
		let splAddr2 = splAddr[2].split("+");
		for(j=0;j<splAddr2.length;j++){
		addr2.textContent += ((j!=0)?" ":"")+splAddr2[j];
		addr2.value += ((j!=0)?" ":"")+splAddr2[j];
		}
		/* addr2.style.width = "291px;"
		
		addr2.style.cursor = "pointer";
		addr2.style.width = "8cm";
		addr2.style.height = "0.9cm";
		addr2.style.borderRadius = "15px";
		addr2.style.textAlign = "center";
		addr2.style.fontSize = "20px";
		addr2.style.border = "none";
		addr2.style.margin = "5px 0px";
		addr2.required = "required"; */
		
		
		label3.id = "label3";
		addr3.type = "text";
		addr3.name = "address3";
		addr3.id = 'sample6_extraAddress';
		addr3.placeholder = "(참고사항)";
		addr3.className="mypage-list";
		let splAddr3 = splAddr[3].split("+");
		for(j=0;j<splAddr3.length;j++){
		addr3.textContent += ((j!=0)?" ":"")+splAddr3[j];
		addr3.value += ((j!=0)?" ":"")+splAddr3[j];
		}
		/* addr3.style.width = "291px;"
		addr3.readOnly = "true";
		addr3.style.cursor = "pointer";
		addr3.style.width = "8cm";
		addr3.style.height = "0.9cm";
		addr3.style.borderRadius = "15px";
		addr3.style.textAlign = "center";
		addr3.style.fontSize = "20px";
		addr3.style.border = "none";
		addr3.style.margin = "5px 0px";
		addr3.required = "required"; */
		
		label4.id = "label4";
		addrDiv.id = "addrDiv";
		memberDiv.id = "memberDiv";
		/* let splAddr3 = splAddr[3].split("+");
		for(j=0;j<splAddr3.length;j++){
		addr3.textContent += " "+splAddr3[j];
		addr3.value += " "+splAddr3[j];
		} */
		
		//let spaddr = info.Addr.split("+");
		
		//addr.value = "("+test1+")" +test2 +test3 +test4;
		
		//addr.placeholder = "("+test1+")" +test2 +test3 +test4;
		
	//	alert(addr.value);
		
		let upinfo = document.getElementsByName("info");
		
		/* let select = document.createElement('select');
		select.innerHTML = "선택";
		let i;
		for( i=0;i<5;i++){
		let eval("option"+i);
		eval("option"+i) = document.createElement('option');
		eval("option"+i).innerHTML="가"+i;
		select.appendChild(eval("option"+i));
		} */
		//member.appendChild(select);
		
		
		memberDiv.appendChild(list);
		memberDiv.appendChild(name);
		memberDiv.appendChild(phone);
		memberDiv.appendChild(addrDiv);
		
		label1.appendChild(postnum);
		label1.appendChild(post);
		label2.appendChild(addr1);
		label2.appendChild(addr2);
		label4.appendChild(addr3);
		
		addrDiv.appendChild(label1);
		addrDiv.appendChild(label2);
		addrDiv.appendChild(label3);
		addrDiv.appendChild(label4);
		//member.appendChild(addr);
		albtn = document.createElement('BUTTON');
		albtn.innerHTML = "회원정보 수정";
		albtn.className = "mypage-btn";
		albtn.addEventListener('click', function() {alminfo(info.Id,phone.value+":"+name.value+":"+postnum.value +"$"+addr1.value+"$"+addr2.value+"$"+addr3.value);});
/* 		albtn.style.width = "2.5cm";
		albtn.style.height = "0.7cm";
		albtn.style.fontSize = "12px";
		albtn.style.backgroundColor = "#6182D6";
		albtn.style.color = "white";
		albtn.style.margin = "4.5px"; */
		
		
		memberDiv.appendChild(albtn);

		
		upbtn = document.createElement('img');
		upbtn.src = "/resources/img/family-icon.png";
		memberDiv.appendChild(upbtn);
		upbtn.className = "btn-img";
	/* 	upbtn.style.width = "2.5cm";
		upbtn.style.height = "0.7cm";
		upbtn.style.fontSize = "12px";
		upbtn.style.backgroundColor = "#6182D6";
		upbtn.style.color = "white";
		upbtn.style.margin = "4.5px"; */
		
		upbtn.addEventListener('click', function() {faform(phone.value);});
		
		
		pwbtn = document.createElement('img');
		pwbtn.src = "/resources/img/pw-icon.png";
		pwbtn.className = "btn-img";
		memberDiv.appendChild(pwbtn);
		/* 
		pwbtn.style.width = "2.5cm";
		pwbtn.style.height = "0.7cm";
		pwbtn.style.fontSize = "12px";
		pwbtn.style.backgroundColor = "#6182D6";
		pwbtn.style.color = "white";
		pwbtn.style.margin = "4.5px"; */
		
		member.appendChild(memberDiv);
		pwbtn.addEventListener('click', function() {pwform();});
		
	   
	}
	
	   
	   
	function alminfo(mId,MInfo){
		let alInfo = MInfo.split(":");
		alert(alInfo[2]);
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				//let jsonData = decodeURIComponent(request.response);
				//console.log(jsonData);
				//let info = JSON.parse(jsonData);

			}
		};
		request.open("POST", "UPMINFO", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("UPMINFO?sCode=UPMINFO&Id="+mId+"&Phone="+alInfo[0]+"&Name="+alInfo[1]+"&Addr="+alInfo[2]);
	}
	
	function pwform(){
		
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				console.log(jsonData);
				//let info = JSON.parse(jsonData);
				//fa(jsonData);
			}
		};
		request.open("POST", "PWFORM2", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=PWFORM2&Id="+idInfo);
	}
	
	function faform(phone) {
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				console.log(jsonData);
				//let info = JSON.parse(jsonData);
				fa(jsonData,phone);

			}
		};
		request.open("POST", "UPFAFORM", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=UPFAFORM&Id="+idInfo);

	}

	let falist;
	let faphone;
	let faname;
	let faaddr;
	let faalbtn;
	let fadelbtn;
	let fainsbtn;
	let family;
	let count;
	function fa(jsonData,mphone) {
		
		alert(jsonData);
		alert(mphone);
	/* 	list.style.display = "none";
		phone.style.display = "none";
		name.style.display = "none";
		//addr.style.display = "none";
		albtn.style.display = "none";
		upbtn.style.display = "none";
		pwbtn.style.display = "none";
		label1.style.display = "none";
		postnum.style.display = "none";
		post.style.display = "none";
		label2.style.display = "none";
		addr1.style.display = "none";
		label3.style.display = "none";
		addr2.style.display = "none";
		label4.style.display = "none";		
		addr3.style.display = "none"; */
		
		var header = document.querySelector("#memberDiv");	//제거하고자 하는 엘리먼트
		if(header!=null){
	        header.parentNode.removeChild(header);
			}		
		family = document.getElementById("Member");
		let fainfo = JSON.parse(jsonData);
		falist = document.createElement('div');
		falist.style.cursor = "pointer";
		falist.innerHTML = fainfo[0].Id + "님의 세대원 정보";
		falist.className = "family";
		family.appendChild(falist);
		
		falist.style.cursor = "pointer";
		falist.style.textAlign = "center";
		falist.style.fontSize = "26px";
		falist.style.fontWeight = "bolder";
		falist.style.color = "#203A7B";
		falist.style.position = "relative";
		falist.style.top = "-5px"; 
		falist.style.right = "16px"; 
		for ( let i = 0; i < fainfo.length; i++) {
			faname = document.createElement('div');
			let code = (fainfo[i].Stcode=="F")?"(세대원)":"(본인)";
			let bStr = JSON.stringify(fainfo[i].Jumin).substring(1,7).replace(/(.{2})/g,"$1/");
			let birth = bStr.slice(0,-1);
			let gen = JSON.stringify(fainfo[i].Jumin);
			var lastChar = gen.substring(7,8);
			let gender = (lastChar == "1")?"(M)"
					: (lastChar == "3")?"(M)"
					:"(F)";
			faphone = document.createElement('div');
			let pStr = JSON.stringify(fainfo[i].Phone).substring(1,4) +"-"+
			JSON.stringify(fainfo[i].Phone).substring(4,8) +"-"+
			JSON.stringify(fainfo[i].Phone).substring(8,12);
			let phone = pStr.slice(0,-1);
			faname.innerHTML = fainfo[i].Name + code +"</br>"
							+birth + gender+"</br>"
							+pStr
			/* faname.style.cursor = "pointer";
			faname.style.backgroundColor = "#d3dbe8";
			faname.style.textAlign = "center";
			faname.style.fontSize = "19px";
			faname.style.margin = "4px 2px 9px";
			faname.style.width = "96%";
			faname.style.position = "relative";
			faname.style.left = "5px";
			faname.style.borderRadius = "10px";
			faname.style.fontWeight = "550"; */
			faname.id = "family"+[i];
			faname.className="familyList";
			family.appendChild(faname);
			
			
			faalbtn = document.createElement('BUTTON');
			faalbtn.innerHTML = "변경";
			faalbtn.className="family-btn";
			/* faalbtn.style.position = "relative";
			faalbtn.style.bottom = "70px";
			faalbtn.style.left = "246px";
			faalbtn.style.width = "1.2cm";
			faalbtn.style.height = "0.7cm";
			faalbtn.style.fontSize = "13px";
			faalbtn.style.backgroundColor = "rgb(231 234 241)";
			faalbtn.style.borderRadius = "9px";
			faalbtn.style.margin = "0px 9px"; */
			faalbtn.id = "btn1"+[i];
			faalbtn.name = "list";
			faalbtn.addEventListener('click',function(){alterfamily(fainfo[i].Name+":"+fainfo[i].Phone+":"+fainfo[i].Jumin,phone);});
			if(i == 0){
				faalbtn.style.display = "none";
			}else{
				faalbtn.style.display = "block";
			}
			fadelbtn = document.createElement('BUTTON');
			fadelbtn.innerHTML = "삭제";
			fadelbtn.className="family-btn";
			/* fadelbtn.style.position = "relative";
			fadelbtn.style.bottom = "70px";
			fadelbtn.style.left = "246px";
			fadelbtn.style.width = "1.2cm";
			fadelbtn.style.height = "0.7cm";
			fadelbtn.style.fontSize = "13px";
			fadelbtn.style.backgroundColor = "rgb(231 234 241)";
			fadelbtn.style.borderRadius = "9px";
			fadelbtn.style.margin = "0px 9px"; */
			
			fadelbtn.id = "btn2"+[i];
			fadelbtn.addEventListener('click',function(){delfamily(fainfo[i].Id+":"+fainfo[i].Jumin,i);});
			if(i == 0){
				fadelbtn.style.display = "none";
			}else{
				fadelbtn.style.display = "block";
			}
		
			
			family.appendChild(faalbtn);
			family.appendChild(fadelbtn);
			count = i;
		}
		
		alert(count);
			fainsbtn = document.createElement('BUTTON');
			fainsbtn.className="family-btn";
			fainsbtn.id = "insfamily";
			fainsbtn.innerHTML = "세대원 추가";

			/* fainsbtn.className = "family";
			fainsbtn.style.position = "relative";
			fainsbtn.style.top = "-30px";
			fainsbtn.style.left = "164px";
			fainsbtn.style.width = "1.5cm";
			fainsbtn.style.height = "1cm";
			fainsbtn.style.fontSize = "20px";
			fainsbtn.style.backgroundColor = "#6182D6";
			fainsbtn.style.fontWeight = "bolder";
			fainsbtn.style.color = "white";
			fainsbtn.style.margin = "0px 9px"; */
			fainsbtn.addEventListener('click',function(){insfamily(phone);});
			family.appendChild(fainsbtn);
	}
	let ckbox;
	function insfamily(phone){
		var length = document.getElementsByName("list").length;
		alert(length);
		if(parseInt(length)<6){
		/*
		form.action = "UPFAMILY?fCode=insert&Name="+name.value+"&Phone="+phone.value+"&Jumin="+jumin.value;
		
		let name = document.getElementById("Name");
		let phone = document.getElementById("Phone");
		let jumin = document.getElementById("Jumin");

		var form = document.createElement("form");
		
		form.action = "UPFAMILY?fCode=insert&Name="+name.value+"&Phone="+phone.value+"&Jumin="+jumin.value;
		form.method = "post";
		
		form.appendChild(name);
		form.appendChild(phone);
		form.appendChild(jumin);
		
		document.body.appendChild(form);
		form.submit();
		faname.style.display = "none";
		faalbtn.style.display = "none";
		fadelbtn.style.display = "none";
		*/
		
		falist.style.display="none";
		for(i=0;i<10;i++){
		var header = document.querySelector("#family"+i);	//제거하고자 하는 엘리먼트
		
		if(header!=null){
        header.parentNode.removeChild(header);
		}
        var header = document.querySelector("#btn1"+i);	//제거하고자 하는 엘리먼트
        if(header!=null){
            header.parentNode.removeChild(header);
    		}
        
        var header = document.querySelector("#btn2"+i);	//제거하고자 하는 엘리먼트
        if(header!=null){
            header.parentNode.removeChild(header);
    		}
		}
		fainsbtn.style.display="none"; 
		//family.style.display = "none";
	        
		let insfamily = document.getElementById('Family');
		let div = document.createElement('Div');
		let title = document.createElement('Div');
		let insName = document.createElement('Input');
		let insPhone = document.createElement('Input');
		let insJumin1 = document.createElement('Input');
		let insJumin2 = document.createElement('Input');
		let insBtn = document.createElement('Button');
		let jmcheck = document.createElement('Button');
		ckbox = document.createElement('Input');
		let ctitle = document.createElement('span');
		let notice = document.createElement('span');
		
		div.className="divfamily";
		title.innerHTML = "세대원 추가";
		
		title.style.cursor = "pointer";
		title.style.textAlign = "center";
		title.style.fontSize = "26px";
		title.style.fontWeight = "bolder";
		title.style.color = "#203A7B";
		title.style.position = "relative";
		title.style.top = "2px";
		
		insName.placeholder = "이름을 입력해주세요";
		insName.required = "true";
		insName.maxLength = "5";
		insName.autofocus = "autofocus";
		insName.className="upd";
		
		
	/* 	insName.style.cursor = "pointer";
		insName.style.width = "8cm";
		insName.style.height = "0.9cm";
		insName.style.borderRadius = "15px";
		insName.style.textAlign = "center";
		insName.style.fontSize = "20px";
		insName.style.border = "none";
		insName.style.position = "relative";
		insName.style.top = "10px"
		insName.style.margin = "5px 0px"; */
		
		insPhone.placeholder = "전화번호를 입력해주세요";
		insPhone.required = "true";
		insPhone.maxLength = "11";
		insPhone.className="upd";
		insPhone.addEventListener('keypress', function() {
			onlyNumber();
		});
		
	/* 	insPhone.style.cursor = "pointer";
		insPhone.style.width = "8cm";
		insPhone.style.height = "0.9cm";
		insPhone.style.borderRadius = "15px";
		insPhone.style.textAlign = "center";
		insPhone.style.fontSize = "20px";
		insPhone.style.border = "none";
		insPhone.style.position = "relative";
		insPhone.style.top = "10px"
		insPhone.style.margin = "5px 0px"; */
		
		insPhone.innerHTML = phone.value;
		insPhone.value = phone.value;
		insJumin1.placeholder = "생년월일 6자리"
		insJumin1.required = "required";
		insJumin1.maxLength = "6";
		insJumin1.className = "upd";
		
		insJumin1.addEventListener('keypress', function() {
			onlyNumber();
		});
		
		/* insJumin1.style.cursor = "pointer";
		insJumin1.style.width = "8cm";
		insJumin1.style.height = "0.9cm";
		insJumin1.style.borderRadius = "15px";
		insJumin1.style.textAlign = "center";
		insJumin1.style.fontSize = "20px";
		insJumin1.style.border = "none";
		insJumin1.style.position = "relative";
		insJumin1.style.top = "10px"
		insJumin1.style.margin = "5px 0px"; */
		
		insJumin2.placeholder = "주민번호 뒷자리";
		insJumin2.maxLength = "7";
		insJumin2.className = "upd";
		/* insJumin2.style.cursor = "pointer";
		insJumin2.style.width = "8cm";
		insJumin2.style.height = "0.9cm";
		insJumin2.style.borderRadius = "15px";
		insJumin2.style.textAlign = "center";
		insJumin2.style.fontSize = "20px";
		insJumin2.style.border = "none";
		insJumin2.style.position = "relative";
		insJumin2.style.top = "10px"
		insJumin2.style.margin = "5px 0px"; */
		
		insJumin2.addEventListener('keypress', function() {onlyNumber();});
		insJumin2.addEventListener('blur',function(){check(insJumin1.value+":"+insJumin2.value);});
		let info = document.getElementsByClassName("upd").required;
		insJumin2.type = "password";
		insJumin2.maxlength = "6";
		insBtn.innerHTML = "확인";
		insJumin2.required = "true";
		
		jmcheck.innerHTML = "체크";
		
		insBtn.style.position = "relative";
		insBtn.style.top = "19px";
		insBtn.style.left = "162px";
		insBtn.style.width = "3.7cm";
		insBtn.style.height = "1cm";
		insBtn.style.fontSize = "20px";
		insBtn.style.backgroundColor = "#6182D6";
		insBtn.style.fontWeight = "bolder";
		insBtn.style.color = "white";
		
		ckbox.type="checkbox";
		ckbox.style.position = "relative";
		ckbox.style.top = "10px";
		ctitle.innerHTML = "가족 대리접수 동의(필수)";
		ctitle.style.fontSize = "14px";
		ctitle.style.position = "relative";
		ctitle.style.top = "10px";
		ckbox.name = "agree";
		notice.innerHTML = 
			"</br>"+"* 가족(부모/자녀)등록시 등록하는 가족의 위임을 받았음을 확인합니다."
			+"</br>"+"* 무단으로 대리접수 시 개인정보처리에 관한 법률에 위배될 수 있습니다.(등록할 대상에 한하여 1회 동의 진행)";
		notice.style.fontSize = "10px";
		notice.style.color = "gray";
		notice.style.position = "relative";
		notice.style.top = "10px";
		
		insBtn.addEventListener('click',function(){insfa(insName.value +":"+insPhone.value+":"+insJumin1.value+":"+insJumin2.value,phone);});
		insfamily.appendChild(div);
		div.appendChild(title);
		div.appendChild(insName);
		div.appendChild(insPhone);
		div.appendChild(insJumin1);
		div.appendChild(insJumin2);
		div.appendChild(ckbox);
		div.appendChild(ctitle);
		div.appendChild(notice);
		div.appendChild(insBtn);
		div.appendChild(jmcheck);
		}else{
			alert("세대원추가는5명까지만 세대원 삭제후 진행해주세요.");
			
		
		}
	}
	
	
	function insfa(insfamily,phone){
		let agree = document.getElementsByName("agree")[0];
		if (agree.checked == false) {
			  alert('약관에 동의해주세요');
			return false;
		}
		let insfa = insfamily.split(":");
		let jumin = insfa[2]+insfa[3].charAt(0);
		alert(insfa[0]+":"+insfa[1]+":"+jumin);
		alert(jumin.value);
		var insArray = new Array();
		let instoJson = new Object();
		instoJson.Name = insfa[0];
		instoJson.Phone = insfa[1];
		instoJson.Jumin = jumin;
		insArray.push(instoJson);
		console.log(instoJson);
		
		/* var chkbox = document.getElementsByName("agree");
		var chk = false;
		for (var i = 0; i < chkbox.length; i++) {
			if (chkbox[i].checked) {
				chk = true;
			} else {
				chk = false;
			}
		}
		if (chk) {
			return false;
		} else {
			alert("모든 약관에 동의해 주세요.")
		} */

		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				console.log(instoJson);
				console.log(jsonData);
				insfaselect(jsonData, phone);
			}
		};
		request.open("POST", "UPFAMILY", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("UPFAMILY?sCode=UPFAMILY&fCode=insert&Name=" + insfa[0]
				+ "&Phone=" + insfa[1] + "&Jumin=" + jumin);

	}

	function check(jumin) {
		let num = jumin.split(":");
		let idnum1 = num[0];
		let idnum2 = num[1];
		idnum = idnum1+ idnum2;
		alert(idnum);
		if (idnum_chk(idnum)) {
			alert("주민번호가 틀리거나 입력하지 않았습니다! 확인바랍니다.");
			return false;
		}
		alert("주민등록 번호가 확인 되었습니다.");
		return true;
	}
	function idnum_chk(idnum) {
		alert(idnum);
		idnumtot = 0;
		idnumadd = "234567892345";
		for (i = 0; i < 12; i++) {
			idnumtot = idnumtot + parseInt(idnum.substring(i, i + 1))
					* parseInt(idnumadd.substring(i, i + 1));
		}
		idnumtot = 11 - (idnumtot % 11);
		if (idnumtot == 10) {
			idnumtot = 0;
		} else if (idnumtot == 11) {
			idnumtot = 1;
		}
		if (parseInt(idnum.substring(12, 13)) != idnumtot)
			return true;
	}

	function insfaselect(jsonData, phone) {
		var header = document.querySelector(".divfamily"); //제거하고자 하는 엘리먼트
		header.parentNode.removeChild(header);

		fa(jsonData, phone);
	}
	function alterfamily(upinfo) {
		alert(upinfo);

		let alter = upinfo.split(":");

		alert(alter[0] + ":" + alter[1] + ":" + alter[2]);
		falist.style.display = "none";

		for (i = 0; i < 10; i++) {
			var header = document.querySelector("#family" + i); //제거하고자 하는 엘리먼트

			if (header != null) {
				header.parentNode.removeChild(header);
			}
			var header = document.querySelector("#btn1" + i); //제거하고자 하는 엘리먼트
			if (header != null) {
				header.parentNode.removeChild(header);
			}

			var header = document.querySelector("#btn2" + i); //제거하고자 하는 엘리먼트
			if (header != null) {
				header.parentNode.removeChild(header);
			}
		}
		fainsbtn.style.display = "none";

		let insfamily = document.getElementById('Family');
		let div = document.createElement('Div');
		let title = document.createElement('Div');
		let insName = document.createElement('Input');
		let insPhone = document.createElement('Input');
		let insJumin = document.createElement('Input');
		let insJumint = document.createElement('Input');
		let insBtn = document.createElement('Button');
		let check = document.createElement('Input');
		let ctitle = document.createElement('span');
		let notice = document.createElement('span');

		div.className = "divfamily";
		title.innerHTML = "세대원 추가";

		title.style.cursor = "pointer";
		title.style.textAlign = "center";
		title.style.fontSize = "26px";
		title.style.fontWeight = "bolder";
		title.style.color = "#203A7B";
		title.style.position = "relative";
		title.style.top = "2px";

		insName.placeholder = "이름을 입력해주세요";
		insName.required = "true";
		insName.maxLength = "5";
		insName.innerHTML = alter[0];
		insName.value = alter[0];

		insName.style.cursor = "pointer";
		insName.style.width = "8cm";
		insName.style.height = "0.9cm";
		insName.style.borderRadius = "15px";
		insName.style.textAlign = "center";
		insName.style.fontSize = "20px";
		insName.style.border = "none";
		insName.style.position = "relative";
		insName.style.top = "10px"
		insName.style.margin = "5px 0px";

		insPhone.placeholder = "전화번호를 입력해주세요";
		insPhone.required = "true";
		insPhone.maxLength = "11";
		insPhone.innerHTML = alter[1];
		insPhone.value = alter[1];
		insPhone.addEventListener('keypress', function() {
			onlyNumber();
		});
		
		insPhone.style.cursor = "pointer";
		insPhone.style.width = "8cm";
		insPhone.style.height = "0.9cm";
		insPhone.style.borderRadius = "15px";
		insPhone.style.textAlign = "center";
		insPhone.style.fontSize = "20px";
		insPhone.style.border = "none";
		insPhone.style.position = "relative";
		insPhone.style.top = "10px"
		insPhone.style.margin = "5px 0px";

		let bStr = alter[2].substring(1, 7).replace(/(.{2})/g, "$1/");
		let birth = bStr.slice(0, -1);
		var lastChar = alter[2].substring(8, 9);
		let gender = (lastChar == "1") ? "(M)" : (lastChar == "2") ? "(F)"
				: (lastChar == "3") ? "(M)" : "(F)";

		insJumin.placeholder = "생년월일 6자리"
		insJumin.required = "required";
		insJumin.maxlength = "6";
		insJumin.className = "insfa";
		insJumin.addEventListener('keypress', function() {
			onlyNumber();
		});
		insJumin.style.cursor = "pointer";
		insJumin.style.width = "8cm";
		insJumin.style.height = "0.9cm";
		insJumin.style.borderRadius = "15px";
		insJumin.style.textAlign = "center";
		insJumin.style.fontSize = "20px";
		insJumin.style.border = "none";
		insJumin.style.position = "relative";
		insJumin.style.top = "10px"
		insJumin.style.margin = "5px 0px";

		insJumin.value = bStr + gender;
		insJumin.innerHTML = bStr + gender;
		insJumin.readOnly = "true";
		insJumint.value = alter[2];
		insJumint.style.display = "none";

		insBtn.innerHTML = "확인";
		insBtn.style.position = "relative";
		insBtn.style.top = "19px";
		insBtn.style.left = "162px";
		insBtn.style.width = "3.7cm";
		insBtn.style.height = "1cm";
		insBtn.style.fontSize = "20px";
		insBtn.style.backgroundColor = "#6182D6";
		insBtn.style.fontWeight = "bolder";
		insBtn.style.color = "white";

		check.type = "checkbox";
		check.style.position = "relative";
		check.style.top = "24px";
		ctitle.innerHTML = "가족 대리접수 동의(필수)";
		ctitle.style.fontSize = "14px";
		ctitle.style.position = "relative";
		ctitle.style.top = "52px";
		ctitle.style.right = "120px";
		check.required = "required";

		notice.innerHTML = "</br>"
				+ "* 가족(부모/자녀)등록시 등록하는 가족의 위임을 받았음을 확인합니다."
				+ "</br>"
				+ "* 무단으로 대리접수 시 개인정보처리에 관한 법률에 위배될 수 있습니다.(등록할 대상에 한하여 1회 동의 진행)";
		notice.style.fontSize = "10px";
		notice.style.color = "gray";
		notice.style.position = "relative";
		notice.style.top = "20px";
		alert(insName.value + ":" + insPhone.value + ":" + insJumin.value);
		/* 
		var data = document.divfamily;
		if(!data.check.value){
		alert('check please');
		return false;
		}
		 */
		insBtn.addEventListener('click', function() {
			updfa(insName.value, insPhone.value, insJumint.value);
		});
		
		insfamily.appendChild(div);
		div.appendChild(title);
		div.appendChild(insName);
		div.appendChild(insPhone);
		div.appendChild(insJumin);
		div.appendChild(insJumint);
		div.appendChild(insBtn);
		div.appendChild(ctitle);
		div.appendChild(check);
		div.appendChild(notice);

	}

	function updfa(fname, fphone, fjumin) {
		alert(fname + ":" + fphone + ":" + fjumin);
		var insArray = new Array();
		let updtoJson = new Object();
		updtoJson.Name = fname;
		updtoJson.Phone = fphone;
		updtoJson.Jumin = fjumin;
		insArray.push(updtoJson);
		console.log(updtoJson);

		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				console.log(updtoJson);
				console.log(jsonData);
				insfaselect(jsonData, phone);
			}
		};
		request.open("POST", "UPFAMILY", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("UPFAMILY?sCode=UPFAMILY&fCode=update&Name=" + fname
				+ "&Phone=" + fphone + "&Jumin=" + fjumin);

	}

	


	function rescheck(obj) {
		var form = document.createElement("form");
		form.action = obj.id;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}

	function delfamily(info, i) {

		let del = info.split(":");
		alert(del[0] + ":" + del[1]);
		alert(i);
		var delArray = new Array();
		let deltoJson = new Object();
		deltoJson.Id = del[0];
		deltoJson.Jumin = del[1];
		delArray.push(deltoJson);

		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				console.log(deltoJson);
				console.log(jsonData);

				select(jsonData, i);

			}
		};
		request.open("POST", "DELFAMILY", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("DELFAMILY?sCode=DELFAMILY&fCode=delete&Id=" + del[0]
				+ "&Jumin=" + del[1]);
	}

	function select(jsonData, i) {
		alert(jsonData);
		var header = document.querySelector("#family" + i); //제거하고자 하는 엘리먼트
		header.parentNode.removeChild(header);

		var header = document.querySelector("#btn1" + i); //제거하고자 하는 엘리먼트
		header.parentNode.removeChild(header);

		var header = document.querySelector("#btn2" + i); //제거하고자 하는 엘리먼트
		header.parentNode.removeChild(header);

	}
	function upminform() {
		/*
		var prompt_test = prompt("비밀번호확인", "");
		var form = document.createElement("form");
		form.action = "FAMILY";
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
		 */
		list.style.display = "none";
		phone.style.display = "none";
		name.style.display = "none";
		addr.style.display = "none";
		albtn.style.display = "none";
		upbtn.style.display = "none";
		pwbtn.style.display = "none";
		var con = document.getElementById("upInfo");
		var fa = document.getElementById("Info");
		con.style.display = 'none';
		fa.style.display = 'block';

	}

	function upminfo(obj) {
		/*
		var prompt_test = prompt("비밀번호확인", "");
		var form = document.createElement("form");
		form.action = obj.id;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
		 */
		var con = document.getElementById("Info");
		var fa = document.getElementById("faInfo");
		if (con.style.display == 'block') {
			con.style.display = 'none';
			fa.style.display = 'block';
		} else {
			con.style.display = 'block';
			fa.style.display = 'none';
		}
	}

	function alterpw(obj) {
		/*
		var prompt_test = prompt("비밀번호확인", "");
		var form = document.createElement("form");
		form.action = obj.id;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
		 */
		var con = document.getElementById("uppw");
		var fa = document.getElementById("pwform");
		if (con.style.display == 'block') {
			con.style.display = 'none';
			fa.style.display = 'block';
		} else {
			con.style.display = 'block';
			fa.style.display = 'none';
		}
	}

	function mypage(obj) {
		var form = document.createElement("form");
		form.action = obj.id;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
	
	function reviewCheck(){
		var form = document.createElement("form");
		let rCode = document.createElement("input");
		let Id = document.createElement("input");
		rCode.name = "rCode";
		rCode.value = "myReview";
		rCode.style.display="none";
		Id.name = "Id";
		Id.value= idInfo;
		Id.style.display="none";
		form.action = "REVIEW";
		form.method = "post";
		
		form.appendChild(rCode);
		form.appendChild(Id);
		document.body.appendChild(form);
		form.submit();
	}
	
 function onlyNumber(event){         
         
         //if(!event) event = window.event;
         
          var event = event || window.event; 
         //e => 익스플로러 외 브라우저 , 
         //window.event => 익스플로러             

         //0~9의 아스키코드의 범위를 벗어나면 입력란에 입력값이 입력되지 않음
         if((event.keyCode<48)||(event.keyCode>57)){
             event.returnValue=false; //입력되지 않게 fals반환
         }
     }

</script>

<script>
/* var ws = new WebSocket("ws://192.168.0.22:80/MYPAGEFORM?Id=MM2");


ws.onopen = function () {
    console.log('Info: connection opened.');
    setTimeout( function(){ connect(); }, 1000); // retry connection!!
};


ws.onmessage = function (event) {
    console.log(event.data+'\n');
};


ws.onclose = function (event) { console.log('Info: connection closed.'); };
ws.onerror = function (event) { console.log('Info: connection closed.'); };

$('#btnSend').on('click', function(evt) {
  evt.preventDefault();
if (socket.readyState !== 1) return;
	  let msg = $('input#msg').val();
	  ws.send(msg);
}); */
</script>
</html>