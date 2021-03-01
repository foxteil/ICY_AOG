<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reserve.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">

<title>예약페이지</title>
</head>
<body>
<div id="box">
    <a id="little">
      <img src="/resources/img/gtg_main.png">
    </a>
    <span class="hpinfo">
    	<div class="info">병     원</div><div class="resinfo">코아이비인후과</div>
    </span>
    <span class="hpinfo">
    	<div class="info">진료과목</div><div class="resinfo">이비인후과</div>
    </span>
    <a onclick="doDisplay()" style="position: relative; top: -11px; left: 276px; font-size: 12px;">자세히▼</a>
    <div id="current" style="display:none">
		<select name="doctor" id="doctor">
           <option value="doctor" class="doctor-select">선생님 </option>
           <option value="doctor1" style="background-color: white; text-align: center;">Dr.김</option>
           <option value="doctor2" style="background-color: white; text-align: center;">Dr.이</option>
           <option value="doctor2" style="background-color: white; text-align: center;">Dr.박</option>
        </select>                            	
    </div>
    <div class="info" style="position: relative; left: 13px; bottom:10px">날     짜</div>
    <img src="/resources/img/cal.png" style="width: 8.2cm; position: relative;left: 15px;top:-10px">
    <select name="doctor" id="doctor">
           <option value="target" class="doctor-select">대상선택</option>
           <option value="target1" style="background-color: white; text-align: center;">target1</option>
           <option value="target2" style="background-color: white; text-align: center;">target2</option>
           <option value="target2" style="background-color: white; text-align: center;">target3</option>
        </select>                            	
<button id="FINISH" onclick="detail(this)">예약</button>
</div>
</body>
<script type="text/javascript">
	function detail(obj){
		var form = document.createElement("form");
		form.action = obj.id;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
	function doDisplay(){
		var con = document.getElementById("current");
		if(con.style.display=='none'){
			con.style.display=  'block';
		}else{
			con.style.display = 'none';
		}
	}
</script>
</html>