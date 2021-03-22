<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reserve.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@100&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap');
</style>
<title>예약리스트</title>
</head>
<bodY>
  <div id="box">
    <a id="little">
      <img src="/resources/img/gtg_main.png">
    </a> 
    ${hobby }
    ${hpList }
  </div>
  
</body>

<script type="text/javascript">
	function init(){
		if("$hobby"!=""){
		alert('$hobby');
		}
	}
	function hdetail(info) {
		alert(info);
		var form = document.createElement("form");
		form.action = "HDETAIL";
		form.method = "post";
		document.body.appendChild(form);
		form.submit();

	}
	function order(info) {
		alert(info);
		var form = document.createElement("form");
		form.action ="ORDER";
		form.method = "post";
		document.body.appendChild(form);
		form.submit();

	}
	function bk(info){
		
		alert(info);
		let bk = info.split(":");
		let index = bk[2];
		var insArray = new Array();
		let bktoJson = new Object();
		bktoJson.Id = bk[0];
		bktoJson.hpCode = bk[1];
		insArray.push(bktoJson);
		console.log(bktoJson);
		
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				//let jsonData = decodeURIComponent(request.response);
				console.log(bktoJson);
				delbkList(index);
				//console.log(jsonData);
				//insfaselect(jsonData,phone);
			}
		};
		request.open("POST", "BOOKMARK", true);
		request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		request.send("BOOKMARK?sCode=BOOKMARK&Id="+bk[0]+"&hpCode="+bk[1]);
	}
	function delbkList(i){
		alert(i);
		 var header = document.querySelector("#info"+i);	//제거하고자 하는 엘리먼트
	      header.parentNode.removeChild(header);
		  
	}
	function doDisplay(){
		var con = document.getElementById("current");
		con.style.display="blcok";
		if(con.style.display=='none'){
			con.style.display=  'block';
		}else{
			con.style.display = 'none';
		}
	}
</script>
</html>