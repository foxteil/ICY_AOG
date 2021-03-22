<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/reserve.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<script src="/resources/js/scriptlet.js"></script>

<title>예약페이지</title>
<style>

td {
    width: 50px;
    text-align: center;
}
table#calendar {
    width: fit-content;
    float: left;
}
</style>
</head>
<body onLoad="init()">
<div id="box">
    <a id="little">
      <img src="/resources/img/gtg_main.png">
    </a>
    <span class="hpinfo">
    	<div class="info">병     원</div><div class="resinfo" id="hName"></div>
    </span>
     <span class="hpinfo">
   <div class="info">진료과목</div>
   <select name="doctor"  id="pName" style="position: relative; top:9px;left: 30px">
           <option value="paName" class="hpinfo">진료과목선택</option>
        </select> 

  </span>
   
    <a onclick="doDisplay()" style="position: relative;  top: 20px; left: 25px; font-size: 12px;">자세히▼</a>
    
   <div id="current" style="display:none">
		<select name="doctor" id="doctor" style="top: 1px; left:130px;">
    
           <option value="doctor" class="doctor-select" >의사 선택 </option>
         
        </select>                            	
    </div>
    <div class="info" style="position: relative; left: 13px; bottom:1px" onclick="showCalender()">날     짜</div>
    <div>
    <table id="calendar" border="3" align="center"  style="border-color:#3333FF; display:none; " >
    			<tr><!-- label은 마우스로 클릭을 편하게 해줌 -->
   			     <td><label onclick="prevCalendar()"><</label></td>
       			 <td align="center" id="tbCalendarYM" colspan="5">
      			  yyyy년 m월</td>
     			   <td><label onclick="nextCalendar()">></label></td>
			    </tr>
			    <tr>
			        <td align="center"><font color ="gold">일</font></td>
			        <td align="center" >월</td>
			        <td align="center" >화</td>
			        <td align="center" >수</td>
			        <td align="center" >목</td>
			        <td align="center" >금</td>
			        <td align="center" ><font color ="skyblue">토</font></td>
			    </tr> 
			</table>
    </div>
    
    <select name="doctor"  id="target">
           <option value="target" class="doctor-select">대상선택</option>
  
        </select>                            	
<button id="FINISH" onclick="detail(this)">예약</button>
</div>
 <div id="getTimec" style="display:hidden"> </div>
 <div id="fJumin"  style="display:hidden"> </div>
 <div id="drsDate"  style="display:hidden"> </div>
</body>
<script type="text/javascript">
var idInfo = "${idInfo}";
var hInfo = JSON.parse('${hInfo}'); // 병원 정보
var fInfo = JSON.parse('${fInfo}'); // 세대원 정보
var dday = JSON.parse('${tInfo}');// 병원-의사 일자 정보
var drpa = JSON.parse('${pInfo}');//
var dtInfo = JSON.parse('${ddInfo}');
var HPCODE ='${hpCode}';
var selectTmCode = '${tmCode}';


let inp;
let inp2;
let inp3;

