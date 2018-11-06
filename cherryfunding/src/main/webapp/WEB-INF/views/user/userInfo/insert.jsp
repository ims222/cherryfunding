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

<body>
	<h1>회원가입</h1>
	
	<form method="post" action="${pageContext.request.contextPath}/users/insert">
		아이디<input type="text" name="id" placeholder="아이디를 입력하세요" value="${users.id}">
		<span id="idCheck"><form:errors path="users.id"/></span><br>
		비밀번호<input type="password" name="pwd" placeholder="비밀번호를 입력하세요" value="${users.pwd}">
		<span id="pwdCheck"><form:errors path="users.pwd"/></span><br>
		비밀번호 확인<input type="password" name="pwdCheck" placeholder="비밀번호를 확인하세요"><span id="matchingPwd"></span><br>
		닉네임<input type="text" name="nick" placeholder="닉네임을 입력하세요" value="${users.nick}"><span id="nickCheck"></span><br>
		이메일<input type="text" name="email" placeholder="이메일을 입력하세요" value="${users.email}">
		<select>
			<option value="">직접입력</option>
			<option value="@naver.com">@naver.com</option>
			<option value="@google.com">@google.com</option>
		</select>
		<span><form:errors path="users.email"/></span><br>
		주소<input type="text" name="addr"><br>
		성별<br>
		<label for="m">남</label><input type="radio" name="gender" value="m" id="m">
		<label for="w">여</label><input type="radio" name="gender" value="w" id="w"><br>
		전화번호<input type="text" name="phone" value="${users.phone}"><br>
		생일<input type="date" name="birth" value="${users.birth}"><br>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>

