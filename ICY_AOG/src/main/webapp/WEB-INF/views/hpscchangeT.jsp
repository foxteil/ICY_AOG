<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/admin.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<script src="/resources/js/scriptlet.js"></script>
<script src="/resources/js/jquery-3.5.1.min.js"></script>
<title>병원-시간기준 휴진 설정</title>
</head>
<body onload="init()">
	<div id=box></div>
</body>
<script>

let modelChangeInfo='${scchage}';
let Data = JSON.parse(modelChangeInfo);
function init(){
	let div = document.getElementById('box');
	div.innerHTML = Data[0].TMCODE + Data[0].STIME+"~"+Data[0].ETIME;
}

</script>
</html>