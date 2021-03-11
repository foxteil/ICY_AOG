<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/auth.css">
<link rel="icon" type="img/png" href="/resources/img/gtg.png">

<title>로그인페이지</title>
</head>
<body onLoad="init()">
	<div id="box">
		<a id="main_logo" href="start.jsp">
		   <img src="/resources/img/gtg_main.png"
			style="width: 5cm; height: 5cm; position: relative; left: 70px; top: 50px;">
		</a>
		
		<a id="ADMIN" href="ADMIN">
			<img src="/resources/img/client.png">
		</a>
		
		<input class="in" name="MInfo" id="id" type="text" placeholder="아이디를 입력해주세요." /><br />
		<input class="in" name="MInfo" id="pw" type="password" placeholder="비밀번호를 입력해주세요." /><br />
		<button class="main_btn" id="/" onclick="moveLogin()">로그인</button>
		<button class="main_btn" id="JOINFORM" onclick="moveJoin()">회원가입</button>
		<div class="snsapi">
		<a id="KAKAOLOG" onclick="kakaoLogin()"><img src="/resources/img/kakao.png"></a>
<!-- 		<a id="naverIdLogin" onclick="naverLogin()"><img src="/resources/img/naver.png"></a> -->
		<a id="naverIdLogin"></a>
		<a id="FACEBOOKLOG" onclick="member(this)"><img src="/resources/img/facebook.png"></a>
		<button id="kakaoLogout" onclick="kakaoLogout()">kakaoLogout</button><BR>
		<button id="naverLogout" onclick="naverLogout()">naverLogout</button>
		</div>
		<h3 id="FIND" onclick="member(this)">아이디/비밀번호 찾기</h3>
	</div>
</body>


<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "w6upduuKl6Wl7odmmnUM",
			callbackUrl: "http://localhost:80/NAVERLOG",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 1, height: 56.69} /* 로그인 버튼의 타입을 지정 */
			//callbackHandle: true
			/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
		}		
	);

	/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
	naverLogin.init();

	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = document.createElement("input");
			email.name = "mId";
			email.value = naverLogin.user.getEmail();
			
			var form = document.createElement("form");
			form.action = "NAVERLOG";
			form.method = "post";		
			form.appendChild(email);
	
			document.body.appendChild(form);
			form.submit();
			}
	});

</script>


<script>
function naverLogin2(){
		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					var email = naverLogin.user.getEmail();
					var birthday = naverLogin.user.getBirthday();
					var name = naverLogin.user.getName();
					var id = naverLogin.user.getId();
					
					console.log("email", email);
					console.log("birthday", birthday);
					console.log("name", name);
					console.log("id", id);
					
					var email = document.createElement("input");
					email.name = "mId";
					email.value = naverLogin.user.getEmail();
					
					var birthday = document.createElement("input");
					birthday.name = "mJumin";
					birthday.value = naverLogin.user.getBirthday();
					
					var name = document.createElement("input");
					name.name = "mName";
					name.value = naverLogin.user.getName();
					
					var id = document.createElement("input");
					id.name = "mPw";
					id.value = naverLogin.user.getId();
					
					var form = document.createElement("form");
	 				form.action = "NAVERLOG";
	 				form.method = "post";
					
					form.appendChild(email);
					form.appendChild(birthday);
					form.appendChild(name);
					form.appendChild(id);
					
					document.body.appendChild(form);
	 				form.submit();
					
					console.log(naverLogin.user);
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}

					//window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/sample/main.html");
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
}
</script>

