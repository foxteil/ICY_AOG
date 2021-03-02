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
	<div id="box">
		<a id="little"> <img src="/resources/img/gtg_main.png">
		</a>
		<div class="span-hplist"
			style="width: 8.29cm; height: 4.09cm; position: relative; left: 4px; top: 4px;">
			<span class="fainfo_line"> <label class="fainfo_content">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름&nbsp;|&nbsp;&nbsp;</label>
				<label class="fainfo_content2">고쳐줄게 </label>
			</span> <span class="fainfo_line"> <label class="fainfo_content">전&nbsp;화&nbsp;번&nbsp;호&nbsp;|&nbsp;&nbsp;</label>
				<label class="fainfo_content2">010-0228-2021 </label>
			</span> <span class="fainfo_line"> <label class="fainfo_content">생&nbsp;년&nbsp;월&nbsp;일&nbsp;|&nbsp;&nbsp;</label>
				<label class="fainfo_content2">1999/02/28(여) </label>
			</span>
			<div style="display: inline-flex; position: relative; top: 59px;">
				<div class="mypage-upinfo" id="UPFAMILY" onclick="mypage(this)">변경</div>
			</div>
			<div style="display: inline-flex; position: relative; top: 59px;">
				<div class="mypage-upinfo" id="UPFAMILY" onclick="mypage(this)">삭제</div>
			</div>
		</div>
		<div style="display: inline-flex; position: relative; top: 59px;">
			<div class="mypage-upinfo" id="UPFAMILY" onclick="openPopUp()">추가</div>
			<div class="mypage-upinfo" id="UPFAMILY" onclick="openPrompt()">추가</div>
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
	
	function openPopUp(){
		var popUrl = "FAMILY";	//팝업창에 출력될 페이지 URL
		var popOption = "width=400, height=400, , resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
	}
	function openPrompt(){
		prompt("이름","");
		prompt("전화번호","");
		prompt("주민등록번호","");
		}



</script>
</html>