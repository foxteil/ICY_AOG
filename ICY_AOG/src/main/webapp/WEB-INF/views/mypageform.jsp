<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/mypage.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>예약리스트</title>
</head>
<bodY>
  <div id="box">
    <a id="little">
      <img src="/resources/img/gtg_main.png">
    </a>
    <div style="display: inline-flex; position: relative; top: 59px;">
    <div class="mypage-info" id="UPMINFORM" onclick="upminform(this)">회원정보수정</div>
    <div class="mypage-info" id="RESCHECK" onclick="mypage(this)">예약확인</div>
    </div>
    <div class="span-hplist" style="width: 8.29cm; height: 9.94cm; position: relative;left: 4px; top: 54px;">
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
	function upminform(obj){
		
		var prompt_test = prompt("비밀번호확인","");
		var form = document.createElement("form");
		form.action = obj.id + "?word=" + obj.value;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
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