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
<script type="text/javascript" src="/resources/js/jquery-3.5.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
<script>	

function enterSearch() {
	var evt_code = (window.netscape) ? ev.which : event.keyCode;
	if (evt_code == 13) {    
		event.keyCode = 0;  
		getAddr(); 
	} 
}

//특수문자, 특정문자열(sql예약어의 앞뒤공백포함) 제거
function checkSearchedWord(obj){
 if(obj.value.length >0){
 //특수문자 제거
 var expText = /[%=><]/ ;
 if(expText.test(obj.value) == true){
 alert("특수문자를 입력 할수 없습니다.") ;
 obj.value = obj.value.split(expText).join(""); 
 return false;
 }
 
 //특정문자열(sql예약어의 앞뒤공백포함) 제거
 var sqlArray = new Array(
 "OR", "SELECT", "INSERT", "DELETE", "UPDATE","CREATE", "DROP", "EXEC", "UNION","FETCH", "DECLARE", "TRUNCATE" );
 
 var regex;
 for(var i=0; i<sqlArray.length; i++){
 regex = new RegExp( sqlArray[i] ,"gi") ;
 
 if (regex.test(obj.value) ) {
 obj.value =obj.value.replace(regex, "");
 return false;
 }
 }
 }
 return true ;
}
function searchJuso(){
	if(!checkSearchedWord(document.form.keyword)){
		 return;
	}
}
function setAddr(){
	let road = document.getElementById("roadAddr").innerHTML;
	let zipno = document.getElementById("zipno").innerHTML;
	let siNm = document.getElementById("siNm").innerHTML;
	let sggNm = document.getElementById("sggNm").innerHTML;
	let emdNm = document.getElementById("emdNm").innerHTML;
	let liNm = document.getElementById("liNm").innerHTML;
	
	
	let f_name = $("#form_name").val();
	let in_addr= $("#set_addr").val();
	let in_detail = $("#set_detail").val();
	let in_zip = $("#set_zipno").val();
	
	if($("#"+f_name+" #"+in_addr).length>0){
		$("#"+f_name+" #"+in_addr).val(road);
	}else{
		$(".zipcode").each(function(){
			if($(this).attr("data-focus") == 'Y'){
				$(this).parent().find("input[name=\'"+in_addr+"']").val(road);
			}
		})
	}
	if($("#"+f_name+" #"+in_zip).length>0){
		$("#"+f_name+" #"+in_zip).val(zipno);
	}else{
		$(".zipcode").each(function(){
			if($(this).attr("data-focus") == 'Y'){
				$(this).parent().find("input[name=\'"+in_zip+"']").val(zipno);
			}
		})
	}
	 jboxClose();	
	 $(".zipcode").prevAll().find("#"+in_addr).focus();
	
}
function getAddr(){
	// 적용예 (api 호출 전에 검색어 체크) 	
	if (!checkSearchedWord(document.form.keyword)) {
		return ;
	}

	$.ajax({
		 url :"https://www.juso.go.kr/addrlink/addrLinkApiJsonp.do" 
		,type:"post"
		,data:$("#form").serialize()
		,dataType:"jsonp"
		,crossDomain:true
		,success:function(jsonStr){
			$("#list").html("");
			var errCode = jsonStr.results.common.errorCode;
			var errDesc = jsonStr.results.common.errorMessage;
			if(errCode != "0"){
				alert(errCode+"="+errDesc);
			}else{
				if(jsonStr != null){
					makeListJson(jsonStr);
					alert("ok?");
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
	    }
	});
}
function makeListJson(jsonStr){
	var htmlStr = "";
	htmlStr += "<table>";
	$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr>";
	htmlStr += "<td><a id='roadAddr' href='javascript:setAddr()'>"+this.roadAddr+"</a></td>";
		htmlStr += "<td><a id='zipno' href='javascript:setAddr()'>"+this.zipNo+"</a></td>";
		htmlStr +="<td><a id='siNm' href='javascript:setAddr()'>"+this.siNm+"</a></td>";
		htmlStr += "<td><a id='sggNm' href='javascript:setAddr()'>"+this.sggNm+"</a></td>";
		htmlStr += "<td><a id='emdNm' href='javascript:setAddr()'>"+this.emdNm+"</a></td>";
		htmlStr += "<td><a id='liNm' href='javascript:setAddr()'>"+this.liNm+"</a></td>";
		htmlStr += "</tr>";
	});
	$("#list").html(htmlStr);
}