function init(){

	let hName = document.getElementById('hName');
	hName.innerHTML = hInfo[0].hpName;
   

	
	if(drpa[0].paName != null){
		let selection = document.getElementById('pName');  
	for(i=0;i<drpa.length;i++){
		let options = document.createElement('option');
		options.value = drpa[i].paName;
		options.innerHTML = drpa[i].paName;
		
		selection.appendChild(options);
		}
	}
	
	
	if(drpa[0].drName != null){
		let selection = document.getElementById('doctor');  
	for(i=0;i<drpa.length;i++){
		let options = document.createElement('option');
		options.value = drpa[i].drName;
		options.innerHTML = drpa[i].drName;
		
		selection.appendChild(options);
		
		
		}
	}
	
	if(fInfo[0].Name != null){
		let selection = document.getElementById('target');
		let faJumin =document.getElementById('fJumin');
		 
		for(i=0;i<fInfo.length;i++){
			let options = document.createElement('option');
			options.value = fInfo[i].mJumin;
			options.innerHTML = fInfo[i].Name;
			
			 inp = document.createElement('input');
	          inp2 = document.createElement('input');
	          inp3 = document.createElement('input');
	         
	         inp.id='mJumin';
	         inp.value=fInfo[i].mJumin;
	         inp.type="hidden";
	         
	         inp2.id='Id';
	         inp2.value=fInfo[i].Id;
	         inp2.type="hidden";
	         
	      
	        
	
	         selection.appendChild(inp2);
	         selection.appendChild(inp);
	         selection.appendChild(options);
	         
		}
		
	}
	
	
	
	
}

	
	
	function doDisplay(){
		var con = document.getElementById("current");
		if(con.style.display=='none'){
			con.style.display=  'block';
		}else{
			con.style.display = 'none';
		}
		
	}
	
	function showCalender(){ //달력:: 호출 function
		let cal = document.getElementById('calendar');
		cal.style.display="block";
		buildCalendar();
	}
	function alertt(day){ //달력:: 날짜 클릭시 나오는 function
		// day.className :: 해당 날자의 (날)일 
		
		day.addEventListener('click',getTime(day.className));
		 
	 }

	function getTime(day){
	
		 //22
		 
	      alert(day);
	      if(day<10){
	         day="0"+day;
	      }else{  
	         day=day;
	      }
	      let cal = document.getElementById("calendar");
	      var form = document.createElement("form");
	      let dd = document.createElement("Input");
	      dd.name = "day";
	      dd.value=day;
	      dd.type="text";
	      
	      let drs =  document.createElement("Input");
	      drs.name="drsDate";
	      drs.value=day;
	      let ds= drs.value
	      drs.type="text";
	      
	      form.action="GETTIME?hpCode="+HPCODE+"&day="+day+"&drsDate="+day;
	      form.method ="post";
// 	      form.appendChild(drs);
// 	      form.appendChild(dd);
	      
	      cal.appendChild(form);
	      document.body.appendChild(form);
	
	      openPopUp(day);
	   
	   }
 
	
		 var datem;
		   var dr;
		   function openPopUp(day){
			 //  alert("dhk?"+dtInfo[0].drsDate);//22
			 alert("day: "+day);
			 
		      datem = day;
		      alert("datem: "+datem);
		     let drss=datem;
		   
		      window.name = "resform"; //부모창 이름 설정
		      var popUrl = "GETTIME?sCode=GETTIME&hpCode="+HPCODE+"&day="+day+"&drsDate="+drss;   //팝업창에 출력될 페이지 URL
		      var popOption = "width=400, height=400, , resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		         window.open(popUrl,"restime",popOption);
		    
		   }

	
	function detail(obj){
	
		alert(datem);
		 
		
		
	      let mJumin = document.getElementById("mJumin").value;
	      alert("jumin:"+mJumin);
	      let tmCode = document.getElementById("getTimec").value;
	      alert("tmCode :" + tmCode);
	      let target = document.getElementById("target").value;
	      alert("변경후  target :"+ target); 
	      let drsDate = document.getElementById("drsDate").value;
	      alert("drsDate :"+datem);
	      
	      
	      
	      
	      let urls = "FINISH?sCode=FINISH&hpCode="+HPCODE+"&day="+datem+"&tmCode="+tmCode
	            +"&paCode="+hInfo[0].paCode+"&mJumin="+target+"&drCode="+dtInfo[0].drCode
	            +"&Id="+idInfo+"&drsDate="+datem;
	              
	      let form = document.createElement('form');
	      form.action = urls;
	      form.method = "POST";
	      
	      document.body.appendChild(form);
	      form.submit();
	}
	function openPrompt(){
		let input = document.createElement('input');
		input.type="checkBox";
		input.value="선택";
		prompt(input.value);
		prompt("전화번호","");
		prompt("주민등록번호","");
		}
</script>
</html>