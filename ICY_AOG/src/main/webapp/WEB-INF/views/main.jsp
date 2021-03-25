<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/resources/css/auth.css">
	<link rel="icon" type="img/png" href="/resources/img/gtg.png">
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<meta name="google-signin-scope" content="profile email">
	<meta name="google-signin-client_id" 
	content="155109421207-7qrhuq2f8pp44se51r25qjmg942bc5ov.apps.googleusercontent.com">
	<script src="https://apis.google.com/js/platform.js" async defer></script>
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
		<button class="main_btn" id="/" onclick="moveLogin();">로그인</button>
		<button class="main_btn" id="JOINFORM" onclick="moveJoin();">회원가입</button>
		<div class="snsapi">
		<a id="KAKAOLOG" onclick="kakaoLogin()"><img src="/resources/img/kakao.png"></a>
		<a id="naverIdLogin"></a>
<!-- 		<a id="FACEBOOKLOG" onclick="member(this)"><img src="/resources/img/facebook.png"></a> -->
		<a class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></a>
    	<button type="button" onClick="signOut();">구글 logout</button><br>
		<button id="kakaoLogout" onclick="kakaoLogout();">카카오 logout</button><BR>
		</div>
		<h3 id="FIND" onclick="member(this)">아이디/비밀번호 찾기</h3>
	</div>
	
	<!-- GOOGLE 로그인 -->
	<script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        //alert(profile.getId());
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        alert(profile.getName());
        
        var name = document.createElement("input");
		name.name = "mName";
		name.value = profile.getName();
        
		var gId = document.createElement("input");
		gId.name = "mPw";
		gId.value = profile.getId();
		
		var email = document.createElement("input");
		email.name = "mId";
		email.value = profile.getEmail();
		
		var form = document.createElement("form");
		form.action = "GOOGLELOG";
		form.method = "post";

		form.appendChild(name);
		form.appendChild(gId);
		form.appendChild(email);
		document.body.appendChild(form);
		form.submit();
		
        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      }
      
      function signOut(){
    	  gapi.auth2.getAuthInstance().disconnect();
      }
	</script>
	
</body>
<!-- NAVER 로그인 -->
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "w6upduuKl6Wl7odmmnUM",
			callbackUrl: "http://localhost:80/NAVERLOG",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 1, height: 56.69} /* 로그인 버튼의 타입을 지정 */
		}		
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
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
								
								alert(email+birthday+name+id);
								
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
	
</script>
</html>