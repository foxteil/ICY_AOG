<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/mypage.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>세대원정보수정</title>
</head>
<bodY>
	<div id="box"
		style="width: 9cm; height: 9.03cm; position: relative; left: 4px; top: 4px;">
		<div class="span-hplist"
			style="width: 8.29cm; height: 3.09cm; position: relative; left: 4px; top: 4px;">
			<span class="fainfo_line"> 
				<label class="fainfo_content">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름&nbsp;&nbsp;|&nbsp;&nbsp;</label>
				<input type="text" class="fainfo_input">
			</span> 
			<span class="fainfo_line"> 
				<label class="fainfo_content">전&nbsp;화&nbsp;번&nbsp;호&nbsp;&nbsp;|&nbsp;&nbsp;</label>
				<input type="text" class="fainfo_input">
			</span> 
			<span class="fainfo_line"> 
				<label class="fainfo_content">주민등록번호|&nbsp;&nbsp;</label>
				<input type="text" class="fainfo_input">
			</span>
			<span class="check">
				<input type="checkbox">가족 대리접수 동의(필수)
			</span>
			<p class="confirm">* 가족(부모/자녀)등록시 등록하는 가족의 위임을 받았음을 확인합니다.
* 무단으로 대리접수 시 개인정보처리에 관한 법률에 위배될 수 있습니다.(등록할 대상에 한하여 1회 동의 진행)
			</p>
			<div style="display: inline-flex; position: relative; top: 59px;">
				<div class="mypage-upinfo" id="UPFAMILY" onclick="mypage(this)">확인</div>
			</div>
		</div>
		
	</div>

</body>

<script type="text/javascript">
	function mypage(obj) {
		var form = document.createElement("form");
		form.action = obj.id;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
</script>
</html>