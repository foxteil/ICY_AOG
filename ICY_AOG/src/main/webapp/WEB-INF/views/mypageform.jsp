<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/mypage.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>예약리스트</title>
</head>
<bodY onLoad="init()">
${msg }
	<div id="box">
		<a id="little"> <img src="/resources/img/gtg_main.png">
		</a>
		<div id="upInfo" style="display: block">
			<div style="display: inline-flex; position: relative; top: 59px;">
				<div class="mypage-info" id="UPMINFORM" onclick="updateClick(this)">회원정보수정</div>
				<div class="mypage-info" id="RESCHECK" onclick="rescheck(this)">예약확인</div>
			</div>
		</div>
		<div id="uppw" style="display: block">
			<div class="span-hplist"
				style="width: 8.29cm;height: 12.94cm;position: relative;left: 4px;top: -8px;"
				>
				<div id="Member"></div>
				<div id="Family"></div>
				
	</div>
	</div>
	</div>
	
</body>
<script type="text/javascript">
function init(){
	if("${msg}"==""){
		
	}else{
	alert("${msg}");
	}
}
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
				mid = 'MM2';
				
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
		request.send("id=" + mid);
		
		//console.log(info.Password);
	}
		
	function divClick(mid) {
		//서버전송
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				let info = JSON.parse(jsonData);
				minfo(jsonData);
			}
		};
		request.open("POST", "UPMINFORM", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("id=" + mid);
	}
	let list;
	let phone;
	let name;
	let addr;
	let albtn;
	let upbtn;
	let pwbtn;
	
	let id;
	let option;
	function minfo(jsonData) {
	
		let upminform = document.getElementById("UPMINFORM");
		let rescheck = document.getElementById("RESCHECK");
		upminform.style.display = "none";
		rescheck.style.display = "none";
		let info = JSON.parse(jsonData);
		let member = document.getElementById("Member");
		list = document.createElement('div');
		list.innerHTML= info.Id + "님의 회원정보";
		list.className = "title";
		list.style.cursor = "pointer";
		list.style.textAlign = "center";
		list.style.fontSize = "26px";
		list.style.fontWeight = "bolder";
		list.style.color = "#203A7B";
		list.style.position = "relative";
		list.style.top = "95px";
		
		phone = document.createElement('Input');
		phone.placeholder = info.Phone;
		phone.style.cursor = "pointer";
		phone.value = info.Phone;
		phone.name="info";
		
		phone.style.cursor = "pointer";
		phone.style.width = "8cm";
		phone.style.height = "0.9cm";
		phone.style.borderRadius = "15px";
		phone.style.textAlign = "center";
		phone.style.fontSize = "20px";
		phone.style.border = "none";
		phone.style.position = "relative";
		phone.style.top = "116px"
		phone.style.margin = "5px 0px";
		phone.required = "required";
		
		name = document.createElement('Input');
		name.placeholder = info.Name;
		name.style.cursor = "pointer";
		name.value = info.Name;
		name.name="info";

		name.style.cursor = "pointer";
		name.style.width = "8cm";
		name.style.height = "0.9cm";
		name.style.borderRadius = "15px";
		name.style.textAlign = "center";
		name.style.fontSize = "20px";
		name.style.border = "none";
		name.style.position = "relative";
		name.style.top = "116px"
		name.style.margin = "5px 0px";
		name.required = "required";
		
		addr = document.createElement('Input');
		addr.placeholder = info.Addr;
		addr.style.cursor = "pointer";
		addr.value = info.Addr;
		addr.name="info";
		addr.style.margin = "5px 0px";
		
		addr.style.cursor = "pointer";
		addr.style.width = "8cm";
		addr.style.height = "0.9cm";
		addr.style.borderRadius = "15px";
		addr.style.textAlign = "center";
		addr.style.fontSize = "20px";
		addr.style.border = "none";
		addr.style.position = "relative";
		addr.style.top = "116px"
		
		
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
		
		member.appendChild(list);
		member.appendChild(phone);
		member.appendChild(name);
		member.appendChild(addr);
		albtn = document.createElement('BUTTON');
		albtn.innerHTML = "회원정보변경";
		albtn.addEventListener('click', function() {alminfo(info.Id,phone.value+":"+name.value+":"+addr.value);});
		albtn.style.position = "relative";
		albtn.style.top = "119px";
		albtn.style.left = "162px";
		albtn.style.width = "3.7cm";
		albtn.style.height = "1cm";
		albtn.style.fontSize = "20px";
		albtn.style.backgroundColor = "#6182D6";
		albtn.style.fontWeight = "bolder";
		albtn.style.color = "white";
		member.appendChild(albtn);

		
		upbtn = document.createElement('BUTTON');
		upbtn.innerHTML = "세대원추가";
		member.appendChild(upbtn);
		upbtn.style.position = "relative";
		upbtn.style.top = "193px";
		upbtn.style.left = "-122px";
		
		upbtn.style.width = "3.7cm";
		upbtn.style.height = "1cm";
		upbtn.style.fontSize = "20px";
		upbtn.style.backgroundColor = "#6182D6";
		upbtn.style.fontWeight = "bolder";
		upbtn.style.color = "white";
		upbtn.style.margin = "0px 9px";
		upbtn.addEventListener('click', function() {faform(phone.value);});
		
		
		
		pwbtn = document.createElement('BUTTON');
		pwbtn.innerHTML = "비밀번호변경";
		member.appendChild(pwbtn);
		pwbtn.style.position = "relative";
		pwbtn.style.top = "155px";
		pwbtn.style.left = "164px";
		pwbtn.style.width = "3.7cm";
		pwbtn.style.height = "1cm";
		pwbtn.style.fontSize = "20px";
		pwbtn.style.backgroundColor = "#6182D6";
		pwbtn.style.fontWeight = "bolder";
		pwbtn.style.color = "white";
		pwbtn.style.margin = "0px 9px";
		pwbtn.addEventListener('click', function() {pwform();});
		
	   
	}
	
	function alminfo(mId,MInfo){
		let alInfo = MInfo.split(":");
		alert(mId);
		alert(alInfo);
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jsonData = decodeURIComponent(request.response);
				console.log(jsonData);
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
		request.open("POST", "PWFORM", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send();
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
		request.send();

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
		list.style.display = "none";
		phone.style.display = "none";
		name.style.display = "none";
		addr.style.display = "none";
		albtn.style.display = "none";
		upbtn.style.display = "none";
		pwbtn.style.display = "none";
		
		family = document.getElementById("Member");
		let fainfo = JSON.parse(jsonData);
		falist = document.createElement('div');
		falist.style.cursor = "pointer";
		falist.innerHTML = fainfo[0].Id + "님의 회원정보";
		falist.className = "family";
		family.appendChild(falist);
		
		falist.style.cursor = "pointer";
		falist.style.textAlign = "center";
		falist.style.fontSize = "26px";
		falist.style.fontWeight = "bolder";
		falist.style.color = "#203A7B";
		falist.style.position = "relative";
		falist.style.top = "-5px";
		for ( let i = 0; i < fainfo.length; i++) {
			faname = document.createElement('div');
			let code = (fainfo[i].Stcode=="F")?"(세대원)":"(본인)";
			let bStr = JSON.stringify(fainfo[i].Jumin).substring(1,7).replace(/(.{2})/g,"$1/");
			let birth = bStr.slice(0,-1);
			let gen = JSON.stringify(fainfo[i].Jumin);
			var lastChar = gen.substring(gen.length-2,gen.length-1);
			let gender = (lastChar == "1")?"(M)":"(F)";
			faphone = document.createElement('div');
			let pStr = JSON.stringify(fainfo[i].Phone).substring(1,4) +"-"+
			JSON.stringify(fainfo[i].Phone).substring(4,8) +"-"+
			JSON.stringify(fainfo[i].Phone).substring(8,12);
			let phone = pStr.slice(0,-1);
			faname.innerHTML = fainfo[i].Name + code +"</br>"
							+birth + gender+"</br>"
							+pStr
			faname.style.cursor = "pointer";
			faname.style.backgroundColor = "#d3dbe8";
			faname.style.textAlign = "center";
			faname.style.fontSize = "19px";
			faname.style.margin = "4px 2px 9px";
			faname.style.width = "96%";
			faname.style.position = "relative";
			faname.style.left = "5px";
			faname.style.borderRadius = "10px";
			faname.style.fontWeight = "550";
			faname.className = "family"+[i];
			family.appendChild(faname);
			
			faalbtn = document.createElement('BUTTON');
			faalbtn.innerHTML = "변경";
			faalbtn.style.position = "relative";
			faalbtn.style.top = "-5px";
			faalbtn.style.left = "240px";
			faalbtn.style.width = "1.5cm";
			faalbtn.style.height = "1cm";
			faalbtn.style.fontSize = "20px";
			faalbtn.style.backgroundColor = "#6182D6";
			faalbtn.style.borderRadius = "13px";
			
			faalbtn.className = "btn1"+[i];
			faalbtn.style.fontWeight = "bolder";
			faalbtn.style.color = "white";
			faalbtn.style.margin = "0px 9px";
			faalbtn.addEventListener('click',function(){alterfamily(fainfo[i].Name+":"+fainfo[i].Phone+":"+fainfo[i].Jumin,phone);});
			if(i == 0){
				faalbtn.style.display = "none";
			}else{
				faalbtn.style.display = "block";
			}
			fadelbtn = document.createElement('BUTTON');
			fadelbtn.innerHTML = "삭제";
			
			fadelbtn.style.position = "relative";
			fadelbtn.style.top = "-43px";
			fadelbtn.style.left = "169px";
			fadelbtn.style.width = "1.5cm";
			fadelbtn.style.height = "1cm";
			fadelbtn.style.fontSize = "20px";
			fadelbtn.style.backgroundColor = "#6182D6";
			fadelbtn.style.fontWeight = "bolder";
			fadelbtn.style.borderRadius = "13px";
			fadelbtn.style.color = "white";
			fadelbtn.style.margin = "0px 9px";
			
			fadelbtn.className = "btn2"+[i];
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
			fainsbtn.innerHTML = "추가";
			
			fainsbtn.className = "family";
			fainsbtn.style.position = "relative";
			fainsbtn.style.top = "-30px";
			fainsbtn.style.left = "164px";
			fainsbtn.style.width = "1.5cm";
			fainsbtn.style.height = "1cm";
			fainsbtn.style.fontSize = "20px";
			fainsbtn.style.backgroundColor = "#6182D6";
			fainsbtn.style.fontWeight = "bolder";
			fainsbtn.style.color = "white";
			fainsbtn.style.margin = "0px 9px";
			fainsbtn.addEventListener('click',function(){insfamily(phone);});
			family.appendChild(fainsbtn);
	}
	let ckbox;
	function insfamily(phone){
		
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
		var header = document.querySelector(".family"+i);	//제거하고자 하는 엘리먼트
		
		if(header!=null){
        header.parentNode.removeChild(header);
		}
        var header = document.querySelector(".btn1"+i);	//제거하고자 하는 엘리먼트
        if(header!=null){
            header.parentNode.removeChild(header);
    		}
        
        var header = document.querySelector(".btn2"+i);	//제거하고자 하는 엘리먼트
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
		insPhone.className="upd";
		
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
		
		insPhone.innerHTML = phone.value;
		insPhone.value = phone.value;
		insJumin1.placeholder = "생년월일 6자리"
		insJumin1.required = "required";
		insJumin1.maxLength = "6";
		insJumin1.className = "insfa";
		
		insJumin1.style.cursor = "pointer";
		insJumin1.style.width = "8cm";
		insJumin1.style.height = "0.9cm";
		insJumin1.style.borderRadius = "15px";
		insJumin1.style.textAlign = "center";
		insJumin1.style.fontSize = "20px";
		insJumin1.style.border = "none";
		insJumin1.style.position = "relative";
		insJumin1.style.top = "10px"
		insJumin1.style.margin = "5px 0px";
		
		insJumin2.placeholder = "주민번호 뒷자리";
		insJumin2.maxLength = "7";
		insJumin2.style.cursor = "pointer";
		insJumin2.style.width = "8cm";
		insJumin2.style.height = "0.9cm";
		insJumin2.style.borderRadius = "15px";
		insJumin2.style.textAlign = "center";
		insJumin2.style.fontSize = "20px";
		insJumin2.style.border = "none";
		insJumin2.style.position = "relative";
		insJumin2.style.top = "10px"
		insJumin2.style.margin = "5px 0px";
		
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
		
		jmcheck.addEventListener('click',function(){check(insJumin1.value+":"+insJumin2.value);});
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
	}
	
	
	function insfa(insfamily,phone){
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
			var header = document.querySelector(".family" + i); //제거하고자 하는 엘리먼트

			if (header != null) {
				header.parentNode.removeChild(header);
			}
			var header = document.querySelector(".btn1" + i); //제거하고자 하는 엘리먼트
			if (header != null) {
				header.parentNode.removeChild(header);
			}

			var header = document.querySelector(".btn2" + i); //제거하고자 하는 엘리먼트
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
		var header = document.querySelector(".family" + i); //제거하고자 하는 엘리먼트
		header.parentNode.removeChild(header);

		var header = document.querySelector(".btn1" + i); //제거하고자 하는 엘리먼트
		header.parentNode.removeChild(header);

		var header = document.querySelector(".btn2" + i); //제거하고자 하는 엘리먼트
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
</script>
</html>