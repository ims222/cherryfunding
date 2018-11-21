<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel='stylesheet' href="${pageContext.request.contextPath}/resources/css/style_usersJoin.css"/>
<script type="text/javascript">
	$(document).ready(function(){
		$("input[name='id']").on('keyup', function(){ //아이디 체크
			var length = $(this).val().length
			if(length < 5 || length > 20){
				$('#idCheck').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다');
				return;
			}
			var id = $(this).val();
			$.ajax({
				url:'${pageContext.request.contextPath}/users/idCheck',
				data:{id:id},
				dataType:'json',
				type:'post',
				success: function(data){
					if(data.result === 'ok'){
						$('#idCheck').text('사용가능한 아이디입니다');
					}else{
						$('#idCheck').text('중복된 아이디입니다.');
					}
				}
			});
		});
		$("input[name='pwd']").on('keyup', function(){
			var length = $(this).val();
			if(length<8 || length >16){
				$('#pwdCheck').css('color','red');
				$('#pwdCheck').css('font-size','12px');
				$('#pwdCheck').css('font-weight','bold');
				$('#pwdCheck').text("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요");
			}
				
		});
		
		$("input[name='pwdCheck']").on('keyup', function(){ //비밀번호 체크
			var pwd = $("input[name='pwd']").val();
			if(pwd !== $(this).val()){
				$('#matchingPwd').text('비밀번호가 일치하지 않습니다');
			}else{
				$('#matchingPwd').text('비밀번호가 일치합니다');
			}
		});
		
		$("input[name='nick']").on('keyup', function(){
			var nick = $(this).val();
			if(!nick){
				$('#nickCheck').text('닉네임을 입력하세요');
				return;
			}
			$.ajax({
				url:'${pageContext.request.contextPath}/users/nickCheck',
				data:{nick:nick},
				dataType:'json',
				type:'post',
				success:function(data){
					if(data.result === 'ok'){
						$('#nickCheck').text('사용가능한 닉네임입니다.');
					}else{
						$('#nickCheck').text('중복된 닉네임입니다.');
					}
				}
			});
		});
	});
</script>

<body style="background-color: rgb(245, 246, 247);">


	<div class="container">
	<div class="row" id=container_row>
		<a href="${pageContext.request.contextPath }/" style="text-decoration: none;color: black;"><h1 style="text-align:center; width:350px;">회원가입</h1></a>
		<form method="post" action="${pageContext.request.contextPath}/users/insert">
			<h3>아이디<h3>
			<input type="text" name="id" id="id" placeholder="아이디를 입력하세요" value="${users.id}"><br>
			<span id="idCheck"><form:errors path="users.id"/></span><br>
			<h3>비밀번호</h3>
			<input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" value="${users.pwd}"><br>
			<span id="pwdCheck"><form:errors path="users.pwd"/></span><br> 
			<h3>비밀번호 확인<h3>
			<input type="password" name="pwdCheck" id="password" placeholder="비밀번호를 확인하세요"><br>
			<span id="matchingPwd"></span><br>
			<h3>닉네임<h3>
			<input type="text" name="nick" id="nick" placeholder="닉네임을 입력하세요" value="${users.nick}"><br><span id="nickCheck"></span><br>
			<h3>이메일<h3>
			<input type="text" name="email" id="email" placeholder="이메일을 입력하세요" value="${users.email}">
			<select>
				<option value="">직접입력</option>
				<option value="@naver.com">@naver.com</option>
				<option value="@google.com">@google.com</option>
			</select>
			<span><form:errors path="users.email"/></span><br>
			<h3>주소<h3>
			<input type="text" name="addr" id="addr"><br>
			<h3>성별:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			<label for="m">남</label><input type="radio" name="gender" value="m" id="m">
			<label for="w">여</label><input type="radio" name="gender" value="w" id="w"><br><h3>
			
			<h3>전화번호<h3>
			<input type="text" name="phone" value="${users.phone}" id="phone"><br>
			<h3>생일<h3>
			<input type="date" name="birth" value="${users.birth}" id="birth"><br>
			<input type="submit" id="send"value="회원가입">
		</form>
		</div>
	</div>
</body>
</html>

