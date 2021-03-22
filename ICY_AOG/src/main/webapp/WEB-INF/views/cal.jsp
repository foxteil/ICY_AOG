<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/admin.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>메인페이지</title>

<style type="text/css">
        td{
            width: 50px;
            height: 50px;
            text-align: center;
            font-size: 20px;
            font-family: 굴림;
            border:2px border-color:#3333FF;
            border-radius: 8px;/*모서리 둥글게*/
        }
        tr td {
        
        }
    </style>
<script type="text/javascript">
        var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
        var date = new Date();//today의 Date를 세어주는 역할
        function prevCalendar() {//이전 달
        // 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
        //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
        //getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
         today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
         buildCalendar(); //달력 cell 만들어 출력 
        }
 
        function nextCalendar() {//다음 달
            // 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
            //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
            //getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
             today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
             buildCalendar();//달력 cell 만들어 출력
        }
        function buildCalendar(){//현재 달 달력 만들기
            var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
            //이번 달의 첫째 날,
            //new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
            //new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
            //왜냐면 getMonth()는 0~11을 반환하기 때문
            var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
            //이번 달의 마지막 날
            //new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
            //day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
            //대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
            var tbCalendar = document.getElementById("calendar");
            //날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
            var tbCalendarYM = document.getElementById("tbCalendarYM");
            //테이블에 정확한 날짜 찍는 변수
            //innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
            //new를 찍지 않아서 month는 +1을 더해줘야 한다. 
             tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; 
 
             /*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
            while (tbCalendar.rows.length > 2) {
            //열을 지워줌
            //기본 열 크기는 body 부분에서 2로 고정되어 있다.
                  tbCalendar.deleteRow(tbCalendar.rows.length-1);
                  //테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
                //30일 이후로 담을달에 순서대로 열이 계속 이어진다.
             }
             var row = null;
             row = tbCalendar.insertRow();
             //테이블에 새로운 열 삽입//즉, 초기화
             var cnt = 0;// count, 셀의 갯수를 세어주는 역할
            // 1일이 시작되는 칸을 맞추어 줌
             for (i=0; i<doMonth.getDay(); i++) {
             /*이번달의 day만큼 돌림*/
                  cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                  
                  cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
             }
            /*달력 출력*/
             for (i=1; i<=lastDate.getDate(); i++) { 
             //1일부터 마지막 일까지 돌림
                  cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                  cell.innerHTML = i;//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
                  cell.className=i;
                  
                  let cellName= cell.className;
                  cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
                  cell.addEventListener('click',function (){alertt(cellName);});
              if (cnt % 7 == 1) {/*일요일 계산*/
                  //1주일이 7일 이므로 일요일 구하기
                  //월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
                cell.innerHTML = "<font color=#F79DC2>" + i
                //1번째의 cell에만 색칠
            }    
              if (cnt%7 == 0){/* 1주일이 7일 이므로 토요일 구하기*/
                  //월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
                  cell.innerHTML = "<font color=skyblue>" + i
                  //7번째의 cell에만 색칠
                   row = calendar.insertRow();
                   //토요일 다음에 올 셀을 추가
              }
              /*오늘의 날짜에 노란색 칠하기*/
              if (today.getFullYear() == date.getFullYear()
                 && today.getMonth() == date.getMonth()
                 && i == date.getDate()) {
                  //달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
                cell.bgColor = "#FAF58C";//셀의 배경색을 노랑으로 
               }
             }
            
        }
    </script>

</head>
<body>
	<div id="admin-box">
		<a id="little"> <img src="/resources/img/gtg_main.png">
		</a>
		<div class="admin_title">
			<h2 class="admin_btn1" id="RESERVELIST">예약리스트</h2>
		
		<button id="RESERVELIST" value="123456789A" onclick="reserveList(this)">자세히</button>
	
		
			<h2 class="admin_btn1" id="HPREVIEW" onClick="hpReview(this)">병원리뷰</h2>
			<h2 class="admin_btn1" id="SCHEDULEFORM" onClick="hpSch(this)"><input type="hidden" value="2" id="hpSch"></input>일정표</h2>
			<h2 class="admin_btn1" id="DRINFO" onClick="doDisplay(this)"><input type="hidden" value="3" id="hpBasic"></input>기본</h2>
		</div>
		<div id="desk" style="background-color: white; width:1250px; height:500px; margin-left:30px; ">
		<div id="desk1"></div>
				<input type="hidden" id="desklet">
			
				<table id="calendar" border="3" align="center" style="border-color:#3333FF; display:none ">
    			<tr><!-- label은 마우스로 클릭을 편하게 해줌 -->
   			     <td><label onclick="prevCalendar()"><</label></td>
       			 <td align="center" id="tbCalendarYM" colspan="5">
      			  yyyy년 m월</td>
     			   <td><label onclick="nextCalendar()">></label></td>
			    </tr>
			    <tr>
			        <td align="center"><font color ="gold">일</td>
			        <td align="center" onClick="test(this)">월</td>
			        <td align="center" onClick="test(this)">화</td>
			        <td align="center" onClick="test(this)">수</td>
			        <td align="center" onClick="test(this)">목</td>
			        <td align="center" onClick="test(this)">금</td>
			        <td align="center" onClick="test(this)"><font color ="skyblue">토</td>
			    </tr> 
			</table>
		</div>
		<div class="admin_title">
			<h3 class="admin_btn1" onClick="">의사 스케쥴</h3>
			<h3 class="admin_btn1" onClick="showHpSch()">병원 전체 휴진</h3>
		</div>
		
		
		</div>
		<input type="hidden" value="123456789A" id="hpCode">
