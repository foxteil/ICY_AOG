<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reserve.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>예약리스트</title>
</head>
<body onLoad="init()" >
  <div id="box">
    <a id="little">
      <img src="/resources/img/gtg_main.png">
    </a>
	<span class="span-search">
	  <input type="text">
		<a id="SEARCH" onclick="order(this)">
		  <img src="/resources/img/search.png">
		</a>
	</span>
	<div id=orderList>
	<div class="span-hplist" >
		<span id="RESFORM" onclick="order(this)">
			<span class="hpname" style="position:relative; left:12px;">인천일보의원</span>
			<span class="hppart" style="position: relative;left: 93px;">이비인후과</span>
			</span>
	<a onclick="doDisplay()" style="    position: relative; top: 21px; left: 22px; font-size: 12px;">>>상세보기 </a>
		<div id="current" style="display:none">
			<span class="hptime"> <br>평일   09:00 - 21:00 | 토요일 09:00 - 17:00|
			<br>일요일 09:00 - 16:00 | 공휴일 09:00 - 16:00
		</span>
		<button id="HDETAIL" onclick="order(this)">자세히</button>
	</div>
	</div>
	</div>

  </div>
  
</body>

<script type="text/javascript">
alert("${hpInfo}");
	function order(obj) {
		var form = document.createElement("form");
		form.action = obj.id + "?word=" + obj.value;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
		
		
		
	}
	
	function init(){
		let resform =document.getElementById("RESFORM");
		let jsonhp= JSON.parse("${hpInfo}");
			
		
		let hName = document.createElement('Div');		
		hName.textContent = jsonhp[0].hpName;
		hName.classname = "jsonhp";
		resform.appendChild(hName);
		
		let hPart = document.createElement('div');
		hPart.textContent = jsonhp[0].paName;
		hPart.clessname = "jsonhp";
		resform.appendChild(hPart);

		
		
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
	
	
	function hdetail(opt){
		
		
		
		alert("${dInfo}");
		var form = document.createElement("form");
		form.action = opt.id+"?hpCode=123456789A";
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
		
	}
	


	
	
</script>
</html>