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
<body onLoad="init()">
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
    
	<div id="orderList" onclick="order(this)"></div>
	<div class="span-hplist" >

		<span id="RESFORM"  class="span_resform"></span>
		<div id="current" >
		
		<button id="HDETAIL" onclick="order(this)">자세히</button>
	</div>
	</div>
	</div>

  
  
</body>

<script type="text/javascript">

var idInfo = "${idInfo}";
	function order(obj) {
		var form = document.createElement("form");
		form.action = obj.id;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
			
	}

	let detail ;
	let bk;
	function init(){
		
		let order =document.getElementById("RESFORM");
		let jsonhp= JSON.parse('${hpInfo}');
		let book= JSON.parse('${bkInfo}');
		
		for(j=0;j<book.length;j++){
			let hpName= document.createElement('div');
			hpName.innerHTML= book[j].hpName;
			hpName.style.position="relative";
			hpName.style.left="12px";
			hpName.className = "book";
			order.appendChild(hpName);
	
			let button = document.createElement('button');
			if(book[j].hpName !=null){		
			button.innerHTML="자세히";
			
			bk = document.createElement('div');
			
			bk.value = book[j].hpCode;
			console.log(book[j].hpCode);
			order.appendChild(bk);
			let val = bk.value;
			
			button.onclick= function() {bkdetail(val);};
			
			}else{
				button.style.display="none";
			}order.appendChild(button);

		}
		
		for(i=0;i<jsonhp.length;i++){
		
		let hpName = document.createElement('div');		
		hpName.innerHTML = jsonhp[i].hpName;
		hpName.style.position="relative";
		hpName.style.left="12px";
		hpName.className = "jsonhp";
		order.appendChild(hpName);

		
		let hpPhone = document.createElement('div');
		hpPhone.innerHTML = jsonhp[i].HpPhone;
		order.appendChild(hpPhone);
		
		let button = document.createElement('button');
		if(jsonhp[i].hpCode !=null){		
		button.textContent="자세히";
		
		detail = document.createElement('div');
		
		detail.value = jsonhp[i].hpCode;
		order.appendChild(detail);
		
		let val = detail.value;
		
		button.onclick=function() {hdetail(val);};
		
		}else{
			button.style.display="none";
		}order.appendChild(button);
		}
	}
	
	function hdetail(opt){
		alert(opt);
		var form = document.createElement("form");
		let Id= document.createElement("Input");
		Id.name = "Id";
		Id.value = idInfo;
		Id.type = "text";
		form.action ="HDETAIL?hpCode="+opt;
		form.method = "post";
		
		form.appendChild(Id);
		document.body.appendChild(form);
		form.submit();
		
	}
	function bkdetail(opt){
		
		alert(opt);
		var form = document.createElement("form");
		let Id= document.createElement("Input");
		Id.name = "Id";
		Id.value = idInfo;
		Id.type = "text";
		form.action ="HDETAIL?hpCode="+opt;
		form.method = "post";
		form.appendChild(Id);
		
		document.body.appendChild(form);
		form.submit();
	}
	
</script>
</html>