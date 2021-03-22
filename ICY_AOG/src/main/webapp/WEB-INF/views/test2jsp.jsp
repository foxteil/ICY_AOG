<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
   <title>Home</title>
</head>
<body>
<h1>
   Hello world!  
</h1>
<div onclick="addy()" style="background-color: gold">주소입력</div>

<P>  The time on the server is ${serverTime}. </P>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function addy() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
           let addy = data.roadAddress;
           
           Date(addy)
        }
    }).open();
}
function Date(addy) {
   
   alert(addy);
   var form = document.createElement("form");
   form.action = "add?add="+addy;
   form.method = "post";
      
   //form.appendChild(addy);
   document.body.appendChild(form);
   
   form.submit();
}
</script>
<input type="button" value="전송" onClick="Date(addy)" />
    </body>
</html>