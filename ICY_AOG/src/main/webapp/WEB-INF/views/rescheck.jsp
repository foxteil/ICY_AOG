<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reserve.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>예약내역확인</title>
</head>
<body>
<div id="box">
		<a id="little">
      		<img src="/resources/img/gtg_main.png">
   	    </a>
   	   ${reList }


<button id="MYPAGEFORM" onclick="detail(this)">MYPAGE</button>
</div>
</body>
<script>
	function review(reC){
		alert(reC);
		var form = document.createElement("form");
		let rCode = document.createElement("input");
		let reCode = document.createElement("input");
		
		rCode.name = "rCode";
		rCode.value = "rvForm";
		rCode.style.display = "none";
		
		reCode.name = "reCode";
		reCode.value = reC;
		reCode.style.display = "none";
		
		form.action = "REVIEW";
		form.method = "post";
		
		form.appendChild(reCode);
		form.appendChild(rCode);
		document.body.appendChild(form);
		form.submit();
		
	}
</script>
</html>