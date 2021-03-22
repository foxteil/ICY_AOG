<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/mypage.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@100&display=swap');
</style>
<title>리뷰페이지</title>
</head>
<bodY>
	<div id="box">
		<a id="little"> <img src="/resources/img/gtg_main.png">
		</a>
			${rvForm }
	</div>

</body>
<script type="text/javascript">
let star;
let i;
let count;
function starcheck(i){
	count = i;
}

function submit(reC){
	alert(reC);
	var form = document.createElement("form");
	let rCode = document.createElement("input");
	let grade = document.createElement("input");
	let reCode = document.createElement("input");
	let get = document.getElementById("getReview");
	
	rCode.name = "rCode";
	rCode.value = "insReview";
	grade.name = "grade";
	grade.value = parseInt(count);
	get.name = "rComment";
	
	reCode.name = "reCode";
	reCode.value = reC;
	reCode.style.display = "none";
	
	form.appendChild(reCode);
	
	form.action = "REVIEW";
	form.method = "post";
	
	form.appendChild(rCode);
	form.appendChild(get);
	form.appendChild(grade);
	document.body.appendChild(form);
	form.submit();
	
	let rvBtn = document.getElementById("insRvbtn");
	rvBtn.style.display = none;
}


</script>
</html>