<!-- KAKAO 로그인 -->
<script src='https://code.jquery.com/jquery-3.1.1.min.js'></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script> 
		Kakao.init("9672f623897e7275d375cf79f9250728");
		console.log(Kakao.isInitialized()) // SDK 초기화 여부 판단
		
		function kakaoLogin() {
		    //로그인하고
		    Kakao.Auth.login({
		      success: function (response) {
		        //사용자 정보 가져오기
		        Kakao.API.request({
		          url: '/v2/user/me', //계정 정보를 가져오는 request url
		          success: function (response) {
								var email = response.kakao_account.email;
								var birthday = response.kakao_account.birthday;
								var name = response.properties.nickname;
				        	  	var id = response.id;
								//var gender = response.kakao_account.gender;
								//var age_range = response.kakao_account.age_range;
								//var image = response.properties.profile_image;
								console.log("email", email);
								console.log("birthday", birthday);
								console.log("name", name);
								
								var email = document.createElement("input");
								email.name = "mId";
								email.value = response.kakao_account.email;
								
								var birthday = document.createElement("input");
								birthday.name = "mJumin";
								birthday.value = response.kakao_account.birthday;
								
								var name = document.createElement("input");
								name.name = "mName";
								name.value = response.properties.nickname;
								
								var id = document.createElement("input");
								id.name = "mPw";
								id.value = response.id;
								
								var form = document.createElement("form");
								//form.action = "FACEBOOKLOG?mId="+email;
								form.action = "KAKAOLOG";
								form.method = "post";
								
								
								form.appendChild(email);
								form.appendChild(birthday);
								form.appendChild(name);
								form.appendChild(id);
								
								document.body.appendChild(form);
								form.submit();
								
								
// 								var html ='<BR>'+ email + '<BR>'+ name +'<BR>'+ id
// 										 +'<BR>'+ gender +'<BR>'+ birthday+'<BR>'+ age_range;
// 								html += '<BR><img src="'+ image + '">';
								
// 								$('body').append(html);  
		            let user = response.kakao_account //카카오 계정 정보
		            //console.log(user)
		            user.host = 'kakao' //다른 로그인 서비스와 구분하기 위해서 개인적으로 추가했음
		            // 해당 페이지에서 객체를 만들고 곧바로 user 정보를 사용할 수 도 있고,
		            // input 엘리먼트에 json으로 저장해뒀다가 나중에 사용할 수도 있음. 여기서는 input에 저장
		            console.log(response);
		            const userinfo = document.querySelector('#userinfo')
		            if (userinfo) userinfo.value = JSON.stringify(user) //user를 json문자열로 변환해서 저장해두기
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		  }
		
		  function kakaoLogout() {
		    if (Kakao.Auth.getAccessToken()) {
		      //토큰이 있으면
		      Kakao.API.request({
		        //로그아웃하고
		        url: '/v1/user/unlink',
		        success: function (response) {
		          //console.log(response)
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      //토큰도 삭제
		      Kakao.Auth.setAccessToken(undefined)
		      //유저정보도 삭제
		      const userinfoElem = document.querySelector('#userinfo') 
		      if(userinfoElem) userinfoElem.value = ''
		    }
		  }
</script>

<script>
	function moveLogin(){
		var mId = document.getElementsByName("MInfo")[0];
		var mPw = document.getElementsByName("MInfo")[1];
		var logCode = document.createElement("input");
		logCode.name = "logCode";
		logCode.value= "U";
		mId.name = "mId";
		mPw.name ="mPw";
		
		var form = document.createElement("form");
		//form.action = "LOGIN?mId="+id+"&mPw="+pw+"&logCode=U";
		form.action = "LOGIN";
		form.method = "post";
		
		form.appendChild(mId);
		form.appendChild(mPw);
		form.appendChild(logCode);
		
		document.body.appendChild(form);
		form.submit();
	}
	
	function moveJoin(){
		var form = document.createElement("form");
		form.action = "JOINFORM?&jCode=U";
		form.method = "post";
		document.body.appendChild(form);
		form.submit();
	}
	
	function init(){
		var msg = "${msg}";
	 	if (msg != ""){ 
			alert(msg);
			}
	}
	
	function naverLogout() {
		var win = window.open("https://nid.naver.com/oauth2.0/token?grant_type=delete"
				+"&client_id=w6upduuKl6Wl7odmmnUM&client_secret=D_ZtWS1cUh"
				+"&access_token=AAAAOZPj500KLMOi2FNv_zbG4t3csvL7eaalzfD7nIa0tgSwupj-3YKvmfUcKLMLZDmQRbU7CJLFlR2pqBZpDHo1ZB4"
				+"&service_provider=NAVER", "PopupWin", "width=400,height=200");
		win.document.write("<p>NAVER 계정이 로그아웃되었습니다.</p>");
	}
</script>
</html>