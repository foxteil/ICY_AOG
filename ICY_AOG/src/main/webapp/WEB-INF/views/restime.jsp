<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/mypage.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>예약시간 확인</title>
</head>
<body onload="init()">
   <div id="box"
      style="width: 9cm; height: 10cm; position: relative; left: 4px; top: 4px;">
      <h2>시간</h2>
      <div class="span-hplist" id="span-hplist"
         style="width: 8.29cm; height: 6cm; position: relative; left: 4px; top: 4px;">
      </div>
      <input type="button" id="send" value="날짜 선택 완료" onclick="selecty()">
   </div>

</body>

<script type="text/javascript">
var drInfo = JSON.parse('${dTime}');
let check;
function init (){

   let table = document.createElement('table');
   
   let div = document.getElementById('span-hplist');
   
      for(i=0;i<drInfo.length;i++){
         let tr = document.createElement('tr');
         let td = document.createElement('td');
          check = document.createElement('input');
         let label = document.createElement('label');
         
         
         check.name="checkTime";
         check.id=i;
         check.type="radio";
         check.name="checkTime";
         check.value = drInfo[i].tmCode;
          
         label.for=i;
         label.style.cursor="pointer";
         tr.appendChild(check);
         td.innerHTML = drInfo[i].drsTime+" 예약가능 인원 :"+drInfo[i].AL;
         
         
         tr.appendChild(td);
         label.appendChild(tr);
         table.appendChild(label);
         
         }
      div.appendChild(table);
      
   }
   function selecty(){
	   
      let val = document.getElementsByName("checkTime");
      let checkVal ;
      for(i=0;i<val.length;i++){
         if(val[i].checked==true){
            checkVal=val[i].value;
          
            alert(checkVal);
         	
         }
      }
  
      opener.document.getElementById("getTimec").value = checkVal;//부모창 input태그에 정보 보내줌
      window.close(); //해당 윈도우 닫기
      
   }

</script>
</html>