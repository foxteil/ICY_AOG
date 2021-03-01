<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/mypage.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>회원정보</title>
</head>
<bodY>
	<div id="box">
		<a id="little"> <img src="/resources/img/gtg_main.png">
		</a>
		<div class="span-hplist"
			style="width: 8.29cm; height: 9.94cm; position: relative; left: 4px; top: 54px;">
			<h1 class="info_title">
			<label>AOG님의 회원정보</label>
		</h1>
		<br/>
		<span class="info_line">
			<label class="info_content">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름|&nbsp;&nbsp;</label>
			<label class="info_content2">고쳐줄게 </label>
			<br/>
		</span>
		<span class="info_line">
			<label class="info_content"> 핸드폰번호&nbsp;|&nbsp;&nbsp;</label>
			<label class="info_content2">010-2021-0228 </label>
			<br/>
		</span>
		<span class="info_line">
			<label class="info_content">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소|&nbsp;&nbsp;</label>
			<label class="info_content2">인천광역시 미추홀구 학익동</label>
			<br/>
		</span>
		
		</div>
		<div style="display: inline-flex; position: relative; top: 59px;">
			<div class="mypage-upinfo" id="UPMINFO" onclick="mypage(this)">회원정보수정</div>
			<div class="mypage-upinfo" id="UPFAFORM" onclick="mypage(this)">세대원수정</div>
			<div class="mypage-upinfo" id="PWFORM" onclick="mypage(this)">비밀번호변경</div>
		</div>
	</div>

</body>

<script type="text/javascript">
	function mypage(obj) {
		var form = document.createElement("form");
		form.action = obj.id + "?word=" + obj.value;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
</script>
</html>