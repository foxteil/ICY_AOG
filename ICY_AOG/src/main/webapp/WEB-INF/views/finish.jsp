<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reserve.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>회원가입</title>
</head>
<body>
	<div id="box">
		<a id="little">
      		<img src="/resources/img/gtg_main.png">
   	    </a>
   	     <div class="span-hplist" style="    width: 8.15cm;
    height: 6.64cm;
    position: relative;
    left: 5px;">
		<h1 class="finish_title">
			<label>예약접수완료</label>
		</h1>
		<br/>
		<span class="finish_info">
			<label>병&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;원 |&nbsp;&nbsp;</label>
			<label>코아이비인후과 </label>
			<br/>
		</span>
		<span class="finish_info">
			<label> 진료과목&nbsp;|&nbsp;&nbsp;</label>
			<label>이비인후과 </label>
			<br/>
		</span>
		<span class="finish_info">
			<label>날&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;짜|&nbsp;&nbsp;</label>
			<label>2021-03-02</label>
			<br/>
		</span>
		<span class="finish_info">
			<label>시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간|&nbsp;&nbsp;</label>
			<label>PM 03:00 </label>
			<br/>
		</span>
		<span class="finish_info">
			<label>예 약  자 &nbsp;|&nbsp;&nbsp;</label>
			<label>target1</label>
			<br/>
		</span>
		</div>
		 </div>
		<button class="res_btn" id="RESCHECK" onclick="reserve(this)">예약내역 확인하러가기</button>
		<button class="res_btn" id="/" onclick="reserve(this)">처음화면으로 돌아가기</button>
	</div>
</body>

<script>
	function reserve(obj) {
		var form = document.createElement("form");
		form.action = obj.id;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
</script>
</html>