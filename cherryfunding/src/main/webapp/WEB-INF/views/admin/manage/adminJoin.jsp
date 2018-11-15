<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
<link rel='stylesheet' href="${pageContext.request.contextPath}/resources/css/style_adminJoin.css"/>

<script type="text/javascript">


	$(document).ready(function(){
		
		var re = /^[a-zA-Z0-9]{4,12}$/; // 아이디와 패스워드가 적합한지 검사할 정규식
		
		$("#aid").keyup(function(){
			
			var aid=$("#aid").val();
			
			$.ajax({
				url:"<c:url value='/adjoin/confirm?aid="+aid+"'/>",
				dataType:"json",
				success:function(data){
					
					
					if(data.using==true){
						$("#idcheck").html("사용 불가능한 아이디 입니다.");
						$("#lock").css({
							color:'red'
						});
						
					}else if(data.using==false){
						$("#idcheck").html("사용 가능한 아이디 입니다.");
						
						$("#lock").css({
							color:'black'
						});

						if(!re.test(aid)){
								$("#idcheck").html("영문대,소문자, 숫자 4~12 자리로 입력해주세요");
							}
						}
					}
			});
			
		});
		
		
		$("#pwd").keyup(function(){
			
			var pwd = $("#pwd").val();
			
			if(!re.test(pwd)){
				$("#pwdcheck").html("영문대,소문자, 숫자 4~12 자리로 입력해주세요");
			}else{
				$("#pwdcheck").html("");
			}
		});
		
		
		$("#aid").focusout(function(){
			
			$("#aid_span").css({
				border:'1px solid gray'
			});
		});
		
		$("#aid").focus(function(){
			
			$("#aid_span").css({
				border:'1px solid green'
			});
		});
		
		
		
	});

</script>
</head>
<body>

<h1>회원가입</h1>

<form method="post" onsubmit="return adjoin()" action="<c:url value='adjoin'/>">

	<div class="container">
		<div class="row" id=container_row>
			<div>
				<h3>아이디</h3>
			</div>
			<div id="aid_span">
				<input type="text" name="aid" id="aid">
				<i class='fas fa-lock' id="lock"></i>
			</div>
			
			<div class="id_check">
				<span id="idcheck"></span><br>
			</div>
						
			<div class="password">
				<h3>패스워드</h3>
			</div>
			
			<div class="pwd_span" id="pwd_span">
				<input type="password" name="pwd" id="pwd">
				<span id="pwdcheck"></span><br>
			</div>
		
			<div class="nick_name">
				<h3 id="nick_name">닉네임</h3>
			</div>
 
			<div class="cinck_span" id="nick_span">
				<input type="text" name="nick" id="nick"><br>
			</div>
		
			<div class="send">
				<input type="submit" id="send" value="가입하기">
			</div>	
			
			
		</div>
			
	</div>
	
</form>

<script>
	
	function adjoin(){
		
		if(($("#aid").val())==""){
			alert("아이디를 입력해 주세요");
			$("#aid").focus();
			return false;
		}
		
		if(($("#pwd").val())==""){
			alert("패스워드를 입력해 주세요");
			$("#pwd").focus();
			return false;
		}
		if(($("#nick").val())==""){
			alert("아이디를 입력해 주세요");
			$("#nick").focus();
			return false;
		}
		alert("회원가입을 축하합니다");
		return true;
	}

</script>


</body>
</html>