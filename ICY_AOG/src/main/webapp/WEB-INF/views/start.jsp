<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/resources/css/reserve.css">
	<link rel="icon" type="/resources/img/png" href="/resources/img/gtg.png">
	<title>메인페이지</title>
</head>
<body>
	<div id="box">
		<button class="btn" id="main" onclick="reserve(this)">로그아웃</button>
		<a id="main_logo" href="start.jsp"> <img src="/resources/img/gtg_main.png"
			style="width: 5cm; height: 5cm; position: relative; left: -8px; top: 80px;">
		</a>
		<div class="res">
		<h2 class="reserve" id="LSEARCH" onclick="reserve(this)"> 
			지역선택
		</h2>
		<div class="partform">
		<h5 class="part" id="PART" onclick="reserve(this)">이비인후과</h5>
		<h5 class="part" onclick="reserve(this)">정형외과</h5>
		<h5 class="part" onclick="reserve(this)">안  과</h5> <br/>
		<h5 class="part" onclick="reserve(this)">통증의학과</h5>
		<h5 class="part" onclick="reserve(this)">내  과</h5>
		<h5 class="part" onclick="reserve(this)">치  과</h5>
		<h5 class="part" onclick="reserve(this)">기  타</h5>
		</div>
		<h2 class="reserve" id="ORDER" onclick="reserve(this)">
			예약하러가기
		</h2>
		</div>
		
		<div class="mypage">
		<h2 class="my" id="RESCHECK" onclick="reserve(this)"> 
			예약<br/>확인
		</h2>
		<h2 class="my" id="BOOKMARKFORM" onclick="reserve(this)">
			관심<br/>병원
		</h2>
		<h2 class="my" id="MYPAGEFORM" onclick="reserve(this)">
			MY
		</h2>
				
		</div>
	</div>
	
	<!-- NAVER 로그인 스크립트 -->
	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "w6upduuKl6Wl7odmmnUM",
				callbackUrl: "http://localhost:80/NAVERLOG",
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);

		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();

		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					var email = naverLogin.user.getEmail();
					var birthday = naverLogin.user.getBirthday();
					var name = naverLogin.user.getName();
					var id = naverLogin.user.getId();
					
					alert(email+birthday+name+id);
					console.log(naverLogin.user);
									
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					var name = naverLogin.user.getNickName();	
					
					
					}

					//window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/sample/main.html");
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	</script>
	
</body>

<script>
	function reserve(opt) {
		var form = document.createElement("form");
		form.action = opt.id;
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
</script>
</html>