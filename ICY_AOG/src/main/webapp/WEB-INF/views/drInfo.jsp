<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>drInfo</title>
</head>
<body>
<p> drInfo 페이지 <br>
	받아온 값 : ${test }
</p>
<p>
<button onClick="getSQL()">쿼리문 불러오기</button>
${jsont1 }
</p>

</body>
<script>
function getSQL(){
	let request = new XMLHttpRequest();
	request.onreadystatechange = function(){
		if(this.readyState == 4 && this.status ==200){
			let jsonData = decodeURIComponent(request.response);

			alert(jsonData);
			
		}
	};
	request.open("POST", "DRINFOj", true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	request.send("dCode=f2");
	
}


</script>

</html>