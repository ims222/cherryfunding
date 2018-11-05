<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<form method="post" action="testlogin">
		<input type="text" name="id"><br>
		<input type="password" name="pwd">
		<input type="submit" value="login">
	</form>



	<a href="https://kauth.kakao.com/oauth/authorize?client_id=eeb555e1e14ff239e22268b8ebef717a&redirect_uri=http://localhost:9090/oauth&response_type=code">
		카카오 로그인
	</a>
	 


	<a id="kakao-login-btn"></a>
	<a href="http://developers.kakao.com/logout"></a>
	<script type='text/javascript'>
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('eeb555e1e14ff239e22268b8ebef717a');
		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				Kakao.API.request({
					url:'/v1/user/me',
					success: function(res){
						alert(res.properties.nickname + "님 환영합니다.");
					}
				});
				alert(JSON.stringify(authObj));
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
		//]]>
		function logoutWithKakao(){
		    console.log(Kakao.Auth.logout());
		    alert('카카오 로그아웃 완료!');
		    setCookie("kakao_login","",-1);  // 쿠키삭제 (로그아웃)
		    //deleteCookie( "kakao_login" ); 쿠키삭제 다른 방법
		    createLoginKakao();
		    //window.location.href="../index.html";
		}
	</script>
	
	<button onclick="logoutWithKakao()">kko로그아웃</button>
</body>
</html>