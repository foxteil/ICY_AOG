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
   	    <div class="span-hplist" style="width: 8.15cm; height: 0.5cm; position: relative;left: 5px;">
   	    <h1 class="finish_title" >
			<label style="position: relative; bottom: 41px;">예약리스트</label>
		</h1>
			</div>
		<br/>
		  <div class="span-hplist" style="width: 8.15cm; height: 3.64cm; position: relative;left: 5px; top:-12px">
		<span class="check_info">
			<label>병&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;원 |&nbsp;&nbsp;</label>
			<label>코아이비인후과 </label>
			<br/>
		</span>
		<span class="check_info">
			<label> 진료과목&nbsp;|&nbsp;&nbsp;</label>
			<label>이비인후과 </label>
			<br/>
		</span>
		<span class="check_info">
			<label>날&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;짜|&nbsp;&nbsp;</label>
			<label>2021-03-02</label>
			<br/>
		</span>
		<span class="check_info">
			<label>시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간|&nbsp;&nbsp;</label>
			<label>PM 03:00 </label>
			<br/>
		</span>
		<span class="check_info">
			<label>예 약  자 &nbsp;|&nbsp;&nbsp;</label>
			<label>target1</label>
			<br/>
		</span>
<button class="res_btn" onclick="detail(this)">확인중</button>
<button class="res_btn" id="CANCLE" onclick="detail(this)">예약취소</button>
<br/>
</div>
<div class="span-hplist" style="width: 8.15cm; height: 3.64cm; position: relative;left: 5px;top: -7px;">
		<span class="check_info">
			<label>병&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;원 |&nbsp;&nbsp;</label>
			<label>코아이비인후과 </label>
			<br/>
		</span>
		<span class="check_info">
			<label> 진료과목&nbsp;|&nbsp;&nbsp;</label>
			<label>이비인후과 </label>
			<br/>
		</span>
		<span class="check_info">
			<label>날&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;짜|&nbsp;&nbsp;</label>
			<label>2021-03-02</label>
			<br/>
		</span>
		<span class="check_info">
			<label>시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간|&nbsp;&nbsp;</label>
			<label>PM 03:00 </label>
			<br/>
		</span>
		<span class="check_info">
			<label>예 약  자 &nbsp;|&nbsp;&nbsp;</label>
			<label>target1</label>
			<br/>
		</span>
<button class="res_btn" onclick="detail(this)">진료완료</button>
<button class="res_btn" id="REVIEW" onclick="detail(this)">리뷰작성</button>

</div>
<button id="MYPAGEFORM" onclick="detail(this)">MYPAGE</button>
</div>
</body>
<script>
	function detail(obj){
		var form = document.createElement("form");
		form.action = obj.id;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
		
	}
</script>
</html>