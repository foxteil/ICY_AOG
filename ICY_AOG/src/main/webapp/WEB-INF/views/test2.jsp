<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>테스트 jsp</h1>

<p>${test1 }</p>
<p>${test2 }</p>

<button onCLick="getInfo()">서버 갔다와서 정보 가져오기</button>
</body>
<script>
function getInfo(){

   let request = new XMLHttpRequest();
   request.onreadystatechange = function(){
      if(this.readyState == 4 && this.status ==200){
         let jsonData = decodeURIComponent(request.response);
         
         alert(jsonData);
         nextStep(jsonData);
         
      }
   };
   
   request.open("POST", "TEST2", true);
   request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
   request.send("sCode=TEST2");
}

function nextStep(testparam){
   let param = JSON.parse(testparam);
   
   alert(param[0].mId);
   alert(param[1].mId);
}


</script>


</html>