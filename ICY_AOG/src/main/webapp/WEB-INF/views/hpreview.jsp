<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/mypage.css">
<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
<title>리뷰페이지</title>
</head>
<bodY>
	<div id="box">
		<a id="little"> <img src="/resources/img/gtg_main.png">
		</a>
			${rvList }
	</div>

</body>
<script>
function doDisplay(i){
	var review = document.getElementById("point"+i);
	if(review.style.display=='none'){
		review.style.display='block';
	}else{
		review.style.display='none';
	}
}
</script>
</html>
