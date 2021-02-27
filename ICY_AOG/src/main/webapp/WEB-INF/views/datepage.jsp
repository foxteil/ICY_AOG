<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/resources/css/data.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="reserve-container">  
        <div class="movie-part"></div>
         <div class="day-part" ></div>
            <div class="reserve-title">${Dimage }</div>
             <div class="reserve-title">날짜</div>
          
              <div class="reserve-date" onclick="dayClickEvent()" ></div>
        </div>
    
       
       

    

   
</body>
</html>

   <script>
   
   
   const date = new Date();
   // console.log(date.getFullYear());
   const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
   const reserveDate = document.querySelector(".reserve-date");

 
       const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"]
       const year = date.getFullYear();
       const month = date.getMonth();
       for (i = date.getDate(); i < lastDay.getDate(); i++) {

           const button = document.createElement("button");
           const spanWeekOfDay = document.createElement("span");
           const spanDay = document.createElement("span");

           //class넣기
        

           //weekOfDay[new Date(2020-03-날짜)]
           const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];

           //요일 넣기
           if (dayOfWeek === "토") {
               spanWeekOfDay.classList.add("saturday");
               spanDay.classList.add("saturday");
           } else if (dayOfWeek === "일") {
               spanWeekOfDay.classList.add("sunday");
               spanDay.classList.add("sunday");
           }
           spanWeekOfDay.innerHTML = dayOfWeek;
           button.append(spanWeekOfDay);
           //날짜 넣기
           spanDay.innerHTML = i;
           button.append(spanDay);
           //button.append(i);
           reserveDate.append(button);

           dayClickEvent(button);
       }

   


   function dayClickEvent(button) {
       button.addEventListener("click", function() {
           const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
           movieDateWrapperActive.forEach((list) => {
               list.classList.remove("movie-date-wrapper-active");
           })
           button.classList.add("movie-date-wrapper-active");
       })
   }
</script>
<!-- <!-- <script> --> 
<%-- //   let dayStr = "${Access}"; --%>
<!-- //    let day = (dayStr.split(" "))[0].split("-"); -->
<!-- //    let now = new Date(); -->

<!-- //    now.setFullYear (parseInt(day[0]),parseInt(day[1])-1,parseInt(day[2])); -->
<!-- //    alert(now); -->
<!-- //    now.setDate(now.getDate()+30); -->
<!-- //    alert(now); -->
