<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script>
	$(document).ready(function(){
			Kakao.init("eeb555e1e14ff239e22268b8ebef717a");
			 //<![CDATA[
		    // 사용할 앱의 JavaScript 키를 설정해 주세요.
		    // 카카오 로그인 버튼을 생성합니다.
		    Kakao.Auth.createLoginButton({
		      container: '#kakao-login-btn',
		      success: function(authObj) {
		        alert(JSON.stringify(authObj));
		        Kakao.API.request({
		        	url:'/v1/user/me',
		        	success: function(res){
		        		
		        	}
		        });
		      },
		      fail: function(err) {
		         alert(JSON.stringify(err));
		      }
		    });
		  //]]>
			
			
			function getKakaotalkUserProfile(){
				Kakao.API.request({
					url: '/v1/user/me',
					success: function(res) {
						console.log(res);
						$("#kakao-profile").append(res.id);
						$("#kakao-profile").append(res.properties.nickname);
						$("#kakao-profile").append(res.uuid);
						$("#kakao-profile").append($("<img/>",{"src":res.properties.profile_image,"alt":res.properties.nickname+"님의 프로필 사진"}));
						$("#kakao-profile").append($("<img/>",{"src":res.properties.thumbnail_image,"alt":res.properties.nickname+"님의 썸네일 사진"}));
					},
					fail: function(error) {
						console.log(error);
					}
				});
			}
			
			
			function createKakaotalkLogin(){
				$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
				var loginBtn = $("<a/>",{"class":"kakao-login-btn","text":"로그인"});
				loginBtn.click(function(){
					Kakao.Auth.login({
						persistAccessToken: true, // 세션이 종료된 뒤에도 Access Token을 사용할 수 있도록 로컬 스토리지에 저장합니다
						persistRefreshToken: true, // 세션이 종료된 뒤에도 Refresh Token을 사용할 수 있도록 로컬 스토리지에 저장합니다
						success: function(authObj) {
							getKakaotalkUserProfile();
							createKakaotalkLogout();
							Kakao.API.request({
								url:'kapi.kakao.com/v1/push/send',
							});
							$.ajax({
								url:'kapi.kakao.com/v1/push/send',
								data:{ Authorization: 'KakaoAK 94993e59908d14bc4fff4e15168f2d01'},
								dataType:'json',
								type:'post',
								success: function(data){
									alert(data);
								}
							});
						},
						fail: function(err) {
							console.log(err);
						}
					});
				});
				$("#kakao-logged-group").prepend(loginBtn)
			}
			function createKakaotalkLogout(){
				$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
				var logoutBtn = $("<a/>",{"class":"kakao-logout-btn","text":"로그아웃"});
				logoutBtn.click(function(){
					Kakao.Auth.logout();
					createKakaotalkLogin();
					alert(Kakao.Auth.getRefreshToken());
					$("#kakao-profile").text("");
				});
				$("#kakao-logged-group").prepend(logoutBtn);
			}
			if(Kakao.Auth.getRefreshToken()!=undefined&&Kakao.Auth.getRefreshToken().replace(/ /gi,"")!=""){
				createKakaotalkLogout();
				getKakaotalkUserProfile();
			}else{
				createKakaotalkLogin();
			}
		});
	</script>
</head>
<body>
	<a id="kakao-login-btn"></a>
	
<a href="http://developers.kakao.com/logout">로그아웃</a>

	<div id="kakao-logged-group"></div>
	<div id="kakao-profile"></div>
	
	
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=89f185a407f3d617bfbb42e27e8f07c9&redirect_uri=http://localhost:9090/cherryfunding/oauth&response_type=code">카카오 로그인 ㅎ</a>
	
	
	
</body>
</html>