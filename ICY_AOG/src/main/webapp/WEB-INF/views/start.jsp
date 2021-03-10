<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reserve.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">


<script >

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
		 url :"/sample/getAddrApi.do" 
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
<body>
	<div id="box">
		<button class="btn" id="main" onclick="reserve(this)">로그아웃</button>
		<a id="main_logo" href="start.jsp"> <img src="/resources/img/gtg_main.png"
			style="width: 5cm; height: 5cm; position: relative; left: -8px; top: 80px;">
		</a>
	<form name="form" id="form" method="post">	 
 		<input type="hidden" name="form_name" id="form_name" value="${form_name }"/> 
		<input type="hidden" name="set_addr" id="set_addr" value="${set_addr }"/> 
		<input type="hidden" name="set_detail" id="set_detail" value="${set_detail }"/> 
		<input type="hidden" name="set_zipno" id="set_zipno" value="${set_zipno }"/> 
		<input type="hidden" name="resultType"  value="json"/> 
		
		<input type="hidden" name="currentPage" id="currentPage" value="${currentPage }"/> 
		<input type="hidden" name="countPerPage"  value="5"/> 
		<input type="hidden" name="confmKey" id="confmKey" value="devU01TX0FVVEgyMDIxMDMxMDE4MjcwNDExMDg5ODA="/> 
		
		
		
	
		<div class="search">
			<div class="search_Key">
				<label for="keyword">검색어 :</label>
				<input type="text" id="keywordRoad" name="keyword" title="검색어" class="w250"  onkeydown="enterSearch();" ><br>
			</div>
			
		<input type="button" onClick="getAddr();" value="주소검색하기"/>
		</div>
	
	
</form>

	

<!-- 		<div class="res">
			<select class="reserve" id="LSEARCH" onChange="optionClick()">
				<option selected="selected">지역선택 </option>
				<option value="서울">서울</option>
				<option value="인천">인천</option>
				<option value="경기">경기</option>
				<option value="강원">강원</option>
				<option value="대전">대전</option>
				<option value="충청북도">충북</option>
				<option value="충청남도">충남</option>
				<option value="세종">세종</option>
				<option value="부산">부산</option>
				<option value="울산">울산</option>
				<option value="경상남도">경남</option>
				<option value="경상북도">경북</option>
				<option value="대구">대구</option>
				<option value="광주">광주</option>
				<option value ="전라남도">전남</option>
				<option value="전주">전주</option>
				<option value="전라북도">전북</option>
				<option value="제주">제주</option>
			</select>

			<div class="reserve" id="GU" onChange="lguoption()"></div> --> 
			
	
		<div class="partform">
		<h5 class="part" id="PART" onclick="reserve(this)">이비인후과</h5>
		<h5 class="part" onclick="reserve(this)">정형외과</h5>
		<h5 class="part" onclick="reserve(this)">안  과</h5> <br/>
		<h5 class="part" onclick="reserve(this)">통증의학과</h5>
		<h5 class="part" onclick="reserve(this)">내  과</h5>
		<h5 class="part" onclick="reserve(this)">치  과</h5>
		<h5 class="part" onclick="reserve(this)">기  타</h5>
		</div>
		<h2 class="reserve" id="ORDER" onclick="reserve(this)">
			예약하러가기
		</h2>
		</div>
		
		<div class="mypage">
		<h2 class="my" id="RESCHECK" onclick="reserve(this)"> 
			예약<br/>확인
		</h2>
		<h2 class="my" id="BOOKMARKFORM" onclick="reserve(this)">
			관심<br/>병원
		</h2>
		<h2 class="my" id="MYPAGEFORM" onclick="reserve(this)">
			MY
		</h2>
		</div>
	</div>
</body>

<script>

function goSeachApi(){

}
	


function optionClick(){
	
	let a = document.getElementById("LSEARCH");
	alert(a.value);
 let request = new XMLHttpRequest();
 request.onreadystatechange = function(){
	 if(this.readyState == 4 && this.status == 200){
		 let jsonData = decodeURIComponent(request.response);
		
		 
	  
	 }
 };
 request.open("POST", "GU",true);
 request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");

 request.send("sCode=LSEARCH&Addr="+a.value);

	
		
}
function lguoption(json){
	let gu = document.getElementById("GU");
	gu.style.display="none";
	
	

	}
	
	
	


	function reserve(opt) {
		
		var form = document.createElement("form");
		form.action = opt.id;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}

	
</script>
</html>