</body>

<script>

var hpCode=document.getElementById("hpCode").value;

function test(date){
	alert(date.textContent);
}

function reserveList(reserver){
	let request = new XMLHttpRequest();
	request.onreadystatechange = function(){
		if(this.readyState == 4 && this.status ==200){
			let jsonData = decodeURIComponent(request.response);

			var rjson = JSON.parse(jsonData);
						
 			let div = document.getElementById("desk");
 			
 			let d1 = document.createElement("div");
 			let d2 = document.createElement("div");
 			let d3 = document.createElement("div");
 			let inp1 = document.createElement("div");
 			let inp2 = document.createElement("div");
 			let inp3 = document.createElement("div");
 			
 			inp1.textContent=rjson[0].RDATE+" 예약자:" +rjson[0].FNAME+" 핸드폰 번호" +rjson[0].FPHONE;
 			inp2.textContent=rjson[1].RDATE+" 예약자:" +rjson[1].FNAME+" 핸드폰 번호"+rjson[1].FPHONE;
 			inp3.textContent=rjson[2].RDATE+" 예약자:" +rjson[2].FNAME+" 핸드폰 번호" +rjson[2].FPHONE;
 			
 			d1.appendChild(inp1);
 			d2.appendChild(inp2);
 			d3.appendChild(inp3);
 			
 			div.appendChild(d1);
 			div.appendChild(d2);
 			div.appendChild(d3);
		}
	};
	
	request.open("POST", "RESERVELIST", true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	request.send("sCode=RESERVELIST&hpCode="+hpCode);
	}

function hpReview(info){
	let request = new XMLHttpRequest();
	request.onreadystatechange = function(){
		if(this.readyState == 4 && this.status ==200){
			let jsonData = decodeURIComponent(request.response);

			var rjson = JSON.parse(jsonData);
						
 			let div = document.getElementById("desk");
 			let d1 = document.createElement("div");
 			let d2 = document.createElement("div");
 			let d3 = document.createElement("div");
 			let inp1 = document.createElement("div");
 			let inp2 = document.createElement("div");
 			let inp3 = document.createElement("div");
 			
 			inp1.textContent=rjson[0].rvDate+" 리뷰 :" +rjson[0].rvId+" 평점 :" +rjson[0].rvGrade +" 코멘트"+rjson[0].rvComment;
 			inp2.textContent=rjson[1].rvDate+" 리뷰 :" +rjson[1].rvId+" 평점 :" +rjson[1].rvGrade +" 코멘트"+rjson[1].rvComment;
 
 			
 			d1.appendChild(inp1);
 			d2.appendChild(inp2);
 			d3.appendChild(inp3);
 			
 			div.appendChild(d1);
 			div.appendChild(d2);
 			div.appendChild(d3);
		}
	};
	
	request.open("POST", info.id, true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	request.send("sCode="+info.id+"&hpCode="+hpCode);
	
}

function hpSch(info){
	let request = new XMLHttpRequest();
	request.onreadystatechange = function(){
		if(this.readyState == 4 && this.status ==200){
			let jsonData = decodeURIComponent(request.response);

			var rjson = JSON.parse(jsonData);
						
 			let desk = document.getElementById("desk");
 			let d1 = document.createElement("div");
 			let d2 = document.createElement("div");
 			let d3 = document.createElement("div");
 			let inp1 = document.createElement("div");
 			let inp2 = document.createElement("div");
 			let inp3 = document.createElement("div");
 			
 			inp1.textContent=rjson[0].TMCODE+"타임"+"  시간대:" +rjson[0].STIME+" ~ "+rjson[0].ETIME +" 가능인원"+rjson[0].AVAIL+" 최대인원"+rjson[0].LIMIT;
 			inp1.textContent=rjson[1].TMCODE+"타임"+"  시간대:" +rjson[1].STIME+" ~ "+rjson[1].ETIME +" 가능인원"+rjson[1].AVAIL+" 최대인원"+rjson[1].LIMIT;
 
 			
 			d1.appendChild(inp1);
 			d2.appendChild(inp2);
 			d3.appendChild(inp3);
 			
 			desk.appendChild(d1);
 			desk.appendChild(d2);
 			desk.appendChild(d3);
		}
	};
	
	request.open("POST", info.id, true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	request.send("sCode="+info.id+"&hpCode="+hpCode);
	
}

function showHpSch(){
	buildCalendar();//
}

function alertt(date){
	let tr = document.createElement("table");
}


// ateDiv.addEventListener('click',function(){divClick(movie[0].mvCode,this.textContent);});
// 		
</script>
</html>