</script>
<title>메인페이지</title>	
	
</head>
<body onLoad="init()">
	<div id="box">
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
			<img src="/resources/img/rescheck.png">
		</h2>
		<h2 class="my" id="BOOKMARKFORM" onclick="bookmarklist(this)">
			<img src="/resources/img/bkhospital.png">
		</h2>
		<h2 class="my" id="MYPAGEFORM" onclick="mypage(this)">
			<img src="/resources/img/mypage.png">
		</h2>
		<h2 class="my" id="RDETAIL" onclick="rdetail()"> 
			예약<br/>상세 (임시)
		</h2>
		</div>
	</div>
	
	<!-- NAVER 로그인 스크립트 -->
	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	
	
	
	<!-- 주소찾기 API Script 부분 -->
	<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

 

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }

                // 건물명이 있고, 공동주택일 경우 추가한다.

                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.

                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.

                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
	
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "w6upduuKl6Wl7odmmnUM",
				callbackUrl: "http://localhost:80/NAVERLOG",
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);
		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();
		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					var email = naverLogin.user.getEmail();
					var birthday = naverLogin.user.getBirthday();
					var name = naverLogin.user.getName();
					var id = naverLogin.user.getId();
					
					alert(email+birthday+name+id);
					console.log(naverLogin.user);
									
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					var name = naverLogin.user.getNickName();	
					}
					//window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/sample/main.html");
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	</script>
	
</body>

<script>
var idInfo = "${idInfo}";
function init(){
	
	 
	var LInfo = JSON.parse('${sInfo}'); 
	 alert(idInfo);
	
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

function resdetail() {
	var form = document.createElement("form");
	let id = document.createElement("Input");
	id.name = "Id";
	id.value = idInfo;
	let reCode = document.createElement("Input");
	reCode.name = "reCode";
	reCode.value = "202103091851123451234911";
	form.action = "RDETAIL";
	form.method = "post";

	form.appendChild(id);
	form.appendChild(reCode);
	document.body.appendChild(form);
	form.submit();
	
}


function guCheck(opt){
	let gInfo;
	let sele= document. getElementById('si');
	alert(sele.value);
	let request = new XMLHttpRequest();
	 request.onreadystatechange = function(){
		 if(this.readyState == 4 && this.status == 200){
			 let jsonData = decodeURIComponent(request.response);
			 gInfo = JSON.parse(jsonData); 
			
			// alert("서버와?");
			// alert(jsonData);
			
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

function optionClick(){
	
	let a = document.getElementById("LSEARCH");
	alert(a.value);
 let request = new XMLHttpRequest();
 request.onreadystatechange = function(){
	 if(this.readyState == 4 && this.status == 200){
		 let jsonData = decodeURIComponent(request.response);
	 }
 };
 request.open("POST", "PART",true);
 request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");

 request.send("sCode=LSEARCH&Addr="+a.value);

	
		
}

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
				alert(local.value);
		 }
	 };

	 request.open("POST", "GU2",true);
	 request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	 request.send("sCode=GU2&guName="+gu2);
	
}

function lguoption(json){
	let gu = document.getElementById("GU");
	gu.style.display="none";
	}
	
function reserve(obj) {//예약하러가기 눌럿을때 
	alert(GuName);

	let order =document.getElementById("order");
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